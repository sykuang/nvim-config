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

  -- zsh

  -- Lua
  b.formatting.stylua.with {
    extra_args = { "--config-path", vim.fn.expand "~/.config/nvim/.stylua.toml" },
  },
  -- b.diagnostics.luacheck,

  -- Shell
  b.diagnostics.zsh,
  b.diagnostics.shellcheck,
  b.formatting.beautysh.with {
    extra_args = { "--indent-size", "2" },
  },

  -- python
  b.formatting.black.with {
    filetypes = { "python" },
  },

  -- c/c++
  b.formatting.clang_format.with {
    filetypes = { "c", "cpp", "cs" },
  },

  -- Dockerfile
  b.diagnostics.hadolint,
}
null_ls.setup {
  debug = true,
  sources = sources,
}
