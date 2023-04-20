return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({})
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "codota/tabnine-nvim",
        build = "./dl_binaries.sh",
        config = function()
          require("tabnine").setup {
            disable_auto_comment = true,
            accept_keymap = "<C-i>",
            dismiss_keymap = "<C-]>",
            debounce_ms = 800,
            suggestion_color = { gui = "#808080", cterm = 244 },
            exclude_filetypes = { "TelescopePrompt" },
          }
        end,
      },
    },
    -- override the options table that is used in the require("cmp").setup() call
    opts = function(_, opts)
      -- opts parameter is the default options table
      -- the function is lazy loaded so cmp is able to be required
      local cmp = require "cmp"
      -- modify the sources part of the options table
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 800 },
        { name = "luasnip",  priority = 750 },
        { name = "buffer",   priority = 500 },
        { name = "path",     priority = 250 },
        { name = "tabnine",  priority = 9000 },
      }
      -- return the new table to be used
      return opts
    end,
  },
}
