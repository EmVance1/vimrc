local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
	'rust_analyzer',
	'pyright',
	'clangd',
	'lua_ls',
	'asm_lsp'
})

lsp.on_attach(function(client, bufnr)
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "[g", function() vim.diagnostic.goto_end() end, opts)
		vim.keymap.set("n", "]g", function() vim.diagnostic.goto_end() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

