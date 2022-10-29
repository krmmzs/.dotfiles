require("mzs.set")
require("mzs.keymaps")
require("mzs.remap")
require("mzs.colorscheme")
require("mzs.plugins")
require("mzs.lsp")
require("mzs.plugin.nvim-web-devicons")

-- plugins Configs

-- fzf
require("mzs.plugin.telescope")
require("mzs.plugin.project")
require("mzs.plugin.leaderF")

-- UI
--[[ require("mzs.plugin.dashboard") ]]
require("mzs.plugin.context")
require("mzs.plugin.lspsaga")
require("mzs.plugin.bufferline")
--[[ require("mzs.plugin.vista")  -- replace by symbols-outline(using nvim-lsp)]]
require("mzs.plugin.lualine")
require("mzs.plugin.nvim-autopairs")
require("mzs.plugin.nvim-tree")
require("mzs.plugin.indentLine")
require("mzs.plugin.nvim-transparent")
-- [require("mzs.plugin.noice")
--[[ require("mzs.plugin.notify") ]]

-- LSP
require("mzs.plugin.lsp_lines")
require("mzs.lsp.null-ls")
require("mzs.plugin.goto-preview") -- well preview window for gd and more...
require("mzs.plugin.cmp")
require("mzs.plugin.LuaSnip")
require("mzs.plugin.tabnine")
require("mzs.plugin.symbols-outline") -- tarbar with lsp

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
--[[ require("mzs.plugin.hop") ]]

-- formatting
require("mzs.plugin.black") -- for python
require("mzs.plugin.vim-prettier") -- for web(js...)
require("mzs.plugin.comment")

-- git
require("mzs.plugin.diffview")
require("mzs.plugin.gitsigns")

-- ctags
-- skywind3000
-- https://www.zhihu.com/question/47691414/answer/373700711
require("mzs.plugin.vim-gutentags")

-- markdown
require("mzs.plugin.markdown-preview")

--[[ require("mzs.plugin.nvim-hlslens") ]]
-- require("mzs.plugin.impatient") -- required in nvim/init.lua
require("mzs.plugin.trouble")

-- terminal
require("mzs.plugin.toggleterm")

-- keymaps
-- require("mzs.plugin.which-key")

-- data-scient
require("mzs.plugin.magma-nvim")
require("mzs.plugin.jupytext") -- need jupyter firstly

-- cheat.sh
require("mzs.plugin.cheat-sh")

-- leatcode
require("mzs.plugin.leetcode")

-- translate
require("mzs.plugin.translate")

-- AI
require("mzs.plugin.copilot")

-- code
--[[ require("mzs.plugin.sandwich") ]]

-- selection search
require("mzs.plugin.vim-browser-search")
