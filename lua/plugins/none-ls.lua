return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local nls = require("null-ls")
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      nls.setup({
        sources = {
          nls.builtins.code_actions.gomodifytags,
          nls.builtins.code_actions.impl,
          nls.builtins.completion.spell,
          ns.builtins.formatting.gofmt,
          nls.builtins.formatting.goimports,
          nls.builtins.formatting.golines,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.stylua,
          require("none-ls.diagnostics.eslint_d"),
        },
        on_attach = function(client, bufnr)
          if client:supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false, bufnr = bufnr })
              end,
            })
          end
        end,
      })

      vim.g.lazyvim_eslint_auto_format = true
      vim.g.lazyvim_prettier_needs_config = true

      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
  },
}
