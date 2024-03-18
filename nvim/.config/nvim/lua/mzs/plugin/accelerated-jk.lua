local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local function nkeymap(key, map)
    keymap('n', key, map, opts)
end
local function vkeymap(key, map)
    keymap('v', key, map, opts)
end
local function ikeymap(key, map)
    keymap('i', key, map, opts)
end

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    --[[ mode = 'time_driven', ]]
    mode = 'position_driven',
    enable_deceleration = false,
    acceleration_motions = {},
    acceleration_limit = 150,
    --[[ acceleration_table = { 7,12,17,21,24,26,28,30 }, ]]
    acceleration_table = { 1, 100 },
    -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
    deceleration_table = { {150, 9999} },

    vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {}),
    vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
})
