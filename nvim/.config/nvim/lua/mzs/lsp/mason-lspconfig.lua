require("mason-lspconfig").setup {
    ensure_installed = { "gopls", "clangd", "bashls", "cmake", "jdtls", "marksman", "pyright", "lua_ls" },
}
