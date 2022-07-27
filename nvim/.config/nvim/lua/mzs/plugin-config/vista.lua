local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>vv", ":Vista!!<CR>", opts)
keymap("n", "<leader>vf", ":Vista finder fzf<CR>", opts)

-- vista config
vim.cmd[[
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction
]]
