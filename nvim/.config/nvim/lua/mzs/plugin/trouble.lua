-- None
-- using default https://github.com/folke/trouble.nvim#setup

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

local status_ok, configs = pcall(require, "trouble")
if not status_ok then
    return
end

nkeymap("<leader>xx", "<cmd>TroubleToggle<cr>")
nkeymap("<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>")
nkeymap("<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>")
nkeymap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nkeymap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nkeymap("gR", "<cmd>TroubleToggle lsp_references<cr>")

configs.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
