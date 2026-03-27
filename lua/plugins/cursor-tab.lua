return {
  "bengu3/cursor-tab.nvim",
  config = function()
    local cursor_tab = require "cursor-tab"

    cursor_tab.setup()

    -- Remove plugin's default <Tab> mapping so we can use Shift+Tab for AI accept
    pcall(vim.keymap.del, "i", "<Tab>")

    -- Use <S-Tab> (Shift+Tab) to accept AI suggestions only; do nothing when no suggestion
    -- so blink's completion/snippet doesn't get triggered
    vim.keymap.set("i", "<S-Tab>", function()
      if cursor_tab.accept_suggestion() then
        return ""
      end
      return ""  -- consume key when no AI suggestion (don't pass through to blink)
    end, { expr = true, noremap = false, silent = true })
  end,
}
