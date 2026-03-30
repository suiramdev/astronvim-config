-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

---@type LazySpec
return {
  "folke/sidekick.nvim",
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = assert(opts.mappings)
        local prefix = "<Leader>A"

        -- Normal mode mappings
        maps.n[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }
        maps.n[prefix .. "a"] = {
          function() require("sidekick.cli").toggle() end,
          desc = "Sidekick Toggle CLI",
        }
        maps.n[prefix .. "s"] = {
          function() require("sidekick.cli").select() end,
          desc = "Select CLI",
        }
        maps.n[prefix .. "d"] = {
          function() require("sidekick.cli").close() end,
          desc = "Detach a CLI Session",
        }
        maps.n[prefix .. "t"] = {
          function() require("sidekick.cli").send { msg = "{this}" } end,
          desc = "Send This",
        }
        maps.n[prefix .. "f"] = {
          function() require("sidekick.cli").send { msg = "{file}" } end,
          desc = "Send File",
        }
        maps.n[prefix .. "p"] = {
          function() require("sidekick.cli").prompt() end,
          desc = "Select Prompt",
        }

        maps.n[prefix .. "n"] = { desc = require("astroui").get_icon("SidekickBrain", 1, true) .. "NES" }
        maps.n[prefix .. "nt"] = {
          function() require("sidekick.nes").toggle() end,
          desc = "Toggle NES",
        }
        maps.n[prefix .. "ne"] = {
          function() require("sidekick.nes").enable() end,
          desc = "Enable NES",
        }
        maps.n[prefix .. "nd"] = {
          function() require("sidekick.nes").disable() end,
          desc = "Disable NES",
        }
        maps.n[prefix .. "nu"] = {
          function() require("sidekick.nes").update() end,
          desc = "Update Suggestions",
        }

        maps.n["<Tab>"] = {
          function()
            if not require("sidekick").nes_jump_or_apply() then return "<Tab>" end
          end,
          expr = true,
          desc = "Goto/Apply Next Edit Suggestion",
        }
        maps.n["<C-.>"] = {
          function() require("sidekick.cli").toggle {} end,
          desc = "Sidekick Toggle",
        }

        -- Visual mode mappings
        maps.x[prefix] = { desc = require("astroui").get_icon("Sidekick", 1, true) .. "Sidekick" }
        maps.x[prefix .. "t"] = {
          function() require("sidekick.cli").send { msg = "{this}" } end,
          desc = "Send This",
        }
        maps.x[prefix .. "v"] = {
          function() require("sidekick.cli").send { msg = "{selection}" } end,
          desc = "Send Visual Selection",
        }
        maps.x[prefix .. "p"] = {
          function() require("sidekick.cli").prompt {} end,
          desc = "Select Prompt",
        }
        maps.x["<C-.>"] = {
          function() require("sidekick.cli").toggle {} end,
          desc = "Sidekick Toggle",
        }

        -- Insert mode mappings
        maps.i["<C-.>"] = {
          function() require("sidekick.cli").toggle {} end,
          desc = "Sidekick Toggle",
        }

        -- Terminal mode mappings
        maps.t["<C-.>"] = {
          function() require("sidekick.cli").toggle {} end,
          desc = "Sidekick Toggle",
        }
      end,
    },
    { "AstroNvim/astroui", opts = { icons = { Sidekick = "", SidekickBrain = "󰧑" } } },
  },
  opts = {
    nes = {
      enabled = true, -- If the user doesn't have the copilot LSP running internally this gets set as false
    },
    cli = {
      ---@class sidekick.cli.Mux
      ---@field backend? "tmux"|"zellij" Multiplexer backend to persist CLI sessions
      mux = {
        enabled = true,
      },
      --- Actual cli tool config is loaded from the runtime path `sk/cli/{tool}.lua` and merged with the config below.
      --- For default configs, see https://github.com/folke/sidekick.nvim/tree/main/sk/cli
      ---@type table<string, sidekick.cli.Config|{}>
      tools = {
        claude = {
          -- Run the Claude Code CLI with permission checks skipped.
          -- This gets passed directly as an argv to the `claude` command.
          cmd = { "claude", "--dangerously-skip-permissions" },
        },
      },
    },
  },
}
