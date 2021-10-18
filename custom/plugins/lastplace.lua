local present, lastplace = pcall(require, "nvim-lastplace")

if not present then
   return
end

local M = {}
M.setup = function()
   lastplace.setup {}
end
return M
