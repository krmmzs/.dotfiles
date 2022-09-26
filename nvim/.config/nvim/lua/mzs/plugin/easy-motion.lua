vim.g.EasyMotion_startofline = 0 -- keep cursor column when JK moti

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

local status_ok, configs = pcall(require, "hop")
if not status_ok then
    print("hop.lua config file have error")
    return
end

-- nmap <Leader>m <Plug>(easymotion-s)
nkeymap("<leader>m", "<Plug>(easymotion-s)")
-- "nmap <Leader>m <Plug>(easymotion-s2) " 2 characters
nkeymap("<leader><leader>l", "<Plug>(easymotion-lineforward)")
nkeymap("<leader><leader>j", "<Plug>(easymotion-j)")
nkeymap("<leader><leader>k", "<Plug>(easymotion-k)")
nkeymap("<leader><leader>h", "<Plug>(easymotion-linebackward)")
