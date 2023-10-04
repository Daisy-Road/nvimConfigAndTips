local config = {
    cmd = {'/home/wilhemblondel/.local/eclipse.jdt.ls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
 
}

require('jdtls').start_or_attach(config)

--  Setting up cmp for code completion
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
	    require("luasnip").lsp_expand(args.body)
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
        { name = "nvim_lsp" },
	{ name = "luasnip" },
    }, {
        { name = "buffer"},
    }),
})

