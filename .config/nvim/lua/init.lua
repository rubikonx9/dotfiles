require('config/basic')

require('config/lazy-install')
require('config/lazy')

-- Visuals
vim.cmd('colorscheme base16-eighties')

require('config/telescope')

require('config/lualine')
require('illuminate').configure()
require('gitsigns').setup()
require('colorizer').setup()
require('config/noice')

-- Additional features
require("auto-save").setup({
    execution_message = {
        message = function()
            return ""
        end
    }
    -- This should work in principle, but is bugged
    -- callbacks = {
    --     before_saving = function ()
    --         local sem = require("nvim-sem")
    --
    --         sem.update_copyrights()
    --         print "Done!!!"
    --     end
    -- }
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode

        if vim.bo.modified == true and mode == 'n' then
            require("nvim-sem").update_copyrights()
        end
    end
})

require('trim').setup()
require('Comment').setup()
require('block').setup()
require('config/harpoon')
require('project_nvim').setup({
    manual_mode = true
})

-- Code completion
require('config/nvim-cmp')

-- Treesitter
require('config/treesitter', { auto_expand_width = true })

-- LSP
require('config/lsp')

-- Custom keymaps
require('keymaps')

require('config/ai')
