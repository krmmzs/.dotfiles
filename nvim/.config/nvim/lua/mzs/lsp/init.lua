local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mzs.lsp.lsp-installer")
require("mzs.lsp.handlers").setup()

-- fix: warning: multiple different client offset_encodings detected for buffer, this is not supported yet
-- https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428#issue-1078814897
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
