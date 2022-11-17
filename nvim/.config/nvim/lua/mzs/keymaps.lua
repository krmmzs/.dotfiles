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

local function ckeymap(key, map)
    keymap('c', key, map, {})
end

local function xkeymap(key, map)
    keymap('x', key, map, opts)
end

-- Others
nkeymap("Q", "<Nop>")

nkeymap("<leader>1", ":set relativenumber!<CR>")


-- quic close highlight search
nkeymap("<Leader>l", ":noh<CR>")


-- quick :q
nkeymap("<c-q>", ":q<CR>")

-- quick copy to outside
nkeymap("vaey", 'ggVG"+y<c-o>')
nkeymap("vaep", 'ggVG"+p')

-- copy and paste in clipboard
vkeymap('<leader>y', '"+y')
nkeymap('<leader>p', '"+p')

-- greatest remap ever
--[[ xkeymap('<leader>p', "\"_dP") ]]

-- Keeping it contered
nkeymap("n", "nzz")
nkeymap("N", "Nzz")
nkeymap("J", "Jzz")
nkeymap("<c-o>", "<c-o>zz")
nkeymap("<c-i>", "<c-i>zz")
nkeymap("<c-d>", "<c-d>zz")
nkeymap("<c-u>", "<c-u>zz")

-- Jumplist mutations, solve jump list could save <number>j or <number>k
vim.cmd[[
noremap <expr> k (v:count > 1 ? "m'" . v:count : "") . 'k'
noremap <expr> j (v:count > 1 ? "m'" . v:count : "") . 'j'
]]

-- source: https://vim.fandom.com/wiki/Set_working_directory_to_the_current_file
-- change the directory only for the current window
-- (each window has a local current directory that can be
-- different from Vim's global current directory):
--nkeymap("\\\\", ":lcd %:p:h<CR>")
-- global
nkeymap("\\\\", ":cd %:p:h<CR>")

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- files navigation
nkeymap("<leader>e", ":Lex 35<cr>")

-- for jupyter notebook
--[[ nkeymap("<leader><leader>r", "vip<cmd>MagmaEvaluateOperator<CR>") ]]
--fail....


-- Resize with arrows
nkeymap("<C-Up>", ":resize +2<CR>")
nkeymap("<C-Down>", ":resize -2<CR>")
nkeymap("<C-Left>", ":vertical resize -2<CR>")



nkeymap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
nkeymap("]b", ":bnext<CR>")
nkeymap("[b", ":bprevious<CR>")

-- quick build a block with space
nkeymap("<leader>o", "o<ESC>O<CR>")


-- Insert --

-- Visual --
-- Stay in indent mode
--vkeymap("<", "<gv")
--vkeymap(">", ">gv")

-- Move text up and down -- but I don't use it...
--[[ vkeymap("J", ":m .+1<CR>==gv") ]]
--[[ vkeymap("K", ":m .-2<CR>==gv") ]]
--[[ vkeymap("p", '"_dP') ]] -- will make cmp select mode paste when type p...

-- Terminal --
-- Better terminal navigation
--[[ keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts) ]]
--[[ keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts) ]]
--[[ keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts) ]]
--[[ keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts) ]]



-- Plugins --

-- neoclide/coc.nvim
--keymap("n", "<leader>cd", ":CocDisable<CR>", opts)
--keymap("n", "<leader>ce", ":CocEnable<CR>", opts)

-- honza/vim-snippets

-- bronson/vim-trailing-whitespace
-- nkeymap("<leader><Space>", ":FixWhitespace<CR>")

-- undotree
nkeymap("<leader>u", ":UndotreeToggle<CR>")

-- vim-bbye
nkeymap("<leader>db", ":Bdelete<CR>") -- quick Bdelete current buffer

-- surround
-- see https://github.com/tpope/vim-surround/blob/f51a26d3710629d031806305b6c8727189cd1935/plugin/surround.vim#L603
vim.cmd[[
let g:surround_no_mappings = 1
nmap ds  <Plug>Dsurround
nmap cs  <Plug>Csurround
nmap cS  <Plug>CSurround
" nmap ys  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap S   <Plug>VSurround
xmap gS  <Plug>VgSurround
if !exists("g:surround_no_insert_mappings") || ! g:surround_no_insert_mappings
if !hasmapto("<Plug>Isurround","i") && "" == mapcheck("<C-S>","i")
imap    <C-S> <Plug>Isurround
endif
imap      <C-G>s <Plug>Isurround
imap      <C-G>S <Plug>ISurround
endif
]]
nkeymap("<leader><leader>1", "<Plug>Ysurroundiw*l")
nkeymap("<leader><leader>2", "<Plug>Ysurroundiw`")
nkeymap("<leader><leader>3", "<Plug>Ysurroundiw]")


-- coc Listextend --

-- Plug Yggdroot/indentLine
-- :IndentLinesToggle toggles lines on and off.
nkeymap("<leader>il", ":IndentLinesToggle<CR>")

nkeymap("<c-h>", "<c-w>h")
nkeymap("<c-j>", "<c-w>j")
nkeymap("<c-k>", "<c-w>k")
nkeymap("<c-l>", "<c-w>l")

-- See https://www.reddit.com/r/neovim/comments/ro6oye/open_link_from_neovim/
-- Becase gx is a netrw's functionality, using nvim-tree will cover this feature(QAQ).
-- But this solution still can't open local file in my computer(ubuntu20.04).
-- map helper
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- better gx mapping
map("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>', {})

-- Saner command-line history
-- see https://github.com/mhinz/vim-galore#saner-command-line-history
-- and see parctice vim tips 34
ckeymap("<c-n>", "<down>")
ckeymap("<c-p>", "<up>")

-- Quickly add empty lines
-- Now 5[<space> inserts 5 blank lines above the current line.
vim.cmd[[
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>
]]

-- Reload a file on saving
-- see https://github.com/mhinz/vim-galore#reload-a-file-on-saving
vim.cmd[[
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" autocmd BufWritePost ~/.Xdefaults call system('xrdb ~/.Xdefaults')
]]
