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

local status_ok, configs = pcall(require, "noice")
if not status_ok then
    return
end

-- Configuration Recipes
-- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes
configs.setup({
    cmdline = {
        view = "cmdline",

        -- I don't like new cmdline now
        --[[ view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom ]]
        --[[ opts = { buf_options = { filetype = "vim" } }, -- enable syntax highlighting in the cmdline ]]
        --[[ icons = { ]]
        --[[     ["/"] = { icon = " ", hl_group = "DiagnosticWarn" }, ]]
        --[[     ["?"] = { icon = " ", hl_group = "DiagnosticWarn" }, ]]
        --[[     [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false }, ]]
        --[[ }, ]]
    },
    popupmenu = {
        enabled = true, -- disable if you use something like cmp-cmdline
        ---@type 'nui'|'cmp'
        backend = "cmp", -- backend to use to show regular cmdline completions
        -- You can specify options for nui under `config.views.popupmenu`
    },
    history = {
        -- options for the message history that you get with `:Noice`
        view = "split",
        opts = { enter = true },
        filter = { event = "msg_show", ["not"] = { kind = { "search_count", "echo" } } },
    },
    notify = {
        -- Noice can be used as `vim.notify` so you can route any notification like other messages
        -- Notification messages have their level and other properties set.
        -- event is always "notify" and kind can be any log level as a string
        -- The default routes will forward notifications to nvim-notify
        -- Benefit of using Noice for this is the routing and consistent history view
        enabled = false,
    },
    throttle = 1000 / 30, -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
    ---@type table<string, NoiceViewOptions>
    views = {}, -- @see the section on views below
    ---@type NoiceRouteConfig[]

    --[[ routes = {}, -- @see the section on routes below ]]
    -- Hide written messages
    -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#hide-written-messages
    routes = {
        {
            filter = {
                event = "msg_show",
                kind = "",
                find = "written",
            },
            opts = { skip = true },
        },
        -- Use a Classic Bottom Cmdline for Search
        -- https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#use-a-classic-bottom-cmdline-for-search
        {
            filter = {
                event = "cmdline",
                find = "^%s*[/?]",
            },
            view = "cmdline",
        },
    },
    ---@type table<string, NoiceFilter>
    status = {}, --@see the section on statusline components below
    ---@type NoiceFormatOptions
    format = {}, -- @see section on formatting
})
