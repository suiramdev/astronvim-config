---@type LazySpec
return {
  {
    "ydkulks/cursor-dark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      transparent = false,
    },
    config = function(_, opts) require("cursor-dark").setup(opts) end,
  },
}
