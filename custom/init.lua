require "custom.mappings"
local opt = vim.opt
opt.mouse = "v"
vim.cmd [[
set spelllang=en,cjk
set spellsuggest=best,9
]]
vim.opt.clipboard = ""
