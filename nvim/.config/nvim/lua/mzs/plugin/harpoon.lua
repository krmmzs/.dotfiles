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

nkeymap("<leader>a", ":lua require('harpoon.mark').add_file()<CR>")
nkeymap("<leader>ww", ":lua require('harpoon.ui').toggle_quick_menu()<CR>")
nkeymap("<leader>fw", ":Telescope harpoon marks<CR>")

nkeymap("<leader>w1", ":lua require('harpoon.ui').nav_file(1)<CR>")
nkeymap("<leader>w2", ":lua require('harpoon.ui').nav_file(2)<CR>")
nkeymap("<leader>w3", ":lua require('harpoon.ui').nav_file(3)<CR>")
nkeymap("<leader>w4", ":lua require('harpoon.ui').nav_file(4)<CR>")
nkeymap("<leader>w5", ":lua require('harpoon.ui').nav_file(5)<CR>")
