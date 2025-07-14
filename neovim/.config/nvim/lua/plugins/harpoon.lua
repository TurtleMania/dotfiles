return {
    "ThePrimeagen/harpoon", branch = "harpoon2",
    lazy = true;
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>a", function () require("harpoon"):list():add() end, desc = "Add current file to harpoon." },
        { "<leader>h", function () require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Toggle telescope harpoon menu." },
        { "<C-f>", function () require("harpoon"):list():select(1) end, desc = "Open harpoon file 1." },
        { "<C-d>", function () require("harpoon"):list():select(2) end, desc = "Open harpoon file 2." },
        { "<C-s>", function () require("harpoon"):list():select(3) end, desc = "Open harpoon file 3." },
        { "<C-a>", function () require("harpoon"):list():select(4) end, desc = "Open harpoon file 4." }
    },
    config = function ()
        require("harpoon"):setup({
            settings = { save_on_toggle = true, sync_on_ui_close = true }
        })
    end
}
