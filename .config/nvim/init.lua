-- some basics
vim.opt.showmatch        = true
vim.opt.ignorecase       = true
vim.opt.hlsearch         = true
vim.opt.incsearch        = true
vim.opt.tabstop          = 4
vim.opt.softtabstop      = 4
vim.opt.expandtab        = true
vim.opt.shiftwidth       = 4
vim.opt.autoindent       = true
vim.opt.cursorline       = true
vim.opt.number           = true
vim.opt.cc               = { 120 }
vim.opt.ttyfast          = true
vim.opt.swapfile         = false
vim.opt.backup           = false
vim.opt.encoding         = "utf8"
vim.opt.signcolumn       = "yes"
vim.opt.wrap             = true
vim.opt.splitright       = true
vim.opt.splitbelow       = true
vim.opt.laststatus       = 3
-- for tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw       = 1
vim.g.loaded_netrwPlugin = 1

-- init plugins
require("lazy-setup")

-- color scheme prep
vim.o.termguicolors = true
vim.g.base16_transparent_background = 1
vim.o.background = "dark"
-- load the colorscheme here
vim.cmd('colorscheme base16-eighties')

-- icons
require("nvim-web-devicons").setup()
-- Key bindings

vim.keymap.set("n", "<F1>", ":Cheatsheet<CR>", { silent = true, desc = "Cheat sheet" })
vim.keymap.set("n", "<F2>", ":Lazy<CR>", { silent = true, desc = "Lazy plugin manager" })
vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { silent = true, desc = "Telescope find files" })
vim.keymap.set("n", "<F5>", ':luafile ~/.config/nvim/init.lua<CR>', { silent = true, desc = 'Reload config' })
vim.keymap.set("n", '<C-k>b', ':NvimTreeToggle<CR>', { silent = true, desc = "Toggle tree sidebar" })
vim.keymap.set("n", '<C-z>', 'u', { silent = true, desc = "Undo" })
vim.keymap.set("i", '<C-z>', '<ESC>ui', { silent = true, desc = "Undo" })
vim.keymap.set("n", '<C-S>', ':w<CR>', { silent = true, desc = "Save" })
vim.keymap.set("n", '<C-l>', ':Telescope buffers<CR>', { silent = true, desc = "Open buffers" })
vim.keymap.set("n", "n", "nzz", { silent = true })
vim.keymap.set("n", "N", "Nzz", { silent = true })
vim.keymap.set("n", "<C-Left>", "b", { silent = true })
vim.keymap.set("n", "<C-Right>", "w", { silent = true })
vim.keymap.set("n", '<C-O>', ':e ~/', { desc = "Open file..." })
vim.keymap.set("n", "<C-R>", ":Telescope lsp_document_symbols<CR>", { silent = true, desc = "LSP Symbols" })
vim.keymap.set("i", '<M-Left>', '<ESC><C-W><Left>', { silent = true, desc = "Focus left" })
vim.keymap.set("n", '<M-Left>', '<C-W><Left>', { silent = true, desc = "Focus left" })
vim.keymap.set("i", '<M-Right>', '<ESC><C-W><Right>', { silent = true, desc = "Focus right" })
vim.keymap.set("n", '<M-Right>', '<C-W><Right>', { silent = true, desc = "Focus right" })
vim.keymap.set("i", '<M-Up>', '<ESC><C-W><Up>', { silent = true, desc = "Focus up" })
vim.keymap.set("n", '<M-Up>', '<C-W><Up>', { silent = true, desc = "Focus up" })
vim.keymap.set("i", '<M-Down>', '<ESC><C-W><Down>', { silent = true, desc = "Focus down" })
vim.keymap.set("n", '<F12>', ':Lspsaga goto_definition<CR>', { silent = true, desc = "LSP: Goto definition" })

-- tree
require("nvim-tree").setup()
local nt_api = require("nvim-tree.api")
local tree_open = false
local function tab_enter()
    if tree_open then
        nt_api.tree.open()
        --        vim.api.nvim_command("wincmd p")
    else
        nt_api.tree.close()
    end
end
nt_api.events.subscribe(nt_api.events.Event.TreeOpen, function() tree_open = true end)
nt_api.events.subscribe(nt_api.events.Event.TreeClose, function() tree_open = false end)
nt_api.tree.open();
vim.api.nvim_create_autocmd({ "TabEnter", "TabNewEntered", "TabClosed" }, { callback = tab_enter })

