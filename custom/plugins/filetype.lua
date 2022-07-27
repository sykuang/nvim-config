local ok, f = pcall(require, "filetype")

if not ok then
  return
end

-- In init.lua or filetype.nvim's config file
local M = {}

M.setup = function()
  f.setup {
    overrides = {
      extensions = {
        -- Set the filetype of *.pn files to potion
        zshrc = "sh",
      },
      literal = {
        -- Set the filetype of files named "MyBackupFile" to lua
        -- MyBackupFile = "lua",
      },
      complex = {
        -- Set the filetype of any full filename matching the regex to gitconfig
        [".*git/config"] = "gitconfig", -- Included in the plugin
        [".zshrc"] = "sh", -- root/projects
        ["init.d/S*"] = "sh", -- etc/init.d/S**
        -- Roku stuffs
        ["root/projects"] = "json", -- root/projects
        ["shared/board/Base"] = "json", -- root/projects
        ["panelhdr_*"] = "json", -- root/projects
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
          vim.bo.filetype = "sh"
          vim.cmd [[
                autocmd FileType sh setlocal shiftwidth=2 tabstop=2
                ]]
          vim.cmd [[ set expandtab ]]
        end,
      },
      -- function_literal = {
      --     Brewfile = function()
      --         vim.cmd("syntax off")
      --     end,
      -- },
      -- function_complex = {
      --     ["*.math_notes/%w+"] = function()
      --         vim.cmd("iabbrev $ $$")
      --     end,
      -- },

      shebang = {
        -- Set the filetype of files with a dash shebang to sh
        dash = "sh",
        sh = "sh",
        zsh = "sh",
      },
    },
  }
end

return M
