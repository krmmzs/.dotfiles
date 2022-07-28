-- Disable virtual_text since it's redundant due to lsp_lines.
--vim.diagnostic.config({
  --virtual_text = false,
--})

local opts = { noremap = true, silent = true }

vim.keymap.set(
    "n",
    "<leader>1l",
    ":lua vim.diagnostic.config({virtual_text = true, virtual_lines = false})<CR>",
    opts
)

vim.keymap.set(
    "n",
    "<leader>2l",
    ":lua vim.diagnostic.config({virtual_text = false, virtual_lines = true})<CR>",
    opts
)
