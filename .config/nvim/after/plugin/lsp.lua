-- Modern LSP setup using vim.lsp.config (nvim 0.11+)
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'eslint',
        'lua_ls',
        'gopls',
    }
})

-- LSP keymaps
local on_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gf", function() vim.lsp.buf.format({ async = false, timeout_ms = 10000 }) end, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gR", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "gA", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
end

-- Auto-completion
local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})

-- Setup LSP servers with new vim.lsp.config
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.lsp.config.ts_ls = {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'javascript', 'typescript', 'typescriptreact', 'javascriptreact' },
    on_attach = on_attach,
    capabilities = capabilities,
}

vim.lsp.config.lua_ls = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },
        },
    },
}

vim.lsp.config.gopls = {
    cmd = { 'gopls' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- Enable LSP for file types
vim.lsp.enable({ 'ts_ls', 'lua_ls', 'gopls' })
