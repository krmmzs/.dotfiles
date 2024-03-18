-- https://github.com/folke/lazy.nvim#-installation
-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none", "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    print("that did't work")
    return
end

-- vim plugin
vim.cmd[[
    runtime macros/matchit.vim
]]

-- Install your plugins here
lazy.setup({
    "nvim-lua/popup.nvim",  -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim",  -- Useful lua functions used ny lots of plugins
    'kyazdani42/nvim-web-devicons', 


    'wakatime/vim-wakatime', 

    -- UI
    { 'kshenoy/vim-signature' }, -- vim marks
    --{ 'mhinz/vim-startify' } -- vim look
    --[[ { 'ryanoasis/vim-devicons' } -- icons for them ]]
    --[[ { 'glepnir/dashboard-nvim' } -- dashboard ]]
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true }
    },
    { 'kkharji/lspsaga.nvim' },  -- nightly
    {'akinsho/bufferline.nvim', version = "v2.*", dependencies = 'kyazdani42/nvim-web-devicons'},
    {'moll/vim-bbye'}, -- Bdelete
    {'xiyaowong/nvim-transparent'},

    -- colorscheme
    'folke/tokyonight.nvim',
    'morhetz/gruvbox',
    'luisiacc/gruvbox-baby',
    'liuchengxu/space-vim-theme',
    'Shatur/neovim-ayu',
    --[[ { 'projekt0n/github-nvim-theme' }, ]] -- bad support some other plugin like buufflie...
    "EdenEast/nightfox.nvim", -- need a time to explote this plugin, but it's cool
    { "catppuccin/nvim", name = "catppuccin" },

    -- use native lsp now
    -- {'neoclide/coc.nvim', branch = 'master', build = 'yarn install --frozen-lockfile'},
    -- 'honza/vim-snippets',

    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    { 'nvim-treesitter/playground' },
    { "p00f/nvim-ts-rainbow" },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'JoosepAlviste/nvim-ts-context-commentstring' },
    { 'nvim-treesitter/nvim-treesitter-context' },

    {'neomake/neomake'},
    {'mbbill/undotree'},

    -- Git
    {'tpope/vim-fugitive'},
    {'tpope/vim-rhubarb'},
    -- {'airblade/vim-gitgutter'},
    {'junegunn/gv.vim'},
    -- Vim's diff mode is pretty good, but there is no convenient
    -- way to quickly bring up all modified files in a diffsplit.
    -- This plugin aims to provide a simple, unified, single tabpage
    -- interface that lets you easily review all changed files for any git rev.
    { 'sindrets/diffview.nvim', dependencies = 'nvim-lua/plenary.nvim' },
    {"lewis6991/gitsigns.nvim"},
    {"rhysd/git-messenger.vim"},

    -- Navigation
    -- {'preservim/nerdtree'}
    -- {'jistr/vim-nerdtree-tabs'}
    -- {'Xuyuanp/nerdtree-git-plugin'} -- A plugin of NERDTree showing git status flags.
    -- {'tiagofumo/vim-nerdtree-syntax-highlight'} --add highlight
    {
        'kyazdani42/nvim-tree.lua',
        dependencies = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        version = 'nightly' -- optional, updated every week. (see issue #1193)
    },
    { 'ThePrimeagen/harpoon' },

    -- Move
    --[[ { -- replace easy-motion(deal with bad buffer show) ]]
    --[[     'phaazon/hop.nvim', ]]
    --[[     branch = 'v2', -- optional but strongly recommended ]]
    --[[ } ]]


    -- Format
    {'psf/black'},
    {
        'prettier/vim-prettier',
        build = 'yarn install --frozen-lockfile --production',
        ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'}
    }, -- <Leader>p or :Prettier

    { 'Yggdroot/indentLine' },
    --{ 'ap/vim-css-color' } -- show css color will have error when open .java with treesitter
    --[[ { 'mattn/emmet-vim' } ]]
    { 'othree/xml.vim' },

    -- tags
    { 'ludovicchabant/vim-gutentags' }, -- build ctags auto and silent
    'simrat39/symbols-outline.nvim', -- replace vista.vim
    --[[ { 'liuchengxu/vista.vim' }, -- replace tagbar which could support LSP ]]

    -- fzf
    { 'Yggdroot/LeaderF', build = ':LeaderfInstallCExtension' },
    { 'tamago324/LeaderF-filer' },
    { 'Yggdroot/LeaderF-marks' },
    {
        'nvim-telescope/telescope.nvim', version = '0.1.5',
        -- or                            , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },
    'nvim-telescope/telescope-media-files.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
    { "kkharji/sqlite.lua" }, -- Ensure you have sqlite3 installed locally.
    {"nvim-telescope/telescope-frecency.nvim"},
    { "ahmedkhalf/project.nvim" },

    -- code
    { "windwp/nvim-autopairs" },
    { 'numToStr/Comment.nvim' },
    -- tpope
    { 'tpope/vim-surround' },
    { 'tpope/vim-repeat' },
    --[[ { 'machakann/vim-sandwich' }, ]]
    -- like code runner
    {'michaelb/sniprun', build = 'bash ./install.sh'},

    -- diagnostics
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    },
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons",
    },

    -- cmp plugins
    {"hrsh7th/nvim-cmp"}, -- The completion plugin
    {"hrsh7th/cmp-buffer"}, -- buffer completions
    {"hrsh7th/cmp-path"}, -- path completions
    {"hrsh7th/cmp-cmdline"}, -- cmdline completions
    {"saadparwaiz1/cmp_luasnip"}, -- snippet co  -- snippets
    {"hrsh7th/cmp-nvim-lsp"},
    { --snippet engine
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "<CurrentMajor>.*",
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    {"rafamadriz/friendly-snippets"}, -- a bunch of snippets to usempletions
    {
        'tzachar/cmp-tabnine',
        build = './install.sh',
        dependencies = 'hrsh7th/nvim-cmp',
    },
    -- LSP
    {"neovim/nvim-lspconfig"}, -- enable LSP
    { "williamboman/mason.nvim" },
    {"williamboman/mason-lspconfig.nvim"},
    {
        'rmagatti/goto-preview'
    },
    --have bug and I can't debug... 2022.9.14
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Virtual Text
    -- often not use
    --[[ {'kevinhwang91/nvim-hlslens'} -- helps you better glance at matched information ]]
    -- {"APZelos/blamer.nvim"} -- show git blame, replaced by gitsigns.nvim

    -- startup time
    {'dstein64/vim-startuptime'}, -- A Vim plugin for profiling Vim's startup
    --[[ {'lewis6991/impatient.nvim'} -- Speed up loading Lua modules in Neovim to improve startup time. ]]

    -- project
    -- { 'airblade/vim-rooter' }
    {
        "folke/todo-comments.nvim",
        dependencies = "nvim-lua/plenary.nvim",
    },
    { 'tpope/vim-obsession' },

    -- web
    { 'windwp/nvim-ts-autotag' },

    -- data science
    { 'dccsillag/magma-nvim', build = ':UpdateRemotePlugins' },
    { 'goerz/jupytext.vim' },

    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },


    -- terminal
    {"akinsho/toggleterm.nvim", version = '*'},

    -- which key
    --[[ {"folke/which-key.nvim"}, ]]

    -- cheat.sh
    {"dbeniamine/cheat.sh-vim"},

    -- letcode
    --[[ {'ianding1/leetcode.vim'},  ]]

    -- translate
    {'uga-rosa/translate.nvim'},

    -- AI
    --[[ {'github/copilot.vim'}, ]]

    -- time recorder
    {'ActivityWatch/aw-watcher-vim'},

    -- selection search
    { 'voldikss/vim-browser-search' },

    -- sudo write file
    { 'lambdalisue/suda.vim' },

    -- debug
    'mfussenegger/nvim-dap',

    -- for browser
    --[[ { ]]
    --[[     'glacambre/firenvim', ]]
    --[[     build = function() vim.fn['firenvim#install'](0) end  ]]
    --[[ }, ]]

    -- for vim input
    --[[ { 'rlue/vim-barbaric' }, ]]

    -- golang
    { 'fatih/vim-go' },

    -- browsers
    'glacambre/firenvim',

    -- let the leader key work
    --[[ 'rhysd/clever-f.vim', ]]

    { 'itchyny/calendar.vim' },

    {'waiting-for-dev/vim-www'},

    {'rainbowhxch/accelerated-jk.nvim'},

    -- Lazy load firenvim
    -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
    cond = not not vim.g.started_by_firenvim,
    build = function()
        require("lazy").load({ plugins = "firenvim", wait = true })
        vim.fn["firenvim#install"](0)
    end
})
