return {
  -- Auto-save plugin
  {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    opts = {
      enabled = true,
    },
    keys = {
      { "<leader>n", "<cmd>ASToggle<CR>", desc = "Toggle autosave" },
    },
  },
  {
    "debugloop/telescope-undo.nvim",
    dependencies = { -- note: optimal dependency section
      {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
    keys = {
      { -- lazy style key map
        "<leader>su",
        "<cmd>Telescope undo<cr>",
        desc = "Undo History",
      },
    },
    opts = {
      -- specific configuration for telescope-undo goes here
      extensions = {
        undo = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
        },
      },
    },
    config = function(_, opts)
      -- Calling telescope-undo.setup with extension-specific config
      require("telescope").setup(opts)
      require("telescope").load_extension("undo")
    end,
  },
}
