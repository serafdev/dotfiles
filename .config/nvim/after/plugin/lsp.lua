-- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v1.x/doc/md/lsp.md
local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
    'tsserver',
    'eslint',
    -- 'sumneko_lua',
    'gopls',
})

lsp.on_attach(function(client, bufnr)
    lsp.buffer_autoformat()
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gf", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gR", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "gA", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
end)

lsp.setup()
