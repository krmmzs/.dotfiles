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

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

nkeymap("<leader>ro", "<cmd>MagmaInit python3<CR>")
nkeymap("<leader>r", "<cmd>MagmaEvaluateOperator<CR>")
nkeymap("<leader>rr", ":MagmaEvaluateLine<CR>")
vkeymap("<leader>r", ":<C-u>MagmaEvaluateVisual<CR>")
nkeymap("<leader>rc", ":MagmaReevaluateCell<CR>")
nkeymap("<leader>rd", ":MagmaDelete<CR>")
nkeymap("<leader>rs", ":MagmaShowOutput<CR>")

vim.cmd[[
let g:magma_automatically_open_output = v:false
let g:magma_image_provider = "ueberzug"
]]
