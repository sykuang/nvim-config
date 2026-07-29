-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}
local copilot_spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
local copilot_frame, copilot_animating = 1, false

local function animate_copilot()
	if not vim.g.copilot_status then
		copilot_frame, copilot_animating = 1, false
		return
	end

	copilot_frame = copilot_frame % #copilot_spinner + 1
	vim.cmd.redrawstatus()
	vim.defer_fn(animate_copilot, 100)
end

M.base46 = {
	theme = "onedark",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.term = {
	float = { row = 0.05, col = 0.05, width = 0.9, height = 0.9 },
}

M.ui = {
	statusline = {
		order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "copilot", "cwd", "cursor" },
		modules = {
			copilot = function()
				for _, term in pairs(vim.g.nvchad_terms or {}) do
					if term.id == "copilot" then
						local state = vim.g.copilot_status
						if state and not copilot_animating then
							copilot_animating = true
							vim.defer_fn(animate_copilot, 100)
						end
						return state and "%#St_Lsp# " .. copilot_spinner[copilot_frame] .. " " .. string.format("%-8s", state) .. " " or ""
					end
				end
				return ""
			end,
		},
	},
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}

return M