-- lua line
require('lualine').setup()

-- autosave
require("auto-save").setup({})

--auto trim whitespace
require("trim").setup()

-- auto session  management
require("auto-session").setup({
    auto_restore_enabled = true,
    auto_session_enable_last_session = true
})


-- telescope
require('telescope').setup({
    defaults = {
        layout_strategy = "vertical",
        -- layout_config = {
--            vertical = { width = 0. }
        -- }
    },
    extensions = {
        ["ui-select"] = {
            require("telescope.themes").get_dropdown {
                -- even more opts
            }
        }
    }
})
require("telescope").load_extension("ui-select")

-- autopairs
require('nvim-autopairs').setup()

-- clever f
-- imported Automatically

-- flog, fugitive
-- require("vim-fugitive").setup()

-- cheatsheet
require("cheatsheet").setup()

-- git gutter
require('gitsigns').setup()

-- comments
require('nvim_comment').setup()

-- debug print
require("debugprint").setup({})

-- LSP
require('lsp-setup').setup({
    servers = {
        bashls = {},
        cssls = {},
        eslint = {},
        html = {},
        jsonls = {},
        tsserver = {},
        lua_ls = {},
        --	autotools-language-server = {},
        remark_ls = {},
        perlnavigator = {},
        pylsp = {},
        sqlls = {},
        stylelint_lsp = {},
        lemminx = {},
        yamlls = {},
    }
})

-- autocomplete
local cmp = require('cmp')

local lspkind = require('lspkind')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')

cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            mode = 'symbol',       -- show only symbol annotations
            maxwidth = 50,         -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = function(entry, vim_item)
                --        ...
                return vim_item
            end
        }),
    },
    -- You must set mapping if you want.
    mapping = {
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<tab>'] = cmp.mapping.select_next_item(),
        ['<up>'] = cmp.mapping.select_prev_item(),
        ['<down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },

    -- You should specify your *installed* sources.
    sources = {
        --		{ name = 'buffer' },
        { name = 'nvim_lsp' }
    },
})


-- treesitter
require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                -- You can optionally set descriptions to the mappings (used in the desc parameter of
                -- nvim_buf_set_keymap) which plugins like which-key display
                ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                -- You can also use captures from other query groups like `locals.scm`
                ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
            },
            -- You can choose the select mode (default is charwise 'v')
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * method: eg 'v' or 'o'
            -- and should return the mode ('v', 'V', or '<c-v>') or a table
            -- mapping query_strings to modes.
            selection_modes = {
                ['@parameter.outer'] = 'v', -- charwise
                ['@function.outer'] = 'V',  -- linewise
                ['@class.outer'] = '<c-v>', -- blockwise
            },
            -- If you set this to `true` (default is `false`) then any textobject is
            -- extended to include preceding or succeeding whitespace. Succeeding
            -- whitespace has priority in order to act similarly to eg the built-in
            -- `ap`.
            --
            -- Can also be a function which gets passed a table with the keys
            -- * query_string: eg '@function.inner'
            -- * selection_mode: eg 'v'
            -- and should return true of false
            include_surrounding_whitespace = true,
        },
    },
}

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)

local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['bashls'].setup { capabilities = capabilities }
require('lspconfig')['cssls'].setup { capabilities = capabilities }
require('lspconfig')['eslint'].setup { capabilities = capabilities }
require('lspconfig')['html'].setup { capabilities = capabilities }
require('lspconfig')['jsonls'].setup { capabilities = capabilities }
require('lspconfig')['tsserver'].setup { capabilities = capabilities }
require('lspconfig')['lua_ls'].setup { capabilities = capabilities }
require('lspconfig')['remark_ls'].setup { capabilities = capabilities }
require('lspconfig')['perlnavigator'].setup { capabilities = capabilities }
require('lspconfig')['pylsp'].setup { capabilities = capabilities }
require('lspconfig')['sqlls'].setup { capabilities = capabilities }
require('lspconfig')['stylelint_lsp'].setup { capabilities = capabilities }
require('lspconfig')['lemminx'].setup { capabilities = capabilities }
require('lspconfig')['yamlls'].setup { capabilities = capabilities }

-- lsp signature
require("lsp_signature").setup()

-- lsp saga
require('lspsaga').setup({})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function() vim.highlight.on_yank({ timeout = 350, higroup = 'Visual' }) end
})
