return {
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    config = true,
    build = function()
      vim.cmd.GoInstallDeps()
    end,
    ---@type gopher.Config
    opts = {},
  },
}
