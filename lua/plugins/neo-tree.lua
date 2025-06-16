return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			filtered_items = {
				hide_by_name = {
					".git",
				},
				hide_dotfiles = false,
				hide_gitignored = false,
				show_hidden_count = true,
				visible = true,
			},
		},
	},
	keys = {
		{ "<C-n>", "<cmd>Neotree filesystem reveal left<CR>", desc = "Toggle Neo-tree" },
	},
}
