return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      find_command = { "git", "ls-files", "--cached", "--others", "--exclude-standard" },
      wrap_results = true,
      layout_config = {
        horizontal = {
          width = 0.95,
          preview_width = 0.65,
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
      },
    },
  },
  config = function()
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, {} )
    vim.keymap.set("n", "<leader>fd", builtin.live_grep, {})
  end,
}
