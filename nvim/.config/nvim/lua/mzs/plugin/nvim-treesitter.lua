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

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

require('nvim-treesitter.install').compilers = { "gcc" }

configs.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "help", "vim", "c", "lua", "cpp", "python", "java", "javascript", "markdown", "go"},

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = { "" },

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        disable = { "" },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
    indent = { enable = true, disable = { "yaml", "python" } },

    -- see https://github.com/p00f/nvim-ts-rainbow#installation-and-setup
    rainbow = {
        enable = false,
        disable = { "cpp" }, -- list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    },

    -- see https://github.com/nvim-treesitter/playground#setup
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },

    -- see https://github.com/JoosepAlviste/nvim-ts-context-commentstring#getting-started
    -- This plugin adds to that by correctly setting the commentstring setting
    context_commentstring = {
        enable = true,
        enable_autocmd = false, -- see https://github.com/JoosepAlviste/nvim-ts-context-commentstring#behavior
    },

    -- see https://github.com/windwp/nvim-ts-autotag
    -- autotag
    autotag = {
        enable = true,
        -- filetypes = { "html" , "xml" },
    },
}

-- 开启 Folding
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.wo.foldlevel = 99
--[[ nkeymap("<Leader><Leader>l", ":TSBufToggle highlight<CR>") ]]
