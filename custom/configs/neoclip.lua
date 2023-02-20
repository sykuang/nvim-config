local ok, neoclip = pcall(require, "neoclip")
if not ok then
  return
end
neoclip.setup {
  keys = {
    telescope = {
      i = {
        select = "<cr>",
        paste = "<c-p>",
        paste_behind = "<c-k>",
        custom = {},
      },
      n = {
        select = "<cr>",
        paste = "p",
        paste_behind = "P",
        custom = {},
      },
    },
  },
}
