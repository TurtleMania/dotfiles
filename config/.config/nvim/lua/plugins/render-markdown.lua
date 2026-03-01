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
        render_modes = true,
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
