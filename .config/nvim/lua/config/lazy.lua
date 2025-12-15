require("lazy").setup({
    -- Theme
    'RRethy/base16-nvim',

    -- Tree
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            "3rd/image.nvim" -- Optional image support in preview window
        }
    },

    -- Spectre - for search / replace
    {
        'nvim-pack/nvim-spectre',
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    -- Status bar
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },

    -- Colors highlight
    'NvChad/nvim-colorizer.lua',

    -- Noice - Display the messages nicely
    {
        "folke/noice.nvim",
		-- version = "4.4.7",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    },

    -- Block - visual marking of code blocks
    "HampusHauffman/block.nvim",

    -- Autosave
    'pocco81/auto-save.nvim',

    -- Auto-trim whitespace
    'cappyzawa/trim.nvim',

    -- Easy align
    'junegunn/vim-easy-align',

    -- Highlight
    'RRethy/vim-illuminate',

    -- Comments
    'numToStr/Comment.nvim',

    -- Surround
    'tpope/vim-surround',

    -- Registers
    'gennaro-tedesco/nvim-peekup',

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    -- Vscode-like pictograms
    {
        "onsails/lspkind.nvim",
        event = {
            "VimEnter"
        }
    },

    -- Git decorations
    'lewis6991/gitsigns.nvim',

    -- Auto-completion engine
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "lspkind.nvim",
            "hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
            "hrsh7th/cmp-buffer",   -- buffer auto-completion
            "hrsh7th/cmp-path",     -- path auto-completion
            "hrsh7th/cmp-cmdline"   -- cmdline auto-completion
        }
    },

    -- Code snippet engine
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*"
    },

    -- LSP manager
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    -- LSP Saga
    {
        'nvimdev/lspsaga.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        }
    },

    -- Treesitter
    'nvim-treesitter/nvim-treesitter',
    'nvim-treesitter/nvim-treesitter-textobjects',

    -- Harpoon
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim"
        }
    },

    -- Project management
    "ahmedkhalf/project.nvim",

    -- AI
    "robitx/gp.nvim",

    -- History
    "mbbill/undotree",
})
