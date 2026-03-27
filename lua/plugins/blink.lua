---@type LazySpec
-- Tab = next item; Enter = accept LSP/completion (blink). S-Tab = AI accept (cursor-tab). C-p = previous item.
return {
  "Saghen/blink.cmp",
  opts = function(_, opts)
    opts.keymap = vim.tbl_extend("force", opts.keymap or {}, {
      ["<CR>"] = { "accept", "fallback" },  -- Enter: accept LSP/completion suggestion
      ["<C-p>"] = { "select_prev", "fallback" },  -- Ctrl-p: previous item (S-Tab reserved for AI accept)
      ["<S-Tab>"] = false,  -- disable: reserved for cursor-tab AI accept (nil is not merged by pairs())
    })
    return opts
  end,
}
