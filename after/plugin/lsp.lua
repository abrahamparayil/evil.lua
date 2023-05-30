local lsp = require('lsp-zero').preset({
	float_border = 'none',
	configure_diagnostics = false,
})
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
	-- Replace these with whatever servers you want to install
	'tsserver',
	'solargraph',
	'zls'
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()
lsp.set_sign_icons({
	error = '✘',
	warn = '▲',
	hint = '⚑',
	info = '»'
})

cmp.setup({
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
	},
	mapping = {
		['<Tab>'] = cmp_action.tab_complete(),
		['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
	},
	formatting = {
		fields = { 'abbr', 'kind', 'menu' },
		format = require('lspkind').cmp_format({
			mode = 'symbol',             -- show only symbol annotations
			maxwidth = 50,               -- prevent the popup from showing more than provided characters
			ellipsis_char = '...',       -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
		})
	}
})

vim.diagnostic.config({
	virtual_text = false
})
