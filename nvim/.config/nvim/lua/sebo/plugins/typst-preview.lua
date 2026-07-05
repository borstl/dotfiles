return {
  "chomosuke/typst-preview.nvim",
  lazy = false,
  version = "1.*",
  build = function()
    require("typst-preview").update()
  end,
  opts = {
    dependencies_bin = {
      tinymist = "tinymist",
    },

    get_main_file = function(path_of_buffer)
      local function is_readable(path)
        return vim.fn.filereadable(path) == 1
      end

      local git_root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
      if git_root and git_root ~= "" then
        local git_main = git_root .. "/main.typ"
        if is_readable(git_main) then
          return git_main
        end
      end

      local local_main = vim.fn.fnamemodify(path_of_buffer, ":p:h") .. "/main.typ"
      if is_readable(local_main) then
        return local_main
      end

      return path_of_buffer
    end,

    get_root = function(path_of_main_file)
      return vim.fn.fnamemodify(path_of_main_file, ":p:h")
    end,
  },
}
