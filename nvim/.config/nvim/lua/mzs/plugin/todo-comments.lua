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

local status_ok, configs = pcall(require, "todo-comments")
if not status_ok then
    return
end

-- using telescope now
-- nkeymap("<leader>td", ":TodoQuickFix<cr>")

-- see https://github.com/folke/todo-comments.nvim#%EF%B8%8F-configuration
configs.setup {

}
