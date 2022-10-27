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
    keymap('c', key, map, opts)
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

-- Resize with arrows
nkeymap("<C-Up>", ":resize +2<CR>")
nkeymap("<C-Down>", ":resize -2<CR>")
nkeymap("<C-Left>", ":vertical resize -2<CR>")
nkeymap("<C-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
nkeymap("<S-l>", ":bnext<CR>")
nkeymap("<S-h>", ":bprevious<CR>")

-- Insert --

-- Visual --
-- Stay in indent mode
--vkeymap("<", "<gv")
--vkeymap(">", ">gv")

-- Move text up and down
vkeymap("J", ":m .+1<CR>==gv")
vkeymap("K", ":m .-2<CR>==gv")
vkeymap("p", '"_dP')

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
nkeymap("<leader>df", ":Bdelete<CR>") -- quick Bdelete current file


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
ckeymap("<c-n>", "<down>")
ckeymap("<c-p", "<up>")

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
