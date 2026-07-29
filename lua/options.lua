require "nvchad.options"

-- add yours here!

if vim.fn.has("win32") == 1 then
  vim.opt.shell = "pwsh"
  vim.opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
  vim.opt.shellpipe = "> %s 2>&1"
  vim.opt.shellquote = ""
  vim.opt.shellxquote = ""
  vim.opt.shelltemp = false
end

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
