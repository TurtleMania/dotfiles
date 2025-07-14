return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",
    config = function ()
        require("nvim-treesitter").install({
            "asm", "bash", "c", "c_sharp", "cmake",
            "cpp", "css", "csv", "dockerfile",
            "git_config", "git_rebase", "gitattributes",
            "gitcommit", "gitignore", "go", "html",
            "java", "javadoc", "javascript", "jinja",
            "jinja_inline", "jsdoc", "json", "kotlin",
            "lua", "luadoc", "make", "markdown",
            "markdown-inline", "php", "powershell",
            "python", "regex", "ruby", "sql", "svelte",
            "swift", "toml", "typescript", "vim",
            "vimdoc", "yaml"
        }):wait(300000) -- 5 minutes
    end
}
