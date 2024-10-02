return {
  "yamatsum/nvim-cursorline",
  config = function ()
    require('nvim-cursorline').setup {
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
      cursorline = {
        enable = false,
      }
    }
  end
}
