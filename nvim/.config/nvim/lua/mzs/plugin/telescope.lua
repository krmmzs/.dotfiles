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


local actions = require "telescope.actions"
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end


nkeymap("<C-f>", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nkeymap("<leader>f1", "<cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>")
nkeymap("<leader>f2", "<cmd>lua require('telescope.builtin').find_files({no_ignore=true})<cr>")
nkeymap("<leader>f3", "<cmd>lua require('telescope.builtin').find_files({hidden=true, no_ignore=true})<cr>")
nkeymap("<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nkeymap("<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>")
-- see https://www.reddit.com/r/neovim/comments/oli7fb/permanent_recent_files_using_telescope/
-- only keeps track of the opened files in the current session. 
-- nkeymap("<C-p>", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
nkeymap("<leader>fh", ":<cmd>Telescope<CR>")

-- lsp
nkeymap("<leader>ff", "<cmd>Telescope lsp_document_symbols<cr>")

-- frecency
nkeymap("<leader>fr", "<cmd>lua require('telescope').extensions.frecency.frecency()<CR>")

-- TODO
nkeymap("<leader>fd", ":TodoTelescope<cr>")

-- history command
nkeymap("<leader>fc", "<cmd>Telescope command_history<CR>")

-- jumps list
nkeymap("<leader>fj", "<cmd>lua require('telescope.builtin').jumplist()<cr>")

-- notify
nkeymap("<leader>fn", "<cmd>lua require('telescope').extensions.notify.notify()<cr>")
--[[ nkeymap("<leader>fn", "<cmd>Noice telescope<cr>") -- replaced by noice.nvim ]]



telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },

        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,

                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-c>"] = actions.close,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                ["<C-l>"] = actions.complete_tag,
                ["<C-h>"] = actions.which_key, -- keys from pressing <C-/>

            },

            n = {
                ["<esc>"] = actions.close,
                ["<CR>"] = actions.select_default,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-t>"] = actions.select_tab,

                ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
                ["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["H"] = actions.move_to_top,
                ["M"] = actions.move_to_middle,
                ["L"] = actions.move_to_bottom,

                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,
                ["gg"] = actions.move_to_top,
                ["G"] = actions.move_to_bottom,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,

                ["<PageUp>"] = actions.results_scrolling_up,
                ["<PageDown>"] = actions.results_scrolling_down,

                ["?"] = actions.which_key,
            },
        },
    },
    pickers = {
        -- Default configuration for builtin pickers goes here:
        -- picker_name = {
        --   picker_config_key = value,
        --   ...
        -- }
        -- Now the picker_config_key will be applied every time you call this
        -- builtin picker
    },
    extensions = {
        -- see https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-setup-and-configuration
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        },

        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "webp", "jpg", "jpeg"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        },

        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },

    -- builtin configs
    builtin = {
        git_branches = {

        }
    },
}

-- other config
-- see https://github.com/ThePrimeagen/.dotfiles/blob/master/nvim/.config/nvim/lua/theprimeagen/telescope.lua#L39
local M = {}

-- M.find_files = function ()
--     require("telescope.builtin").find_files({
--
--     })
-- end

M.git_branches = function()
    require("telescope.builtin").git_branches({
        attach_mappings = function(_, map)
            map("i", "<c-d>", actions.git_delete_branch)
            map("n", "<c-d>", actions.git_delete_branch)
            return true
        end,
    })
end

-- see https://github.com/nvim-telescope/telescope-fzf-native.nvim#telescope-setup-and-configuration
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

-- see https://github.com/nvim-telescope/telescope-media-files.nvim
telescope.load_extension('media_files')

-- need sqlite3
-- Using an implementation of Mozilla's Frecency algorithm (used in Firefox's address bar)
-- , files edited frecently are given higher precedence in the list index.
telescope.load_extension('frecency')

-- https://github.com/nvim-telescope/telescope.nvim/issues/592#issuecomment-789069837
-- found a plugin airblade/vim-rooter, It can find project root according to the file I set
-- vim.cmd[[
--     nnoremap <expr> sp ':Telescope find_files cwd='.FindRootDirectory().'/<cr>'
-- ]]

return M
