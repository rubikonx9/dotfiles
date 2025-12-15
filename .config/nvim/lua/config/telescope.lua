require('telescope').setup({
    defaults = {
        layout_strategy = 'vertical',
        mappings = {
            i = {
    	        ['<Del>'] = require('telescope.actions').delete_buffer
            }
        }
    }
})
