-- Source: https://github.com/shamindras/mydots/blob/main/config/nvim/lua/shamindras/plugins/lsp/null-ls.lua#L51
-- import null-ls plugin safely
local setup, null_ls = pcall(require, 'null-ls')
if not setup then
  return
end

-- for conciseness
local formatting = null_ls.builtins.formatting -- to setup formatters
local diagnostics = null_ls.builtins.diagnostics -- to setup linters
-- local code_actions = null_ls.builtins.code_actions -- to take specific code actions

-- to setup format on save
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})

-- configure null_ls
null_ls.setup({
  -- start in debug mode, should be `false` in general
  debug = false,
  -- setup formatters & linters
  sources = {
    -- lua
    formatting.stylua,
    -- text
    -- code_actions.proselint,
    -- shell
    formatting.shfmt,
    formatting.shellharden,
    diagnostics.shellcheck,
    -- python
    formatting.black,
    formatting.isort,
    diagnostics.flake8,
  },
  -- configure format on save
  on_attach = function(current_client, bufnr)
    if current_client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            filter = function(client)
              --  only use null-ls for formatting instead of lsp server
              return client.name == 'null-ls'
            end,
            bufnr = bufnr,
          })
        end,
      })
    end
  end,
})
