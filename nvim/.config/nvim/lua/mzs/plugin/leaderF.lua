local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>h", ":LeaderfSelf<CR>", opts)
-- keymap("n", "<C-f>", ":LeaderfFile<CR>", opts)
keymap("n", "<c-t>", ":LeaderfBufTag<CR>", opts)
--[[ keymap("n", "<leader>ff", ":LeaderfFunction<CR>", opts) -- is replaced by Telescope.lsp_document_symbols, it can distinguish constrctor and method ]]
-- keymap("n", "<leader>fm", ":LeaderfMarks<CR>", opts)
-- keymap("n", "<leader>fr", ":LeaderfRgInteractive<CR>", opts)
-- keymap("n", "<leader>fe", ":LeaderfRgRecall<CR>", opts)
-- keymap("n", "<leader>fb", ":LeaderfBuffer<CR>", opts)
keymap("n", "<C-p>", ":LeaderfMru<CR>", opts)

-- nnoremap <Leader>fd :Leaderf filer<CR> "using <C-f> to call filer
-- and type "!" to fuzzy serach, and type "Tab" to return back
-- To enable popup mode
vim.g.Lf_WindowPosition = 'popup'
vim.g.Lf_PreviewInPopup = 1
-- leaderf 会自动从项目根目录(用.git来定位root)往下搜索文件(如果有.git)
vim.g.Lf_WorkingDirectoryMode = 'a'
vim.g.Lf_RootMarkers = {'.git', '.hg', '.svn', '.root'}
