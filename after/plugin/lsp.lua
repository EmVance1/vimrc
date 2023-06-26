local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'rust_analyzer',
	'pyright',
	'clangd',
	'lua_ls',
	'asm_lsp',
    'eslint',
    'tsserver'
})

lsp.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "[g", function() vim.diagnostic.goto_end() end, opts)
		vim.keymap.set("n", "]g", function() vim.diagnostic.goto_end() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
end)

lsp.setup()

