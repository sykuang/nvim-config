local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.settings {
      ui = {
         icons = {
            server_installed = "﫟",
            server_pending = "",
            server_uninstalled = "✗",
         },
      },
   }
   local function switch_source_header_splitcmd(bufnr, splitcmd)
      bufnr = require("lspconfig").util.validate_bufnr(bufnr)
      local clangd_client = require("lspconfig").util.get_active_client_by_name(bufnr, "clangd")
      local params = { uri = vim.uri_from_bufnr(bufnr) }
      if clangd_client then
         clangd_client.request("textDocument/switchSourceHeader", params, function(err, result)
            if err then
               error(tostring(err))
            end
            if not result then
               print "Corresponding file can’t be determined"
               return
            end
            vim.api.nvim_command(splitcmd .. " " .. vim.uri_to_fname(result))
         end, bufnr)
      else
         print "textDocument/switchSourceHeader is not supported by the clangd server active on the current buffer"
      end
   end
   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
         settings = {},
      }
      require("lspconfig").clangd.setup {
         commands = {
            ClangdSwitchSourceHeader = {
               function()
                  switch_source_header_splitcmd(0, "edit")
               end,
               description = "Open source/header in current buffer",
            },
            ClangdSwitchSourceHeaderVSplit = {
               function()
                  switch_source_header_splitcmd(0, "vsplit")
               end,
               description = "Open source/header in a new vsplit",
            },
            ClangdSwitchSourceHeaderSplit = {
               function()
                  switch_source_header_splitcmd(0, "split")
               end,
               description = "Open source/header in a new split",
            },
         },
      }
      require("lspconfig").pylsp.setup {
         on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
         end,
      }
      -- basic example to edit lsp server's options, disabling tsserver's inbuilt formatter
      --if server.name == 'tsserver' then
      --opts.on_attach = function(client, bufnr)
      -- client.resolved_capabilities.document_formatting = false
      --vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
      --end,
      --end,
      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
