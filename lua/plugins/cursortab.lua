---@type LazySpec
return {
  "suiramdev/cursortab.nvim",
  name = "cursortab.nvim",
  dev = true,
  build = "cd server && npm install",
  config = function()
    require("cursor").setup({})
  end,
}
