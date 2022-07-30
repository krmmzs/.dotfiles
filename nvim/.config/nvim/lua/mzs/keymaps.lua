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

-- Others
nkeymap("Q", "<Nop>")

nkeymap("<leader>1", ":set relativenumber!<CR>")

-- nmap <Leader>m <Plug>(easymotion-s)
nkeymap("<leader>m", "<Plug>(easymotion-s)")
-- "nmap <Leader>m <Plug>(easymotion-s2) " 2 characters
nkeymap("<leader><leader>l", "<Plug>(easymotion-lineforward)")
nkeymap("<leader><leader>j", "<Plug>(easymotion-j)")
nkeymap("<leader><leader>k", "<Plug>(easymotion-k)")
nkeymap("<leader><leader>h", "<Plug>(easymotion-linebackward)")

-- copy and paste
vkeymap('<leader>y', '"+y')

-- Keeping it contered
nkeymap("n", "nzz")
nkeymap("N", "Nzz")
nkeymap("J", "mzsJ'z")

-- Jumplist mutations, solve jump list could save <number>j or <number>k
vim.cmd[[
noremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
noremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
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
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)



-- Plugins --

-- neoclide/coc.nvim
--keymap("n", "<leader>cd", ":CocDisable<CR>", opts)
--keymap("n", "<leader>ce", ":CocEnable<CR>", opts)

-- honza/vim-snippets

-- bronson/vim-trailing-whitespace
nkeymap("<leader><Space>", ":FixWhitespace<CR>")

-- undotree
nkeymap("<leader>u", ":UndotreeToggle<CR>")

-- Git
nkeymap("<Leader>gh", ":diffget //3<CR>")
nkeymap("<Leader>gu", ":diffget //2<CR>")
nkeymap("<Leader>gs", ":G<CR>")
nkeymap("<Leader>gd", ":Gvdiff<CR>")
nkeymap("<Leader>gb", ":Git blame<CR>")
nkeymap("<Leader>gl", ":Git log --all --graph --decorate<CR>")


-- coc Listextend --

-- Plug Yggdroot/indentLine
-- :IndentLinesToggle toggles lines on and off.
nkeymap("<leader>il", ":IndentLinesToggle<CR>")
