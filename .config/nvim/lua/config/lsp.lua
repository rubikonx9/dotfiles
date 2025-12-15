require('mason').setup()

require('mason-lspconfig').setup({
    -- A list of servers to automatically install if they're not already installed
    ensure_installed = {
        'bashls',
        'eslint',
        'html',
        'jsonls',
        'lua_ls',
        'perlnavigator',
        'pkgbuild_language_server',
        'pylsp',
        'somesass_ls',
        'sqlls',
        'ts_ls',
        'vimls'
    },
})


-- local lspconfig    = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config.bashls = {}
vim.lsp.config.eslint = {
    cmd = { "vscode-eslint-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
    capabilities = capabilities,
    settings = {
        -- eslint = {
            enable = true,
            format = true,
            run = "onSave",
            quiet = false,
            -- nodePath = '/usr/lib/node_modules/' -- This is required as eslint is installed with NPM manually
        -- },
        experimental = {
            useFlatConfig = true
        },
    },
    root_markers = { "eslint.config.cjs" }
}
        -- nodePath = '/usr/lib/node_modules/eslint/lib/' -- This is required as eslint is installed with NPM manually

vim.lsp.config.html = {}
vim.lsp.config.jsonls = {}
vim.lsp.config.lua_ls = {
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {
                    'vim',
                    'require'
                }
            }
        }
    }
}

vim.lsp.config.perlnavigator = {}
vim.lsp.config.pkgbuild_language_server = {}
vim.lsp.config.pylsp = {}
vim.lsp.config.sqlls = {}
vim.lsp.config.somesass_ls = {}
vim.lsp.config.ts_ls = {}
vim.lsp.config.vimls = {}

require('lspsaga').setup({})

vim.lsp.enable({ "bashls" })
vim.lsp.enable({ "eslint" })
vim.lsp.enable({ "html" })
vim.lsp.enable({ "jsonls" })
vim.lsp.enable({ "lua_ls" })
vim.lsp.enable({ "perlnavigator" })
vim.lsp.enable({ "pkgbuild_language_server" })
vim.lsp.enable({ "pylsp" })
vim.lsp.enable({ "sqlls" })
vim.lsp.enable({ "somesass_ls" })
vim.lsp.enable({ "ts_ls" })
vim.lsp.enable({ "vimls" })
