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
            -- pn = "potion",
         },
         literal = {
            -- Set the filetype of files named "MyBackupFile" to lua
            -- MyBackupFile = "lua",
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
                autocmd FileType lua setlocal shiftwidth=3 tabstop=3
                ]]
            end,
            --     ["pdf"] = function()
            --         vim.bo.filetype = "pdf"
            --         -- Open in PDF viewer (Skim.app) automatically
            --         vim.fn.jobstart(
            --             "open -a skim " .. '"' .. vim.fn.expand("%") .. '"'
            --         )
            --     end,
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
