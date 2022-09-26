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


-- https://github.com/nvim-telescope/telescope.nvim/issues/592#issuecomment-789069837
-- found a plugin airblade/vim-rooter, It can find project root according to the file I set
-- for telescope find_files

nkeymap("<leader>rr", ":Rooter<cr>")
nkeymap("<leader>rt", ":RooterToggle<cr>")

vim.g.rooter_manual_only = 1
-- To specify the root is a certain directory, prefix it with =.
-- To specify the root has a certain directory or file (which may be a glob), just give the name.
-- To specify the root has a certain directory as an ancesttr (useful for excluding directories), prefix it with ^.
-- To exclude a pattern, prefix it with !.
vim.g.rooter_patterns = {'=src', '.git', '.root', 'Makefile'}
