local ok, null_ls = pcall(require, "null-ls")

if not ok then
   return
end

local b = null_ls.builtins

local sources = {

   -- JS html css stuff
   b.formatting.prettierd.with {
      filetypes = { "html", "json", "markdown", "css", "javascript", "javascriptreact" },
   },
   b.diagnostics.eslint.with {
      command = "eslint_d",
   },

   -- Lua
   b.formatting.stylua.with {
      extra_args = { "--config-path", vim.fn.expand "~/.config/stylua.toml" },
   },
   -- b.diagnostics.luacheck,

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- black
   b.formatting.black,
}

local M = {}

M.setup = function(on_attach)
   null_ls.config {
      sources = sources,
      debug = true,
   }
   require("lspconfig")["null-ls"].setup { on_attach = on_attach }
end

return M
