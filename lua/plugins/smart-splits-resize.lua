---@type LazySpec
-- Pane resize: CMD+Arrow + OPT+Arrow on macOS, CTRL+Arrow on other platforms.
-- Runs after smart-splits so our keymaps override.
return {
  {
    "mrjones2014/smart-splits.nvim",
    opts = function(_, opts)
      local is_macos = vim.loop.os_uname().sysname == "Darwin"
      if not is_macos then return opts end

      -- Resize callbacks (same as smart-splits)
      local resize_up = function() require("smart-splits").resize_up() end
      local resize_down = function() require("smart-splits").resize_down() end
      local resize_left = function() require("smart-splits").resize_left() end
      local resize_right = function() require("smart-splits").resize_right() end

      -- Apply after astrocore/smart-splits have set their maps (next tick + small delay)
      vim.defer_fn(function()
        -- Remove Ctrl+Arrow resize on macOS
        pcall(vim.keymap.del, "n", "<C-Up>")
        pcall(vim.keymap.del, "n", "<C-Down>")
        pcall(vim.keymap.del, "n", "<C-Left>")
        pcall(vim.keymap.del, "n", "<C-Right>")

        -- Command+Arrow (works in GUIs that support the macOS Command modifier)
        vim.keymap.set("n", "<D-Up>", resize_up, { desc = "Resize split up" })
        vim.keymap.set("n", "<D-Down>", resize_down, { desc = "Resize split down" })
        vim.keymap.set("n", "<D-Left>", resize_left, { desc = "Resize split left" })
        vim.keymap.set("n", "<D-Right>", resize_right, { desc = "Resize split right" })

        -- Option+Arrow: canonical form (works when terminal sends <M-Up> etc.)
        vim.keymap.set("n", "<M-Up>", resize_up, { desc = "Resize split up" })
        vim.keymap.set("n", "<M-Down>", resize_down, { desc = "Resize split down" })
        vim.keymap.set("n", "<M-Left>", resize_left, { desc = "Resize split left" })
        vim.keymap.set("n", "<M-Right>", resize_right, { desc = "Resize split right" })

        -- Ghostty (and many terminals) send Option+Arrow as CSI 1;3 + A/B/C/D.
        -- Map these so OPT+Arrow works inside Ghostty even when <M-Up> isn’t received.
        vim.keymap.set("n", "\x1b[1;3A", resize_up, { desc = "Resize split up (Option+Up)" })
        vim.keymap.set("n", "\x1b[1;3B", resize_down, { desc = "Resize split down (Option+Down)" })
        vim.keymap.set("n", "\x1b[1;3D", resize_left, { desc = "Resize split left (Option+Left)" })
        vim.keymap.set("n", "\x1b[1;3C", resize_right, { desc = "Resize split right (Option+Right)" })
      end, 50)
      return opts
    end,
  },
}
