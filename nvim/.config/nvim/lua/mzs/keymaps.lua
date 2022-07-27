local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Others
keymap("n", "Q", "<Nop>", opts)

keymap("n", "<leader>1", ":set relativenumber!<CR>", opts)

-- nmap <Leader>m <Plug>(easymotion-s)
keymap("n", "<leader>m", "<Plug>(easymotion-s)", opts)
-- "nmap <Leader>m <Plug>(easymotion-s2) " 2 characters
keymap("n", "<leader><leader>l", "<Plug>(easymotion-lineforward)", opts)
keymap("n", "<leader><leader>j", "<Plug>(easymotion-j)", opts)
keymap("n", "<leader><leader>k", "<Plug>(easymotion-k)", opts)
keymap("n", "<leader><leader>h", "<Plug>(easymotion-linebackward)", opts)

-- Plug Yggdroot/indentLine
-- :IndentLinesToggle toggles lines on and off.
keymap("n", "<leader>il", ":IndentLinesToggle<CR>", opts)


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

keymap("n", "<leader>e", ":Lex 35<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --

-- Visual --
    -- Stay in indent mode
    keymap("v", "<", "<gv", opts)
    keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "J", ":m .+1<CR>==gv", opts)
keymap("v", "K", ":m .-2<CR>==gv", opts)
keymap("v", "p", '"_dP', opts)

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
keymap("n", "<leader><Space>", ":FixWhitespace<CR>", opts)

-- undotree
keymap("n", "<leader>u", ":UndotreeToggle<CR>", opts)

-- Git
keymap("n", "<Leader>gh", ":diffget //3<CR>", opts)
keymap("n", "<Leader>gu", ":diffget //2<CR>", opts)
keymap("n", "<Leader>gs", ":G<CR>", opts)
keymap("n", "<Leader>gd", "Gvdiff<CR>", opts)
keymap("n", "<Leader>gb", "Git blame<CR>", opts)
keymap("n", "<Leader>gl", "Git log --all --graph --decorate<CR>", opts)

-- Plug preservim/nerdtree
keymap("n", "<Leader>no", ":NERDTreeFocus<CR>", opts)
-- nnoremap <Leader>nt :NERDTreeToggle<CR>
keymap("n", "<Leader>nt", ":NERDTreeTabsToggle<CR>", opts)
-- nnoremap <Leader>nf :NERDTreeFind<CR>
keymap("n", "<Leader>nf", ":NERDTreeTabsFind<CR>", opts)

-- coc Listextend --

-- Use <C-l> for trigger snippet expand.
-- keymap("i", "<C-l>", "<Plug>(coc-snippets-expand)", opts)

-- Use <C-j> for select text for visual placeholder of snippet.
-- keymap("i", "<C-j>", "<Plug>(coc-snippets-select)", opts)




