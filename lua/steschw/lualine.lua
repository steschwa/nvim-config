local lualine = require("lualine")

local lsp_icons = require("steschw.lsp.style").icons

lualine.setup({
	options = {
		theme = "nord",
		section_separators = "",
		component_separators = "",
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = lsp_icons.error .. " ",
					warn = lsp_icons.warn .. " ",
					info = lsp_icons.info .. " ",
					hint = lsp_icons.hint .. " ",
				},
				colored = true,
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				"filename",
				path = 1,
				shorting_target = 100,
			},
		},
		lualine_z = { "branch" },
	},
})
