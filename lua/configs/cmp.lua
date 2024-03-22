local cmp = require "cmp"
cmp.setup {
  -- preselect = cmp.PreselectMode.None,
  sources = {
    {
      name = "copilot",
    },
    {
      name = "nvim_lsp",
    },
    {
      name = "luasnip",
    },
    {
      name = "buffer",
    },
    {
      name = "nvim_lua",
    },
    {
      name = "path",
    },
  },
  mapping = {
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<Tab>"] = function(callback)
      callback()
    end,

    ["<S-Tab>"] = function(callback)
      callback()
    end,
  },
}
