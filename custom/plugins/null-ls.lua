local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins

local sources = {

  -- JS html css stuff
  b.formatting.prettierd.with {
    filetypes = { "html", "json", "markdown", "css", "javascript", "javascriptreact", "typescript", "yaml" },
  },
  b.diagnostics.tsc,
  b.diagnostics.jsonlint,

  -- Lua
  b.formatting.stylua.with {
    extra_args = { "--config-path", vim.fn.expand "~/.config/nvim/.stylua.toml" },
  },
  -- b.diagnostics.luacheck,

  -- Shell
  b.formatting.shfmt.with {
    extra_args = { "-s", "-i", "2" },
  },
  b.diagnostics.zsh,

  -- black
  b.formatting.black.with {
    filetypes = { "python" },
  },

  -- clang-format
  b.formatting.clang_format.with {
    filetypes = { "c", "cpp", "cs" },
  },
}

local M = {}

M.setup = function()
  null_ls.setup {
    sources = sources,
    debug = true,
  }
  -- vim.g.null_ls_disable = true
end

return M
