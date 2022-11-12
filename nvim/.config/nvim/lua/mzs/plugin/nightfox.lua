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

require('nightfox').setup({
  options = {
    fox = 'dayfox',
    transparent = false,
    modules = {
      cmp = true,
      gitsigns = true,
      lsp_trouble = true,
      native_lsp = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
    },
  },
  groups = {
    dayfox = {
      LineNr = { fg = 'bg4'},
    },
  },
})

-- setup must be called before loading
--[[ vim.cmd("colorscheme dayfox") ]]
