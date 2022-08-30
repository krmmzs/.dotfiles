local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- this is normal module keymap function like vimscript
local function nkeymap(key, map)
    keymap('n', key, map, opts)
end

--[[ config lsp keymap in lsp handers.lua function:lsp_keymaps ]]
--[[ nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>') ]]
--[[ nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>') ]]
--[[ nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>') ]]
--[[ nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>') ]]
--[[ nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>') ]]
--[[ nkeymap('gr', ':lua vim.lsp.buf.references()<cr>') ]]
--[[ nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>') ]]
--[[ nkeymap('K', ':lua vim.lsp.buf.hover()<cr>') ]]
--[[ nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>') ]]
--[[ nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>') ]]
--[[ nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>') ]]

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
