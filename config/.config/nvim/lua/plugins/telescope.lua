return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>ff", require('telescope.builtin').find_files, desc = "Find file." },
        { "<leader>fg", require('telescope.builtin').live_grep, desc = "Search files." },
        { "<leader>fb", require('telescope.builtin').buffers, desc = "Find buffer." }
    },
    config = function ()
        require("telescope").load_extension("fzy_native")
    end
}
