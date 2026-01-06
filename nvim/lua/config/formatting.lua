local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.stylua,
  },
})

local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

vim.api.nvim_create_autocmd('BufWritePre', {
  group = augroup,
  callback = function()
    vim.lsp.buf.format({
      async = false,
      filter = function(client)
        return client.name == 'null-ls'
      end,
    })
  end,
})
