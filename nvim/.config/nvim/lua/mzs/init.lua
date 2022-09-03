require("mzs.set")
require("mzs.keymaps")
require("mzs.remap")
require("mzs.colorscheme")
require("mzs.lsp")

require("mzs.plugins")

-- plugins Configs

-- fzf
require("mzs.plugin.telescope")
require("mzs.plugin.project")
require("mzs.plugin.leaderF")

-- UI
require("mzs.plugin.dashboard")
require("mzs.plugin.context")
require("mzs.plugin.lspsaga")
require("mzs.plugin.bufferline")
require("mzs.plugin.vista")
require("mzs.plugin.lualine")
require("mzs.plugin.nvim-autopairs")
require("mzs.plugin.nvim-tree")
require("mzs.plugin.indentLine")

-- LSP
require("mzs.plugin.cmp")
require("mzs.plugin.lsp_lines")
require("mzs.lsp.null-ls")
require("mzs.plugin.goto-preview") -- well preview window for gd and more...

-- treesitter
require("mzs.plugin.nvim-treesitter")
require("mzs.plugin.treesitter-context")

-- project
-- require("mzs.plugin.vim-rooter") -- replace by pulugin:project.nvim
require("mzs.plugin.mason")
require("mzs.plugin.todo-comments")

-- web
require("mzs.plugin.emmet")

-- move
--[[ require("mzs.plugin.easy-motion") ]]
require("mzs.plugin.hop")

-- formatting
-- require("mzs.plugin.black") -- for python , replaced by null-ls.nvim
require("mzs.plugin.vim-prettier") -- for web(js...)
require("mzs.plugin.comment")

-- git
require("mzs.plugin.diffview")
require("mzs.plugin.gitsigns")
require("mzs.plugin.vim-gutentags")


require("mzs.plugin.nvim-hlslens")
-- require("mzs.plugin.impatient") -- required in nvim/init.lua
require("mzs.plugin.trouble")
