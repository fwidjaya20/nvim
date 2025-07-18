return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "latte",
			background = {
				dark = "frappe",
				light = "latte",
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
