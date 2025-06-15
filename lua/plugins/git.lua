return {
	{
		"f-person/git-blame.nvim",
		event = "VeryLazy",
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			vim.keymap.set("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", {})
			vim.keymap.set("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", {})
			vim.keymap.set("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", {})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		dependencies = {
			"nvim-telescope/telescope.nvim",
			"nvim-lua/plenary.nvim",
		},
		keys = {
			{ "<leader>lg", "<cmd>wall | LazyGit<cr>", desc = "Open lazy git" },
		},
		config = function()
			require("telescope").load_extension("lazygit")
		end,
	},
}
