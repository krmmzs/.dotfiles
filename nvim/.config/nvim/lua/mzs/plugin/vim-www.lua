local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local function nkeymap(key, map)
	keymap("n", key, map, opts)
end
local function vkeymap(key, map)
	keymap("v", key, map, opts)
end
local function ikeymap(key, map)
	keymap("i", key, map, opts)
end

vim.cmd[[
let g:www_engines = {
  \ '1' : 'https://dictionary.cambridge.org/dictionary/english-chinese-simplified/',
  \ }
]]
