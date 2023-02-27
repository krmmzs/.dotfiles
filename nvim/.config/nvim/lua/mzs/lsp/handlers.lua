local M = {}

-- TODO: backfill this to template
M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = true,
        -- show signs
        signs = {
            active = signs,
        },
        update_in_insert = false, -- when insert, don't show diagnostic
        underline = false, -- it is annoying me!!!
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_highlight_document(client, bufnr)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.documentHighlightProvider then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })

        -- vimscript
        -- vim.api.nvim_exec([[
        --     augroup lsp_document_highlight
        --     autocmd! * <buffer>
        --     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        --     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        --     augroup END
        -- ]],
        --     false
        -- )
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

    -- replaced by lspsaga.nvim:A light-weight lsp plugin based on neovim's built-in lsp with a highly performant UI.
    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ga", "<cmd>Lspsaga code_action<cr>", opts)

    --[[ vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) ]]
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)

    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)

    vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

    -- add
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<C-u>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1, '<c-u>')<cr>",
        opts
    )
    vim.api.nvim_buf_set_keymap(
        bufnr,
        "n",
        "<C-d>",
        "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1, '<c-d>')<cr>",
        opts
    )

    -- null-ls.nvim for lsp keymap.
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format({async = true })' ]])
end

-- client is LSP client, buffer?
M.on_attach = function(client, bufnr)
    -- when edit js file, closing tsserver to better use null-ls's formatting config.
    if client.name == "tsserver" then
        client.server_capabilities.document_formatting = false
    end

    lsp_keymaps(bufnr)
    --[[ lsp_highlight_document(client, bufnr) ]]
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

-- See :h deprecated
-- update_capabilities is deprecated, use default_capabilities instead.
--[[ M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities) ]]
M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
