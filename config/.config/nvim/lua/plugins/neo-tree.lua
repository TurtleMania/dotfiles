return {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<leader>d", function()
            require("neo-tree.command").execute({ action = "focus", toggle = true, source = "filesystem", position = "left" })
        end, desc = "View the file explorer." },
        { "<leader>s", function()
            require("neo-tree.command").execute({ action = "focus", toggle = true, source = "git_status", position = "left" })
        end, desc = "View git status in explorer." }
    },
    opts = {
        event_handlers = {
            {
                event = "file_open_requested",
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end
            }
        }
    }
}
