local present, lastplace = pcall(require, "nvim-lastplace")

-- if not present then
--    return
-- end

local M = {}
M.setup = function()
  lastplace.setup {
    lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
    lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
    lastplace_open_folds = true,
  }
end
return M
