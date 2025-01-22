require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls","ast_grep","eslint"}
})

local lsp = require('lsp-zero')
lsp.preset("recommended")

require("lspconfig").lua_ls.setup {}
require("lspconfig").ast_grep.setup {}
require("lspconfig").eslint.setup {}

local cmp = require("cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-p>'] = cmp.mapping.select_prev_item(cmp.select),
	['<C-n>'] = cmp.mapping.select_next_item(cmp.select),
	['<C-y>'] = cmp.mapping.confirm({select = true}),
	['<C-Space>'] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings
})

lsp.set_preferences({
	sign_icons = { }
})

lsp.setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
