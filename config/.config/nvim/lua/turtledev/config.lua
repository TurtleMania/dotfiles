vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = false

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

vim.opt.mouse = ""

vim.diagnostic.config({
    severity_sort = true,
    virtual_lines = {
        current_line = true
    }
})
