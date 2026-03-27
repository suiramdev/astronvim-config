--- Neo-tree: nest related TS/TSX files under the main module (same basename).
--- See :h neo-tree-file-nesting

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.nesting_rules = vim.tbl_deep_extend("force", opts.nesting_rules or {}, {
      ["tsx-related"] = {
        pattern = "(.+)%.tsx$",
        files = {
          "%1.stories.tsx",
          "%1.types.tsx",
          "%1.store.tsx",
          "%1.test.tsx",
        },
      },
      ["ts-related"] = {
        pattern = "(.+)%.ts$",
        files = {
          "%1.stories.ts",
          "%1.types.ts",
          "%1.store.ts",
          "%1.test.ts",
        },
      },
    })
    return opts
  end,
}
