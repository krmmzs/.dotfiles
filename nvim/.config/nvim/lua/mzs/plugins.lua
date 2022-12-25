local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    print("that did't work")
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}











-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use 'kyazdani42/nvim-web-devicons'


    use 'wakatime/vim-wakatime'

    -- UI
    use { 'kshenoy/vim-signature' } -- vim marks
    --use { 'mhinz/vim-startify' } -- vim look
    --[[ use { 'ryanoasis/vim-devicons' } -- icons for them ]]
    --[[ use { 'glepnir/dashboard-nvim' } -- dashboard ]]
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use { 'kkharji/lspsaga.nvim' }  -- nightly
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use {'moll/vim-bbye'} -- Bdelete
    use {'xiyaowong/nvim-transparent'}
    -- notify UI
    -- noise me...
    --[[ use({ ]]
    --[[     "folke/noice.nvim", ]]
    --[[     -- event = "VimEnter",  ]]
    --[[     -- config = function()  ]]
    --[[         -- require("noice").setup()  ]]
    --[[     -- end,  ]]
    --[[     requires = { ]]
    --[[         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries ]]
    --[[         "MunifTanjim/nui.nvim", ]]
    --[[         "rcarriga/nvim-notify", ]]
    --[[     } ]]
    --[[ }) ]]
    --[[ use { 'rcarriga/nvim-notify' } ]]

    -- colorscheme
    use 'folke/tokyonight.nvim'
    use 'morhetz/gruvbox'
    use 'luisiacc/gruvbox-baby'
    use 'liuchengxu/space-vim-theme'
    use 'Shatur/neovim-ayu'
    --[[ use ({ 'projekt0n/github-nvim-theme' }) ]] -- bad support some other plugin like buufflie...
    use "EdenEast/nightfox.nvim" -- need a time to explote this plugin, but it's cool
    use { "catppuccin/nvim", as = "catppuccin" }

    -- use native lsp now
    -- use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
    -- use 'honza/vim-snippets'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    use { 'nvim-treesitter/playground' }
    use { "p00f/nvim-ts-rainbow" }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'JoosepAlviste/nvim-ts-context-commentstring' }
    use { 'nvim-treesitter/nvim-treesitter-context' }

    use {'neomake/neomake'}
    use {'mbbill/undotree'}

    -- Git
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rhubarb'}
    -- use {'airblade/vim-gitgutter'}
    use {'junegunn/gv.vim'}
    -- Vim's diff mode is pretty good, but there is no convenient
    -- way to quickly bring up all modified files in a diffsplit.
    -- This plugin aims to provide a simple, unified, single tabpage
    -- interface that lets you easily review all changed files for any git rev.
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use {"lewis6991/gitsigns.nvim"}
    use {"rhysd/git-messenger.vim"}

    -- Navigation
    -- use {'preservim/nerdtree'}
    -- use {'jistr/vim-nerdtree-tabs'}
    -- use {'Xuyuanp/nerdtree-git-plugin'} -- A plugin of NERDTree showing git status flags.
    -- use {'tiagofumo/vim-nerdtree-syntax-highlight'} --add highlight
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }
    use { 'ThePrimeagen/harpoon' }

    -- Move
    --[[ use { -- replace easy-motion(deal with bad buffer show) ]]
    --[[     'phaazon/hop.nvim', ]]
    --[[     branch = 'v2', -- optional but strongly recommended ]]
    --[[ } ]]


    -- Format
    use {'psf/black'}
    use {
        'prettier/vim-prettier',
        run = 'yarn install --frozen-lockfile --production',
        ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'}
    } -- <Leader>p or :Prettier

    use { 'Yggdroot/indentLine' }
    --use { 'ap/vim-css-color' } -- show css color will have error when open .java with treesitter
    --[[ use { 'mattn/emmet-vim' } ]]
    use { 'othree/xml.vim' }

    -- tags
    use { 'ludovicchabant/vim-gutentags' } -- build ctags auto and silent
    use 'simrat39/symbols-outline.nvim' -- replace vista.vim
    --[[ use { 'liuchengxu/vista.vim' } -- replace tagbar which could support LSP ]]

    -- fzf
    use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' }
    use { 'tamago324/LeaderF-filer' }
    use { 'Yggdroot/LeaderF-marks' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-telescope/telescope-media-files.nvim'
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    use { "kkharji/sqlite.lua" } -- Ensure you have sqlite3 installed locally.
    use {"nvim-telescope/telescope-frecency.nvim"}
    use { "ahmedkhalf/project.nvim" }

    -- code
    use { "windwp/nvim-autopairs" }
    use { 'numToStr/Comment.nvim' }
    -- tpope
    use { 'tpope/vim-surround' }
    use { 'tpope/vim-repeat' }
    --[[ use { 'machakann/vim-sandwich' } ]]

    -- diagnostics
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    })
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- cmp plugins
    use {"hrsh7th/nvim-cmp"} -- The completion plugin
    use {"hrsh7th/cmp-buffer"} -- buffer completions
    use {"hrsh7th/cmp-path"} -- path completions
    use {"hrsh7th/cmp-cmdline"} -- cmdline completions
    use {"saadparwaiz1/cmp_luasnip"} -- snippet co  -- snippets
    use {"hrsh7th/cmp-nvim-lsp"}
    use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"}) --snippet engine
    use {"rafamadriz/friendly-snippets"} -- a bunch of snippets to usempletions
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}

    -- LSP
    use {"neovim/nvim-lspconfig"} -- enable LSP
    use {"williamboman/nvim-lsp-installer"} -- simple to use language server installer
    use {
        'rmagatti/goto-preview'
    }
    --have bug and I can't debug... 2022.9.14
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Virtual Text
    -- often not use
    --[[ use {'kevinhwang91/nvim-hlslens'} -- helps you better glance at matched information ]]
    -- use {"APZelos/blamer.nvim"} -- show git blame, replaced by gitsigns.nvim

    -- startup time
    use {'dstein64/vim-startuptime'} -- A Vim plugin for profiling Vim's startup
    --[[ use {'lewis6991/impatient.nvim'} -- Speed up loading Lua modules in Neovim to improve startup time. ]]

    -- project
    -- use { 'airblade/vim-rooter' }
    use { "williamboman/mason.nvim" }
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }
    use { 'tpope/vim-obsession' }

    -- web
    use { 'windwp/nvim-ts-autotag' }

    -- data science
    use { 'dccsillag/magma-nvim', run = ':UpdateRemotePlugins' }
    use { 'goerz/jupytext.vim' }

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })


    -- terminal
    use {"akinsho/toggleterm.nvim", tag = '*'}

    -- which key
    --[[ use {"folke/which-key.nvim"} ]]

    -- cheat.sh
    use {"dbeniamine/cheat.sh-vim"}

    -- letcode
    --[[ use {'ianding1/leetcode.vim'}  ]]

    -- translate
    use {'uga-rosa/translate.nvim'}

    -- AI
    use {'github/copilot.vim'}

    -- time recorder
    use {'ActivityWatch/aw-watcher-vim'}

    -- selection search
    use { 'voldikss/vim-browser-search' }

    -- sudo write file
    use { 'lambdalisue/suda.vim' }

    -- debug
    use 'mfussenegger/nvim-dap'

    -- for browser
    --[[ use { ]]
    --[[     'glacambre/firenvim', ]]
    --[[     run = function() vim.fn['firenvim#install'](0) end  ]]
    --[[ } ]]

    -- for vim input
    --[[ use { 'rlue/vim-barbaric' } ]]






















    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
