let mapleader = ","
nnoremap ,, ,


set nocompatible


"Mode Settings

if !has('nvim')
    let &t_SI.="\e[5 q" "SI = INSERT mode
    let &t_SR.="\e[4 q" "SR = REPLACE mode
    let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)
endif

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"vim-plug Automatic installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


call plug#begin('~/.vim/plugged')

" withespace delete
Plug 'bronson/vim-trailing-whitespace'
nnoremap <Leader><space> :FixWhitespace<CR>

"LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wellle/tmux-complete.vim'
nnoremap <Leader>cd :CocDisable<CR>
nnoremap <Leader>ce :CocEnable<CR>

"异步编译运行
"Plug 'skywind3000/asyncrun.vim'
" 自动打开 quickfix window ，高度为 6
"let g:asyncrun_open = 6
" 任务结束时候响铃提醒
"let g:asyncrun_bell = 1
" 设置 <Leader>0 打开/关闭 Quickfix 窗口
"nnoremap <Leader>0 :call asyncrun#quickfix_toggle(6)<cr>
" 在vim里编译当前文件(c++)
"nnoremap <silent> <Leader>9 :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" using vimux now(in my .vim/plugin)

"coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

let g:coc_snippet_next = '<tab>'

"debugging
Plug 'puremourning/vimspector'

" Snippets
Plug 'honza/vim-snippets'
let g:UltiSnipsSnippetDirectories=["UltiSnips","mysnippets"]

" vim theme
Plug 'liuchengxu/space-vim-theme' " It's best theme both vim and tmux in light now!!!
Plug 'morhetz/gruvbox'
Plug 'luisiacc/gruvbox-baby'

" vim airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"let g:airline_theme='light'
let g:airline#extensions#tabline#enabled = 1 "Automatically displays all buffers when there's only one tab open

