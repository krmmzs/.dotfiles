local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("mzs.lsp.lsp-installer")
require("mzs.lsp.handlers").setup()
--require("mzs.lsp.keymaps") -- move to handlers
