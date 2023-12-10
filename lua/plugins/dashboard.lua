local function default_header()
    return {
        '', '', '',
        '██████   ██████       █████     █████████                    █████               ',
        '░░██████ ██████       ░░███     ███░░░░░███                  ░░███                ',
        '░███░█████░███        ░███    ░███    ░░░   ██████    █████  ░███████    ██████  ',
        '░███░░███ ░███        ░███    ░░█████████  ░░░░░███  ███░░   ░███░░███  ░░░░░███ ',
        '░███ ░░░  ░███        ░███     ░░░░░░░░███  ███████ ░░█████  ░███ ░███   ███████ ',
        '░███      ░███  ███   ░███     ███    ░███ ███░░███  ░░░░███ ░███ ░███  ███░░███ ',
        '█████     █████░░████████     ░░█████████ ░░████████ ██████  ████ █████░░████████',
        '░░░░░     ░░░░░  ░░░░░░░░       ░░░░░░░░░   ░░░░░░░░ ░░░░░░  ░░░░ ░░░░░  ░░░░░░░░  ',
        '', '', ''
    }
end

require('dashboard').setup {
    theme = 'doom',
    config = {
        header = default_header(),
        center = {
            {
                icon = '󰙅 ',
                icon_hl = 'Title',
                desc = 'Open tree',
                desc_hl = 'String',
                key = 'e',
                keymap = 'SPC e',
                key_hl = 'Number',
                action = ':Neotree float'
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Open git',
                desc_hl = 'String',
                key = 'g',
                keymap = 'SPC g g',
                key_hl = 'Number',
                action = ':LazyGit'
            },
            {
                icon = '󰈞 ',
                icon_hl = 'Title',
                desc = 'Find files',
                desc_hl = 'String',
                key = 'f',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = ':Telescope find_files'
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find text',
                desc_hl = 'String',
                key = 'w',
                keymap = 'SPC f w',
                key_hl = 'Number',
                action = ':Telescope live_grep'
            }
        }
    }
}