"上述命令会使状态栏显示文件路径、模式、文件类型、文件编码、所在行数与列数，
"以及光标所在处是文件的百分之多少。配合 vim-airline 插件使用效果更佳。
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ [%{(&fenc==\"\"?&enc:&fenc).(&bomb?\",BOM\":\"\")}]\ %c:%l/%L%)

"Smarter tab line
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_alt_sep = '|'

" vim Floaterm
Plug 'voldikss/vim-floaterm'
let g:floaterm_keymap_new = '<Leader>lb'
let g:floaterm_keymap_next = '<Leader>ln'
let g:floaterm_keymap_prev   = '<Leader>lp'
let g:floaterm_keymap_toggle = '<Leader>ll'
let g:floaterm_keymap_kill = '<Leader>lk'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8

" tmuxline in vim, but I don't like it now using LeaderF to replace it
"Plug 'edkolev/tmuxline.vim'

" shellcheck
Plug 'neomake/neomake'

" serach vim do history
Plug 'mbbill/undotree'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'
nmap <Leader>gh :diffget //3<CR>
nmap <Leader>gu :diffget //2<CR>
nmap <Leader>gs :G<CR>
nmap <Leader>gd :Gvdiff<CR>
nmap <Leader>gb :Git blame<CR>
nmap <Leader>gl :Git log --all --graph --decorate<CR>

" 文件浏览器
Plug 'preservim/nerdtree'
"Just one NERDTree, always and ever. It will always look the same in all tabs, including expanded/collapsed nodes, scroll position etc.
" When you close a file, the tab closes with it. No NERDTree hanging open.
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin' "A plugin of NERDTree showing git status flags.
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' "add highlight

" vim for markdown
Plug 'godlygeek/tabular' "自动对齐
Plug 'preservim/vim-markdown' "write markdown better
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  } "预览

" add comment quikly
Plug 'preservim/nerdcommenter'

" move in vim
" 使用 mm 启用
Plug 'easymotion/vim-easymotion'
nmap <Leader>m <Plug>(easymotion-s)
"nmap <Leader>m <Plug>(easymotion-s2) " 2 characters
nmap <Leader><Leader>l <Plug>(easymotion-lineforward)
nmap <Leader><Leader>j <Plug>(easymotion-j)
nmap <Leader><Leader>k <Plug>(easymotion-k)
nmap <Leader><Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK moti
" Move to line
"nmap <Leader><Leader>l <Plug>(easymotion-bd-jk)

" Surround.vim is all about "surroundings": parentheses, brackets, quotes
"Plug 'tpope/vim-surround'
"Plug 'davidhalter/jedi-vim'
Plug 'machakann/vim-sandwich'
             "|<----ib,is---->|
"{surrounding}{surrounded text}{surrounding}
"|<-----------------ab,as----------------->|


" Capture the map by
"Plug 'tpope/vim-repeat'

" textobj
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire' "整个文件
Plug 'bps/vim-textobj-python' "python
Plug 'kana/vim-textobj-indent' "同缩进
Plug 'sgur/vim-textobj-parameter' "函数参数

"它新定义的文本对象主要有：
"i, 和 a, ：参数对象，写代码一半在修改，现在可以用 di, 或 ci, 一次性删除/改写当前参数
"ii 和 ai ：缩进对象，同一个缩进层次的代码，可以用 vii 选中，dii / cii 删除或改写

" Rainbow Parentheses Improved
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
nnoremap <Leader>rr :RainbowToggle<CR>

" vim cpp
Plug 'octol/vim-cpp-enhanced-highlight'

" vim python
"yapf for python
"noremap <Leader>pf :1,$!yapf<CR>
Plug 'vim-python/python-syntax' " syntax for python
Plug 'psf/black', { 'branch': 'stable' }
autocmd BufWritePre *.py execute ':Black'

" https://wakatime.com/
Plug 'wakatime/vim-wakatime'

" vim indentLine, if you write pyton,it may have worth for you
Plug 'Yggdroot/indentLine'
let g:indentLine_setColors = 0 "highlight conceal color with my colorscheme
let g:indentLine_enabled = 0 "Disable by default
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"Commands
":IndentLinesToggle toggles lines on and off.
nnoremap <Leader>il :IndentLinesToggle<CR>

" snipmate 套件
" 自动补全，因为使用coc.nvim LSP而弃用
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate'

" check syntax for vim but now, I use LSP, such as Coc
"Plug 'w0rp/ale'
"Plug 'scrooloose/syntastic'

"write web better
Plug 'ap/vim-css-color' "show color
Plug 'mattn/emmet-vim'
Plug 'othree/xml.vim'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
"which format html,css,js,markdown if they have/support the \"@format\" pragma annotation in the header of the file
let g:prettier#autoformat = 1 "Enable auto formatting of files that have \"@format\" or \"@prettier\" tag

"find ctags, functions and files in vim
set tags=./.tags;,.tags

Plug 'ludovicchabant/vim-gutentags' "build ctags auto and silent
Plug 'liuchengxu/vista.vim' "replace tagbar which could support LSP
noremap <Leader>vv :Vista!!<CR>
noremap <Leader>vf :Vista finder fzf<CR>

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'tamago324/LeaderF-filer'
Plug 'Yggdroot/LeaderF-marks'
nnoremap <C-h> :LeaderfSelf<CR>
nnoremap <C-f> :LeaderfFile<CR>
nnoremap <Leader>ft :LeaderfBufTag<CR>
nnoremap <Leader>ff :LeaderfFunction<CR>
nnoremap <Leader>fm :LeaderfMarks<CR>
nnoremap <Leader>fr :LeaderfRgInteractive<CR>
nnoremap <Leader>fe :LeaderfRgRecall<CR>
nnoremap <Leader>fb :LeaderfBuffer<CR>
"nnoremap <Leader>fd :Leaderf filer<CR> "using <C-f> to call filer
"and type "!" to fuzzy serach, and type "Tab" to return back
"To enable popup mode
"let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
"  leaderf 会自动从项目根目录(用.git来定位root)往下搜索文件(如果有.git)
let g:Lf_WorkingDirectoryMode = 'a'
let g:Lf_RootMarkers = ['.git', '.hg', '.svn', '.root']

" FZF Vim integration
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
"Plug 'stsewd/fzf-checkout.vim'
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8} }
"let $FZF_DEFAULT_OPTS='--reverse'

"vim-gutentags config

" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxl']
let g:gutentags_ctags_extra_args += ['--c-kinds=+pxl']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 检测 ~/.cache/tags 不存在就新建
"if !isdirectory(s:vim_tags)
   "silent! call mkdir(s:vim_tags, 'p')
"endif

" vista config
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

let g:vista_default_executive = 'ctags' "I use universal-ctags
let g:vista_executive_for = {
  \ 'cpp': 'coc',
  \ 'php': 'coc',
  \ }

"let g:vista_ctags_cmd = {
      "\ 'haskell': 'hasktags -x -o - -c',
      "\ 'cpp': 'ctags -R --c++-kinds=+plxcdefgmnstuv --fields=+liaS --extra=+q',
      "\ }

let g:vista#renderer#enable_icon = 1


" vim marks
Plug 'kshenoy/vim-signature'

" vim look
Plug 'mhinz/vim-startify' "启动屏幕
Plug 'ryanoasis/vim-devicons' "icons for them

" auto pair
Plug 'jiangmiao/auto-pairs' "better than cocexention"

