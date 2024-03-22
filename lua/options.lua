require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
local opt = vim.opt
opt.mouse = "v"
-- vim.cmd [[
-- set spelllang=en,cjk
-- set spellsuggest=best,9
-- ]]
opt.clipboard = ""
if vim.loop.os_uname().version:match "Windows" then
  opt.shell = "pwsh"
  opt.shellcmdflag = "-nologo -noprofile -ExecutionPolicy RemoteSigned -command"
  opt.shellxquote = ""
end