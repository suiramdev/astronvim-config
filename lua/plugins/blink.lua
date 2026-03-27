---@type LazySpec
-- Tab = AI (Cursor) only; Enter = accept LSP/completion (blink). S-Tab = previous item.
return {
  "Saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = vim.tbl_extend("force", opts.keymap or {}, {
      ["<CR>"] = { "accept", "fallback" }, -- Enter: accept LSP/completion suggestion
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<Tab>"] = false,
    })
    return opts
  end,
}
