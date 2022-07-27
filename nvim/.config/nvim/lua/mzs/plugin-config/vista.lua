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


-- By default vista.vim never run if you don't call it explicitly.

-- If you want to show the nearest function in your statusline automatically,
-- you can add the following line to your vimrc
vim.cmd[[
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()
]]

vim.g.vista_default_executive = 'ctags' -- I use universal-ctags

vim.g.vista_executive_for = {
    cpp= 'coc',
    php= 'coc'
}

vim.g['vista#renderer#enable_icon'] = 1
