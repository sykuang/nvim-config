local M = {}
M.clipboard = false
function M.Toggle()
   if M.clipboard then
      vim.opt.clipboard = ""
      M.clipboard = false
   else
      vim.opt.clipboard = "unnamedplus"
      M.clipboard = true
   end
   print("Copy to clipboard:", M.clipboard)
end

return M
