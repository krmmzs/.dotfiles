local opts = { noremap = true, silent = true }
--[[ local term_opts = { silent = true } ]]
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

local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    print("null-ls have a error.")
    return
end

--[[ nkeymap("<leader>fm", ":Format<CR>") ]]

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier.with { extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } },
        formatting.black.with { extra_args = { "--fast" } },
        -- formatting.yapf, -- other python formatter.
        formatting.stylua,
        --[[ diagnostics.flake8, ]]
        -- see https://github.com/lewis6991/gitsigns.nvim#null-ls
        code_actions.gitsigns
    },
})

