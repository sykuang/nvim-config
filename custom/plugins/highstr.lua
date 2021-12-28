local high_str = require "high-str"

local M = {}

M.setup = function()
   high_str.setup({
     verbosity = 1,
     saving_path = "/tmp/highstr/",
     highlight_colors = {
       -- color_id = {"bg_hex_code",<"fg_hex_code"/"smart">}
       color_0 = {"#0c0d0e", "smart"},	-- Cosmic charcoal
       color_1 = {"#e5c07b", "smart"},	-- Pastel yellow
       color_2 = {"#7FFFD4", "smart"},	-- Aqua menthe
       color_3 = {"#8A2BE2", "smart"},	-- Proton purple
       color_4 = {"#FF4500", "smart"},	-- Orange red
       color_5 = {"#008000", "smart"},	-- Office green
       color_6 = {"#0000FF", "smart"},	-- Just blue
       color_7 = {"#FFC0CB", "smart"},	-- Blush pink
       color_8 = {"#FFF9E3", "smart"},	-- Cosmic latte
       color_9 = {"#7d5c34", "smart"},	-- Fallow brown
     }
   })
   vim.api.nvim_set_keymap(
     "v",
     "<leader>m",
     "v:_G.smart_h()",
     {
         noremap = true,
         silent = true
     }
     )
end

return M
