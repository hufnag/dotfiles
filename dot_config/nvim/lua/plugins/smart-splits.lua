return {
  -- {
  --   "mrjones2014/smart-splits.nvim",
  --   opts = {
  --     multiplexer_integration = "zellij",
  --     zellij_move_focus_or_tab = false,
  --   },
  --   keys = {
  --     {
  --       "<C-h>",
  --       function()
  --         require("smart-splits").move_cursor_left()
  --       end,
  --       desc = "Move left",
  --     },
  --     {
  --       "<C-j>",
  --       function()
  --         require("smart-splits").move_cursor_down()
  --       end,
  --       desc = "Move down",
  --     },
  --     {
  --       "<C-k>",
  --       function()
  --         require("smart-splits").move_cursor_up()
  --       end,
  --       desc = "Move up",
  --     },
  --     {
  --       "<C-l>",
  --       function()
  --         require("smart-splits").move_cursor_right()
  --       end,
  --       desc = "Move right",
  --     },
  --   },
  -- },
  {
    "swaits/zellij-nav.nvim",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { silent = true, desc = "navigate left or tab" } },
      { "<c-j>", "<cmd>ZellijNavigateDown<cr>",     { silent = true, desc = "navigate down" } },
      { "<c-k>", "<cmd>ZellijNavigateUp<cr>",       { silent = true, desc = "navigate up" } },
      { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
    },
    opts = {},
  },
}
