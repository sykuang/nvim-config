require("copilot").setup {
  suggestion = {
    enabled = false,
    auto_trigger = true,
  },
  panel = { enabled = false },
  filetypes = {
    yaml = false,
    markdown = true,
    help = false,
    gitcommit = true,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ["."] = false,
  },
}
