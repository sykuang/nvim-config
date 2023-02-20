local ok, g = pcall(require, "guess-indent")

if not ok then
  return
end
local M = {}
M.setup = function()
  -- This is the default configuration
  g.setup {
    auto_cmd = true, -- Set to false to disable automatic execution
    filetype_exclude = { -- A list of filetypes for which the auto command gets disabled
      "netrw",
      "tutor",
    },
    buftype_exclude = { -- A list of buffer types for which the auto command gets disabled
      "help",
      "nofile",
      "terminal",
      "prompt",
    },
  }
end
return M
