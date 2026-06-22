return {
  "chomosuke/typst-preview.nvim",
  lazy = false,
  version = "1.*",
  build = function()
    require("typst-preview").update()
  end,
  opts = {
    dependecies_bin = {
      tinymist = "tinymist", -- Mason-installed tinymist
    },

    -- Path logic: customize to your project layout
    get_main_file = function(path_of_buffer)
      -- Example 1: main.typ in the project root (git root)
      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if git_root and git_root ~= "" then
        return git_root .. "/main.typ"
      end
      -- Fallback: directory of the current buffer
      return vim.fn.fnamemodify(path_of_buffer, ":p:h") .. "/main.typ"
    end,

    get_root = function(path_of_main_file)
      -- Use the directory of main.typ as root
      return vim.fn.fnamemodify(path_of_main_file, ":p:h")
    end,
  },
}
