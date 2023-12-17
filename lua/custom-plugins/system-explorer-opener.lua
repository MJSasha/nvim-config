local M = {}

function M.open_directory_in_explorer()
  local current_directory = vim.fn.getcwd()
  local command = ""
  
  if vim.fn.has("win32") == 1 then
    command = "start " .. current_directory
  elseif vim.fn.has("mac") == 1 then
    command = "open " .. current_directory
  elseif vim.fn.has("unix") == 1 then
    command = "xdg-open " .. current_directory
  end
  
  vim.fn.system(command)
end

function M.setup(opts)
    opts = opts or {}
    vim.cmd([[command! OpenInSystemExplorer lua require'custom-plugins.system-explorer-opener'.open_directory_in_explorer()]])
end

return M
