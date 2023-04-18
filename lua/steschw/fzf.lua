local fzf = require("fzf-lua")

local prompt = "  "
local pointer = "  "

fzf.setup({
	"telescope",
	winopts_fn = function()
		local win_width = vim.o.columns
		return {
			width = win_width <= 150 and win_width - 4 or win_width - 32,
		}
	end,
	fzf_opts = {
		["--delimiter"] = "/",
		["--with-nth"] = "-2..",
		["--info"] = "hidden",
		["--no-scrollbar"] = "",
		["--pointer"] = pointer,
		["--padding"] = "1%,2%",
	},
	files = {
		prompt = prompt,
		fd_opts = "--color=never --type f --hidden --exclude node_modules --exclude .git",
	},
	grep = {
		prompt = prompt,
	},
	lsp = {
		prompt = prompt,
		sync = true,
		symbols = {
			prompt = prompt,
			symbol_style = 3,
		},
	},
	oldfiles = {
		prompt = prompt,
	},
})
