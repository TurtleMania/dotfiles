return {
    'MeanderingProgrammer/render-markdown.nvim',
    lazy = true,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons'
    },
    ft = { 'markdown' },
    opts = {
        completions =  { lsp = { enabled = true } },
        heading = {
            width = 'block',
            left_pad = 2,
            right_pad = 2,
        },
        paragraph = {
            min_width = 190
        },
        code = {
            width = 'block',
            left_pad = 2,
        },
        bullet = {
            enabled = false,
        },
        anti_conceal = {
            ignore = {
                code_background = true,
                indent = true,
                sign = true,
                virtual_lines = true,
            },
        },
    }
}
--[[
opts = {
    link = {
        enabled = true,
        render_modes = false,
        footnote = {
            enabled = true,
            superscript = true,
            prefix = '',
            suffix = '',
        },
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
        wiki = {
            icon = '󱗖 ',
            body = function()
                return nil
            end,
            highlight = 'RenderMarkdownWikiLink',
        },
        custom = {
            web = { pattern = '^http', icon = '󰖟 ' },
            github = { pattern = 'github%.com', icon = '󰊤 ' },
            gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
            stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
            wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
            youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
        },
    },
    checkbox = {
        enabled = true,
        render_modes = false,
        bullet = false,
        right_pad = 1,
        unchecked = {
            icon = '󰄱 ',
            highlight = 'RenderMarkdownUnchecked',
            scope_highlight = nil,
        },
        checked = {
            icon = '󰱒 ',
            highlight = 'RenderMarkdownChecked',
            scope_highlight = nil,
        },
        custom = {
            todo = { raw = '[-]', rendered = '󰥔 ', highlight = 'RenderMarkdownTodo', scope_highlight = nil },
        },
    },
    bullet = {
        enabled = true,
        render_modes = false,
        icons = { '●', '○', '◆', '◇' },
        ordered_icons = function(ctx)
            local value = vim.trim(ctx.value)
            local index = tonumber(value:sub(1, #value - 1))
            return ('%d.'):format(index > 1 and index or ctx.index)
        end,
        left_pad = 0,
        right_pad = 0,
        highlight = 'RenderMarkdownBullet',
        scope_highlight = {},
    },
    quote = { icon = '▋' },
    anti_conceal = {
        enabled = true,
        ignore = {
            code_background = true,
            sign = true,
        },
        above = 0,
        below = 0,
    },
},
}
--]]
