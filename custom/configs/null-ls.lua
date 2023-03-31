local ok, null_ls = pcall(require, "null-ls")

if not ok then
  return
end

local b = null_ls.builtins
local function get_stylua()
  if vim.loop.os_uname().version:match "Windows" then
    return vim.fn.expand "~/AppData/Local/nvim/.stylua.toml"
  else
    return vim.fn.expand "~/.config/nvim/.stylua.toml"
  end
end
local function get_black_cmd()
  if vim.loop.os_uname().version:match "Windows" then
    return "black.cmd"
  else
    return "black"
  end
end
local sources = {

  -- JS html css stuff
  b.formatting.prettierd.with {
    filetypes = { "html", "markdown", "css", "javascript", "javascriptreact", "typescript", "yaml" },
  },
  b.diagnostics.tsc,

  -- JSON
  b.formatting.fixjson,

  -- Lua
  b.formatting.stylua.with {
    extra_args = { "--config-path", get_stylua() },
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
    command = get_black_cmd(),
  },

  -- c/c++
  b.formatting.clang_format.with {
    filetypes = { "c", "cpp", "cs" },
  },

  -- Dockerfile
  b.diagnostics.hadolint,

  -- Spell
  b.completion.spell,
  b.diagnostics.codespell,
}

null_ls.setup {
  -- debug = true,
  sources = sources,
}
