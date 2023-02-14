-- lsp-config
-- https://github.com/neovim/nvim-lspconfig
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).

local lspconfig = require("lspconfig")

local lsp_flags = {
    debounce_text_changes = 150,
}

local on_attach = require("mzs.lsp.handlers").on_attach
local capabilities = require("mzs.lsp.handlers").capabilities

-- language servers config

-- lua
local lua_ls_opts = require("mzs.lsp.settings.lua_ls")
lspconfig.lua_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    lua_ls_opts
}

-- json
local jsonls_opts = require("mzs.lsp.settings.jsonls")
lspconfig.jsonls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    jsonls_opts
}


-- python
local pyright_opts = require("mzs.lsp.settings.pyright")
lspconfig.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    pyright_opts
}

-- cpp
-- Mason without ccls...(con't understand why)
--[[ local ccls_opts = require("mzs.lsp.settings.ccls") ]]
--[[ lspconfig.ccls.setup{ ]]
--[[     on_attach = on_attach, ]]
--[[     capabilities = capabilities, ]]
--[[     flags = lsp_flags, ]]
--[[     ccls_opts ]]
--[[ } ]]

local clangd_opts = require("mzs.lsp.settings.clangd")
lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    clangd_opts
}

-- golang
local gopls_opts = require("mzs.lsp.settings.gopls")
lspconfig.gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    gopls_opts
}

-- markdown
local marskman_opts = require("mzs.lsp.settings.marksman")
lspconfig.marksman.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    flags = lsp_flags,
    marskman_opts
}
