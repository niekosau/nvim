return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup()
    end,
  },
  {
    "tpope/vim-fugitive",
  },
  -- {
  -- 	"polarmutex/git-worktree.nvim",
  -- 	version = "^2",
  -- 	dependencies = { "nvim-lua/plenary.nvim" },
  -- },
}
