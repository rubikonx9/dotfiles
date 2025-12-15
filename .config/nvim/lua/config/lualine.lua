local sem = require("nvim-sem")

require('lualine').setup({
    options = {
        theme = 'base16',
    },
    sections = {
        lualine_a = {
            'mode'
        },
        lualine_b = {
            'branch'
        },
        lualine_c = {
            'filename',
            sem.get_maintainer
        },
        lualine_x = {
            'searchcount',
            'diagnostics',
            'filetype'
        },
        lualine_y = {
            'progress'
        },
        lualine_z = {
            'selectioncount',
            'location'
        }
    }
})
