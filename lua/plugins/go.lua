return {
	{
		"olexsmir/gopher.nvim",
		ft = "go",
		config = true,
		build = function()
			-- vim.cmd.GoInstallDeps()
			vim.cmd([[silent! GoInstallDeps]])
		end,
		---@type gopher.Config
		opts = {},
	},
}
