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

nkeymap("<Leader>e", ":NvimTreeToggle<CR>")
nkeymap("<Leader>nf", ":NvimTreeFindFile<CR>")

-- empty setup using defaults
-- require("nvim-tree").setup()


local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

-- OR setup with some options
nvim_tree.setup ({
    sort_by = "case_sensitive",
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = false,
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    open_on_tab = false,
    open_on_setup = false,
    ignore_ft_on_setup = {
        "startify",
        "dashboard",
        "alpha",
    },
    sync_root_with_cwd = true,
    diagnostics = {
        enable = true,
        icons = {
            hint = "",
            info = "",
            warning = "",
            error = "",
        },
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    git = {
        enable = true,
        ignore = true,
        timeout = 500,
    },
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        mappings = {
            custom_only = false,
            list = {
                { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
                { key = "h", cb = tree_cb "close_node" },
                { key = "v", cb = tree_cb "vsplit" },
            },
        },
    },
    actions = {
        open_file = {
            quit_on_open = false,
            resize_window = true,
        },
    },
    renderer = {
        root_folder_modifier = ":t",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                folder = {
                    default = "",
                    open = "",
                    arrow_closed = "",
                    arrow_open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "S",
                    unmerged = "",
                    renamed = "➜",
                    deleted = "",
                    untracked = "U",
                    ignored = "◌",
                },
            },
        },
    }
})

-- nvim-tree.filesystem_watchers.enable