""""""""""""""""""""""""""""""""""""""
" nvim and vim difference plug
if has('nvim')
    "Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    "Plug 'nvim-treesitter/playground'

    " Install deoplete for code completion. Because my coc-comrade is error
    " now
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    " for JetBrains IDE
    " and use coc-comrade
    Plug 'beeender/Comrade'

    " config
    "let g:deoplete#enable_at_startup = 1
else


endif

call plug#end()

" map command to hotkey
nnoremap <Leader>u :UndotreeToggle<CR>
nnoremap <Leader>no :NERDTreeFocus <CR>
"nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nt :NERDTreeTabsToggle<CR>
"nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>nf ::NERDTreeTabsFind <CR>
inoremap <Leader>p <ESC>"+p
vnoremap <Leader>y "+y
map <Leader>1 :set relativenumber!<CR>

" vimux
nnoremap <Leader>t :VimuxRunCommand("")


"buffer
"nnoremap <Leader>bn :bn<CR>
"nnoremap <Leader>bp :bp<CR>
"useless any more, change it to :bn or :bp and @:(noraml) and @@ to repeat it

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if !has('nvim')
endif

" allow backspacing over everything in insert mode
" 默认情况下换行符是不可被删除的，除非使用 dd 命令或者 J 命令才可做到。如下配置可以解除这种限制
set backspace=indent,eol,start

"打开文件时恢复光标位置
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/home/mouzaisi/.vimundo/

set history=100 "keep 100 lines of command line history
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set hlsearch "设置高亮搜索

"语法高亮
syntax enable
syntax on

"solve在终端中按 ESC 后有延时
set timeout           " for mappings
set timeoutlen=1000   " default value
set ttimeout          " for key codes
set ttimeoutlen=100    " unnoticeable small value

"显示行号
set nu
set relativenumber " 相对

" 增加鼠标行高亮
set cursorline

"取消视觉多行
"set nowrap

"修改默认注释颜色
hi Comment ctermfg=DarkCyan

" Disable inserting comment leader after hitting o or O or <Enter>
set formatoptions-=o
set formatoptions-=r

"启用鼠标可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
"按C语言格式缩进
set cindent
set autoindent
set smartindent
set shiftwidth=4

" 允许在有未保存的修改时切换缓冲区
" and make coc.nvim better
set hidden

" 设置无备份文件
set writebackup
set nobackup

"显示括号匹配
set showmatch
"括号匹配显示时间为1(单位是十分之一秒)
set matchtime=5
"在状态栏显示正在输入的命令
set showcmd

" 移至当前文件所在目录
set autochdir

"set foldmethod=manual
"默认情况下不折叠
"set foldlevel=100
" 开启状态栏信息 Always show the status line at the bottom, even if you only have one window open.
set nofoldenable
set laststatus=2
" 命令行的高度，默认为1，这里设为2
set cmdheight=2

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
" 当'ignorecase'和'smartcase'都打开时，如果模式包含大写字母，则区分大小写，否则不区分大小写。
set ignorecase
set smartcase

"using vim list and listchars options to show hidden something
" enable list mode
"set list
" dsiplay chars for tabs and trailing space
"set listchars=tab:>-,trail:-

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

"侦测文件类型
filetype on
"载入文件类型插件
filetype plugin on
"为特定文件类型载入相关缩进文件
filetype indent on
" 启用自动补全
filetype plugin indent on


"设置编码自动识别, 中文引号显示
"set fileencodings=euc-cn,ucs-bom,utf-8,cp936,gb2312,gb18030,gbk,big5,euc-jp,euc-kr,latin1
set fileencodings=utf-8,gb2312,gbk,gb18030
"这个用能很给劲，不管encoding是什么编码，都能将文本显示汉字
"set termencoding=gb2312
set termencoding=utf-8
"新建文件使用的编码
set fileencoding=utf-8
"set fileencoding=gb2312
"用于显示的编码，仅仅是显示
set encoding=utf-8
"set encoding=utf-8
"set encoding=euc-cn
"set encoding=gbk
"set encoding=gb2312
"set ambiwidth=double
set fileformat=unix

" 着色模式
set t_Co=256
"colorscheme wombat256mod
"colorscheme gardener
"colorscheme elflord
"colorscheme desert
"colorscheme evening
"colorscheme darkblue
"colorscheme torte
"colorscheme default

"colorscheme ayu

"alacritty true Support \"True" (24-bit color)
" https://github.com/alacritty/alacritty/issues/109#issuecomment-859990495
"" using gruvbox
"colorscheme gruvbox
"set background=dark
"highlight ColorColumn ctermbg=0 guibg=lightgrey
"let g:airline_theme='hybrid'
"if you want 256 ture color: uncomment them, but I think it is better in 256 false color is better, hhh
"if exists('+termguicolors')
  "let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  "set termguicolors
