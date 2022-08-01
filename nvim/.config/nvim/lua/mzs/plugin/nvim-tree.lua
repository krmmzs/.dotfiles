-- see https://github.com/kyazdani42/nvim-tree.lua#setup
-- examples for your init.lua

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

-- mapping see https://github.com/kyazdani42/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt#L1077

nkeymap("<Leader>nt", ":NvimTreeToggle<CR>")
nkeymap("<Leader>nf", ":NvimTreeFindFile<CR>")

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})

