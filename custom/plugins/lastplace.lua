local present, lastplace = pcall(require, "nvim-lastplace")

if not present then
   return
end

vim.opt.completeopt = "menuone,noselect"

-- nvim-cmp setup
lastplace.setup {
}
return lastplace