"endif

"using space_vim_theme
set background=light
colorscheme space_vim_theme
highlight CursorLine   cterm=NONE ctermbg=white ctermfg=NONE guibg=NONE guifg=NONE
let g:airline_theme='papercolor'

"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue

""""""""""""""""""""
"hi CursorLine  cterm=NONE   ctermbg=darkred ctermfg=white
"autocmd ColorScheme * highlight! Cursorline cterm=bold ctermbg=236 guibg=Grey90
"autocmd ColorScheme * highlight! CursorLineNr cterm=bold ctermfg=159 ctermbg=236 guibg=Grey90

" Highlight the symbol and its references when holding the cursor.
"autocmd CursorHold * silent call CocActionAsync('highlight')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 字体 && 字号
"set guifont=Monaco:h12
"set guifont=Consolas:h10
 set guifont=Monaco\ Nerd\ Font\ 12 " vim in linux
"set guifont=Monacot\ 12

"markdown code highlight
"let g:markdown_fenced_languages = ['html','python','c++','vim','java']

"mymap
"open terminal to solve small project in vim now pwd
nnoremap \\ :cd %:h<CR> :terminal<CR>

"give the break point to undo
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap <CR> <CR><c-g>u

"Y as same meran like D and C
nnoremap Y y$

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Keeping it contered
nnoremap n nzz
nnoremap N Nzz
nnoremap J mzJ'z

"Jumplist mutations, solve jump list could save <number>j or <number>k
noremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
noremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" html add label

" run python3 in vim
map <Leader>8 :w<CR>:! clear; python3 %<CR>

" run javac in vim
map <Leader>7 :w<CR>:! ; javac %<CR>

"back to
noremap <Leader>w <C-W>w

" change 同行{到下一行
noremap <Leader>{ :%s/ {/\r{/g<CR> gg=G


" ======= 引号 && 括号自动匹配 ======= "
"
":inoremap ( ()<ESC>i

":inoremap ) <c-r>=ClosePair(')')<CR>

"输入大括号后马上按回车
:inoremap {<CR> {<CR>}<ESC>O

":inoremap { {}<ESC>i

":inoremap } <c-r>=ClosePair('}')<CR>

":inoremap [ []<ESC>i

":inoremap ] <c-r>=ClosePair(']')<CR>

":inoremap < <><ESC>i

":inoremap > <c-r>=ClosePair('>')<CR>

":inoremap " ""<ESC>i

":inoremap ' ''<ESC>i

":inoremap ` ``<ESC>i

":inoremap * **<ESC>i

"function ClosePair(char)
    "if getline('.')[col('.') - 1] == a:char
        "return "\<Right>"
    "else
        "return a:char
    "endif
"endif
"endfunction


" 每行超过80个的字符用下划线标示
""au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.java,*.cs,*.lisp,*.el,*.erl,*.tex,*.sh,*.lua,*.pl,*.php,*.tpl,*.py,*.rb,*.erb,*.vim,*.js,*.jade,*.coffee,*.css,*.xml,*.html,*.shtml,*.xhtml Underlined /.\%81v/

" Don't use Ex mode, use Q for formatting
nnoremap Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif


" 设置tab是四个空格
set ts=4
set expandtab " tab原本的制表符改成空格

" 命令行按 tab 补全时，显示一个候选菜单
" 同时如果安装了oh-my-zsh，会支持zsh
set wildmenu
set wildmode=full

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" coc config
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" But it will conflict with vim-snippet when I want to complete instead jump
" to next position
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ CheckBackspace() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! CheckBackspace() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

"Use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" I love it !!!
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

"" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)

"augroup mygroup
"  autocmd!
"  " Setup formatexpr specified filetype(s).
"  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"  " Update signature help on jump placeholder.
"  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
"augroup end
"
"" Applying codeAction to the selected region.
"" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
"
"" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
"" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Run the Code Lens action on the current line.
"nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
" but I'am using plugin for my textobj
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Remap <C-f> and <C-b> for scroll float windows/popups.
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif
"
"" Use CTRL-S for selections ranges.
"" Requires 'textDocument/selectionRange' support of language server.
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
"" Add `:Format` command to format current buffer.
"command! -nargs=0 Format :call CocActionAsync('format')
"
"" Add `:Fold` command to fold current buffer.
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer.
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" NOTE: Please see `:h coc-status` for integrations with external plugins that
" Add (Neo)Vim's native statusline support.
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nevim config

if has('nvim')
    "To map <Esc> to exit terminal-mode:
    :tnoremap <Esc> <C-\><C-n>
    set clipboard+=unnamedplus
endif
if !has('nvim')
    set ttymouse=xterm2
endif
