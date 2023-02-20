local ok, f = pcall(require, "filetype")

if not ok then
  return
end

f.setup {
  overrides = {
    extensions = {
      -- Set the filetype of *.pn files to potion
      zshrc = "zsh",
    },
    complex = {
      -- Set the filetype of any full filename matching the regex to gitconfig
      [".*git/config"] = "gitconfig", -- Included in the plugin
      ["init.d/S*"] = "sh", -- etc/init.d/S**
    },

    -- The same as the ones above except the keys map to functions
    function_extensions = {
      ["lua"] = function()
        vim.bo.filetype = "lua"
        -- Remove annoying indent jumping
        -- vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
        vim.cmd [[
                autocmd FileType lua setlocal shiftwidth=2 tabstop=2
                ]]
      end,
      ["c"] = function()
        vim.bo.filetype = "c"
        vim.cmd [[
                autocmd FileType c setlocal shiftwidth=4 tabstop=4
                ]]
      end,
      ["cpp"] = function()
        vim.bo.filetype = "cpp"
        vim.cmd [[
                autocmd FileType cpp setlocal shiftwidth=4 tabstop=4
                ]]
      end,
      ["zsh"] = function()
        vim.bo.filetype = "zsh"
        vim.cmd [[
                autocmd FileType zsh setlocal shiftwidth=2 tabstop=2
                ]]
        vim.cmd [[ set expandtab ]]
      end,
      ["sh"] = function()
        vim.bo.filetype = "sh"
        vim.cmd [[
                autocmd FileType sh setlocal shiftwidth=2 tabstop=2
                ]]
        vim.cmd [[ set expandtab ]]
      end,
    },

    shebang = {
      -- Set the filetype of files with a dash shebang to sh
      dash = "sh",
    },
  },
}
