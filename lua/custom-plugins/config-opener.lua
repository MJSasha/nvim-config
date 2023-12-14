local M = {}

function M.open_config()
    local config_path = '~\\AppData\\Local\\nvim'
    vim.cmd('cd ' .. config_path)
end

function M.setup(opts)
    opts = opts or {}
    vim.cmd([[command! OpenConfig lua require'custom-plugins.config-opener'.open_config()]])
end

return M
