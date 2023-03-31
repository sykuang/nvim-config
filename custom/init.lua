local opt = vim.opt
opt.mouse = "v"
-- vim.cmd [[
-- set spelllang=en,cjk
-- set spellsuggest=best,9
-- ]]
opt.clipboard = ""
if vim.loop.os_uname().version:match "Windows" then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
  vim.opt.shellxquote = ""
end
