local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

require'nvim-treesitter.configs'.setup {
  -- install language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = {
        "vim",
        "lua",
        "html",
        "css",
        "javascript",
        "java",
        "c",
        "cpp",
        "python"
    },

  -- enable code highlight feature
  highlight = {
    enable = true
  },

  -- 启用增量选择
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<CR>',
      node_incremental = '<CR>',
      node_decremental = '<BS>',
      scope_incremental = '<TAB>',
    }
  },
  -- 启用基于Treesitter的代码格式化(=) . NOTE: This is an experimental feature.
  indent = {
    enable = true
  }
}

-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
keymap("n", "<Leader><Leader>l", ":TSBufToggle highlight<CR>", opts)
