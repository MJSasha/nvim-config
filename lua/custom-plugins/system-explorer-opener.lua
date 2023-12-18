local M = {}

function M.open_directory_in_explorer()
    local current_buffer = vim.api.nvim_get_current_buf()
    local current_file = vim.api.nvim_buf_get_name(current_buffer)
    local current_directory = vim.fn.fnamemodify(current_file, ":h")
    open(current_directory)
end

function M.open_root_directory_in_explorer()
    local root_directory = vim.fn.getcwd()
    open(root_directory)
end

function M.setup(opts)
    opts = opts or {}
    vim.cmd([[command! OpenInSystemExplorer lua require'custom-plugins.system-explorer-opener'.open_directory_in_explorer()]])
    vim.cmd([[command! OpenRootInSystemExplorer lua require'custom-plugins.system-explorer-opener'.open_root_directory_in_explorer()]])
end

function open(directory)
    local command = ""

    if vim.fn.has("win32") == 1 then
        command = "start " .. directory
    elseif vim.fn.has("mac") == 1 then
        command = "open " .. directory
    elseif vim.fn.has("unix") == 1 then
        command = "xdg-open " .. directory
    end

    vim.fn.system(command)
end

return M
