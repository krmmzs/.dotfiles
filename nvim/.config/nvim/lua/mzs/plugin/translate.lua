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

local status_ok, configs = pcall(require, "translate")
if not status_ok then
    return
end

nkeymap("<leader>ts", "<cmd>Translate ZH<CR>")
vkeymap("<leader>ts", "<cmd>Translate ZH<CR>")

vim.cmd[[
" let g:deepl_api_auth_key = 'MY_AUTH_KEY'
]]

configs.setup({
    default = {
        command = "translate_shell",
    },
    preset = {
        output = {
            split = {
                append = true,
            },
        },
    },
})
