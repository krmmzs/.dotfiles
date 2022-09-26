return {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            -- don't overriding the default lua workspace settings
            -- see https://www.reddit.com/r/neovim/comments/rk38fh/vimlspbufdefinition_auto_opens_quickfix_window_on/
            workspace = {
                -- 	library = {
                -- 		[vim.fn.expand("$VIMRUNTIME/lua")] = true,
                -- 		[vim.fn.stdpath("config") .. "/lua"] = true,
                preloadFileSize = 2000
            },
            -- },
        },
    },
}
