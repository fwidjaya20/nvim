return {
	{
		"mason-org/mason.nvim",
		opts = {
			ensure_installed = {
				"eslint_d",
				"gopls",
				"lua_ls",
				"prettier",
				"stylua",
				"tailwindcss",
				"ts_ls",
				"golangci-lint",
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				"tailwindcss",
				"ts_ls",
				"gopls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind.nvim",
		},
		opts = {
			servers = {
				tailwindcss = {},
			},
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.enable("lua_ls")
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})

			vim.lsp.enable("gopls")
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							useany = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
					},
				},
				k,
			})

			vim.lsp.enable("ts_ls")
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
