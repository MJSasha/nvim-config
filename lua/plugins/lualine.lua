local lualine = require('lualine')

local colors = {
    bg       = '#1d2021',
    fg       = '#ebdbb2',
    yellow   = '#fabd2f',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#b8bb26',
    orange   = '#fe8019',
    violet   = '#d3869b',
    magenta  = '#b16286',
    blue     = '#458588',
    red      = '#fb4934',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

local color_selector = function()
    -- auto change color according to neovims mode
    local mode_color = {
        n = colors.red,
        i = colors.green,
        v = colors.blue,
        [''] = colors.blue,
        V = colors.blue,
        c = colors.magenta,
        no = colors.red,
        s = colors.orange,
        S = colors.orange,
        ic = colors.yellow,
        R = colors.violet,
        Rv = colors.violet,
        cv = colors.red,
        ce = colors.red,
        r = colors.cyan,
        rm = colors.cyan,
        ['r?'] = colors.cyan,
        ['!'] = colors.red,
        t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
end

local config = {
    options = {
        component_separators = '',
        section_separators = '',
        theme = {
            normal = { c = { fg = colors.fg, bg = colors.bg } },
            inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
    },
}

local function ins_left(component)
    table.insert(config.sections.lualine_c, component)
end

local function ins_right(component)
    table.insert(config.sections.lualine_x, component)
end

ins_left {
    function()
        return ''
    end,
    color = color_selector,
    padding = { left = 0, right = 2 },
}

ins_left {
    -- mode component
    function()
        return '󰄛'
    end,
    color = color_selector,
    padding = { right = 1 },
}

ins_left {
    'filesize',
    cond = conditions.buffer_not_empty,
}

ins_left {
    'filename',
    cond = conditions.buffer_not_empty,
    color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left {
    function()
        local total_lines = vim.fn.line('$')
        return '󰉸 ' .. total_lines
    end,
    color = { fg = colors.fg, gui = 'bold' },
}

ins_left {
    'diagnostics',
    sources = { 'nvim_diagnostic' },
    symbols = { error = ' ', warn = ' ', info = ' ' },
    diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
    },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
    function()
        return '%='
    end,
}

ins_left {
    function()
        local lsp_found_icon = '󰒐'
        local lsp_not_found_icon = '󰒑'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()

        if clients and #clients > 0 then
            for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes

                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                    return lsp_found_icon .. ' ' .. client.name
                end
            end
        end

        return lsp_not_found_icon .. ' No Active LSP'
    end,
    color = { fg = colors.fg, gui = 'bold' },
}

-- Add components to right sections
ins_right {
    'o:encoding',       -- option component same as &encoding in viml
    fmt = string.upper, -- I'm not sure why it's upper case either ;)
    cond = conditions.hide_in_width,
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'fileformat',
    fmt = string.upper,
    icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
    color = { fg = colors.green, gui = 'bold' },
}

ins_right {
    'branch',
    icon = '',
    color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
    'diff',
    symbols = { added = ' ', modified = '󰙏 ', removed = ' ' },
    diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
    },
    cond = conditions.hide_in_width,
}

ins_right {
    function()
        return ''
    end,
    color = color_selector,
    padding = { left = 1, right = 0 },
}

lualine.setup(config)
