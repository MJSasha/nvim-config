vim.opt.termguicolors = true
vim.o.background = "dark"

function SetColor(color)
    vim.cmd.colorscheme(color)
end

SetColor('gruvbox')