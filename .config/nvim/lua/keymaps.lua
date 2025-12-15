-- Navigation
vim.keymap.set("n", "<M-Left>",  "<C-W>h",                              { desc = "Go to split: left"  })
vim.keymap.set("n", "<M-Right>", "<C-W>l",                              { desc = "Go to split: right" })
vim.keymap.set("n", "<M-Up>",    "<C-W>k",                              { desc = "Go to split: up"    })
vim.keymap.set("n", "<M-Down>",  "<C-W>j",                              { desc = "Go to split: down"  })

vim.keymap.set("n", "<C-Up>",    "<C-y>",                               { desc = "Scroll up"   })
vim.keymap.set("n", "<C-Down>",  "<C-e>",                               { desc = "Scroll down" })

-- Screen / display controls
vim.keymap.set("n", "<M-Q>",     ":Noice dismiss<CR>",                  { desc = "Dismiss Noice" })
vim.keymap.set("i", "<M-Q>",     "<Esc>:Noice dismiss<CR>i",            { desc = "Dismiss Noice" })

vim.keymap.set("n", "<M-q>",     ":bd<CR>",                             { desc = "Close current buffer" })

-- Aliases for common shortcuts
vim.keymap.set("n", "<C-a>",     "gg<S-v><S-g>",                        { desc = "Select all" })

vim.keymap.set("n", "<C-z>",     "u",                                   { desc = "Undo" })
vim.keymap.set("i", "<C-z>",     "<Esc>ui",                             { desc = "Undo" })

vim.keymap.set("n", "<C-_>",     "gcc",                                 { desc = "Toggle comment", remap = true })
vim.keymap.set("v", "<C-_>",     "gcc",                                 { desc = "Toggle comment", remap = true })

vim.keymap.set("n", "<C-t>",     ":e#<CR>",                             { desc = "Re-open last closed file" })

vim.keymap.set("n", "n",         "nzz",                                 { desc = "Next search results, but center view" })

-- File navigation
vim.keymap.set("n", "\\\\",      ":Neotree reveal<CR>",                 { desc = "Dir tree reveal" })
vim.keymap.set("n", "<C-p>",     ":Telescope find_files<CR>",           { desc = "Files"           })
vim.keymap.set("n", "<C-l>",     ":Telescope buffers<CR>",              { desc = "Buffers"         })
vim.keymap.set("n", "<C-r>",     ":Telescope lsp_document_symbols<CR>", { desc = "Symbols"         })
vim.keymap.set("n", "<C-h>",     ":Telescope live_grep<CR>",            { desc = "Grep"            })

-- LSP
vim.keymap.set("n", "<F2>",      ":Lspsaga rename<CR>",                 { desc = "Rename"             })
vim.keymap.set("n", "<F3>",      ":Lspsaga code_action<CR>",            { desc = "Code actions"       })
vim.keymap.set("n", "<F4>",      ":Lspsaga diagnostic_jump_next<CR>",   { desc = "Diagnostics"        })

vim.keymap.set("n", "<F5>",      ":lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>", { desc = "Toggle diagnosctics" })

vim.keymap.set("n", "<F8>",      ":Lspsaga incoming_calls<CR>",         { desc = "Incoming calls"     })
vim.keymap.set("n", "<F12>",     ":Lspsaga goto_definition<CR>",        { desc = "Go to definition"   })
vim.keymap.set("n", "<F11>",     ":Lspsaga peek_definition<CR>",        { desc = "Peek definition"    })
vim.keymap.set("n", "<M-?>",     ":Lspsaga hover_doc ++keep<CR>",       { desc = "Show documentation" })

-- Alias "q" with "Q", a frequent typo
vim.api.nvim_create_user_command("Q", "q", {})

-- Quick access to config
vim.api.nvim_create_user_command("C",  "edit ~/.config/nvim/lua/init.lua",    {})
vim.api.nvim_create_user_command("CC", "edit ~/.config/nvim/lua/keymaps.lua", {})
