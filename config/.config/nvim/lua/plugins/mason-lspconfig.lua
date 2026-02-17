return {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
        { "mason-org/mason.nvim", opts={} },
        "neovim/nvim-lspconfig"
    },
    keys = {
        { "gD", vim.lsp.buf.declaration, desc = "Go to declaration." },
        { "gd", vim.lsp.buf.definition, desc = "Go to definition." },
        { "K", vim.lsp.buf.hover, desc = "Show hover information." }
    },
    opts = {
        ensure_installed = {
            "lua_ls", "clangd",
            "rust_analyzer", "qmlls",
            "pyright", "hyprls",
            "jdtls", "marksman",
        }
    }
}
