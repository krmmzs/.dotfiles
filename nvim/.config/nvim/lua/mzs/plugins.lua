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
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

    use 'wakatime/vim-wakatime'
    use 'bronson/vim-trailing-whitespace'

    -- colorscheme
    use 'folke/tokyonight.nvim'
    use 'morhetz/gruvbox'
    use 'luisiacc/gruvbox-baby'
    use 'liuchengxu/space-vim-theme'

    --use {'neoclide/coc.nvim', branch = 'master', run = 'yarn install --frozen-lockfile'}
    --use 'honza/vim-snippets'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate"
    }
    use { 'nvim-treesitter/playground' }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use {'vim-airline/vim-airline'}
    use {'vim-airline/vim-airline-themes'}
    use {'neomake/neomake'}
    use {'mbbill/undotree'}
    -- Git
    use {'tpope/vim-fugitive'}
    use {'airblade/vim-gitgutter'}
    use {'junegunn/gv.vim'}
    use {'preservim/nerdtree'}
    use {'jistr/vim-nerdtree-tabs'}
    use {'Xuyuanp/nerdtree-git-plugin'} -- A plugin of NERDTree showing git status flags.
    use {'preservim/nerdcommenter'}
    use {'tiagofumo/vim-nerdtree-syntax-highlight'} --add highlight
    use {'easymotion/vim-easymotion'}
    use {'psf/black'}
    use { 'Yggdroot/indentLine' }
    --use { 'ap/vim-css-color' } -- show css color
    use { 'mattn/emmet-vim' }
    use { 'othree/xml.vim' }
    use {
        'prettier/vim-prettier',
        run = 'yarn install --frozen-lockfile --production',
        ft = {'javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'}
    }
    use { 'ludovicchabant/vim-gutentags' } -- build ctags auto and silent
    use { 'liuchengxu/vista.vim' } -- replace tagbar which could support LSP
    use { 'Yggdroot/LeaderF', run = ':LeaderfInstallCExtension' }
    use { 'tamago324/LeaderF-filer' }
    use { 'Yggdroot/LeaderF-marks' }
    use { 'kshenoy/vim-signature' } -- vim marks
    use { 'mhinz/vim-startify' } -- vim look
    use { 'ryanoasis/vim-devicons' } -- icons for them
    use { 'jiangmiao/auto-pairs' } -- better than cocexention
    use({
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    })

    -- cmp plugins
    use {"hrsh7th/nvim-cmp"} -- The completion plugin
    use {"hrsh7th/cmp-buffer"} -- buffer completions
    use {"hrsh7th/cmp-path"} -- path completions
    use {"hrsh7th/cmp-cmdline"} -- cmdline completions
    use {"saadparwaiz1/cmp_luasnip"} -- snippet co  -- snippets
    use {"hrsh7th/cmp-nvim-lsp"}

    use {"L3MON4D3/LuaSnip"} --snippet engine
    use {"rafamadriz/friendly-snippets"} -- a bunch of snippets to usempletions
  -- LSP
    use {"neovim/nvim-lspconfig"} -- enable LSP
    use {"williamboman/nvim-lsp-installer"} -- simple to use language server installer

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
