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

local status_ok, configs = pcall(require, "transparent")
if not status_ok then
    return
end

configs.setup({
    enable = true, -- boolean: enable transparent
    extra_groups = { -- table/string: additional groups that should be cleared
        -- In particular, when you set it to 'all', that means all available groups

        -- example of akinsho/nvim-bufferline.lua
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        "BufferLineFill",
        "BufferLineSeparator",
        "BufferLineIndicatorSelected",
    },
    exclude = {
        "BufferLineBackground",
    }, -- table: groups you don't want to clear
})
