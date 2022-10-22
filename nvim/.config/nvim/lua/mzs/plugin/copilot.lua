-- use this table to disable/enable filetypes
-- copilot.vim: Copilot: Disabled for filetype=markdown by internal default #29977
-- https://github.com/orgs/community/discussions/29977
vim.g.copilot_filetypes = {
    xml = false,
    markdown = true
}

-- since most are enabled by default you can turn them off
-- using this table and only enable for a few filetypes
-- vim.g.copilot_filetypes = { ["*"] = false, python = true }


-- from :help copilot
-- see https://www.reddit.com/r/neovim/comments/sk70rk/comment/hvjlohe/?utm_source=share&utm_medium=web2x&context=3
-- disable default tab and use <c-l> to Accept copilot suggestion
vim.g.copilot_no_tab_map = true
vim.cmd[[imap <silent><script><expr> <C-l> copilot#Accept("\<CR>")]]
-- vim.g.copilot_no_tab_map = true
-- vim.keymap.set.keymap("i", "<C-a>", ":copilot#Accept('\\<CR>')<CR>", { silent = true })

-- cheat
-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
--
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)


-- if colorscheme is set to dark
-- vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
