return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  ft = "markdown",
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "/Users/sebastianbecker/Library/Mobile Documents/iCloud~md~obsidian/Documents/BigBrain/",
      },
    },
  },
}
