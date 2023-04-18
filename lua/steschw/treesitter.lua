local configs = require("nvim-treesitter.configs")

configs.setup({
	ensure_installed = "all",
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "yaml" },
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ap"] = "@parameter.outer",
				["ip"] = "@parameter.inner",

				["ac"] = "@comment.outer",
			},
			selection_modes = {
				["@function.outer"] = "V",
				["@function.inner"] = "V",

				["@parameter.outer"] = "v",
				["@parameter.inner"] = "v",

				["@comment.outer"] = "V",
			},
			include_surrounding_whitespace = false,
		},
	},
})
