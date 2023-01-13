
vim.cmd[[
" colorscheme space_vim_theme
" set background=light
" highlight CursorLine   cterm=NONE ctermbg=white ctermfg=NONE guibg=NONE guifg=NONE

" colorscheme gruvbox
" set background=dark

" let ayucolor="light"  " for light version of theme
" set termguicolors     " enable true colors support
" colorscheme ayu
" let g:transparent_enabled = v:false

" neovim-ayu
" set background=light " neovim-ayu respect background

" let g:transparent_enabled = v:false

" colorscheme nightfox
" let g:transparent_enabled = v:false
]]

-- my light theme
vim.cmd[[
" catppuccin/nvim
colorscheme catppuccin-latte
" let g:transparent_enabled = v:false
let g:transparent_enabled = v:true
set background=light " for leaderF and more other plugins.
]]

-- tokyonight
-- configuration needs to be set BEFORE loading the color scheme with colorscheme tokyonight
--[[ vim.g.tokyonight_transparent_sidebar = true ]]
--[[ vim.g.tokyonight_transparent = true ]]
vim.cmd[[
" colorscheme tokyonight
" set background=dark " for leaderF and more other plugins.
" let g:transparent_enabled = v:true " https://github.com/xiyaowong/nvim-transparent

" colorscheme tokyonight-day
" set background=light " for leaderF and more other plugins.
" let g:transparent_enabled = v:false
]]

-- neovim-ayu
--[[ require('ayu').colorscheme() ]]

-- github-nvim-theme
--[[ require('github-theme').setup() ]]

