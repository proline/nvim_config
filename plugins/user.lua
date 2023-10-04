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
  -- {
  --   "hrsh7th/nvim-cmp",
  --   dependencies = {
  --     {
  --       "codota/tabnine-nvim",
  --       build = "./dl_binaries.sh",
  --       config = function()
  --         require("tabnine").setup {
  --           disable_auto_comment = true,
  --           accept_keymap = "<C-i>",
  --           dismiss_keymap = "<C-]>",
  --           debounce_ms = 800,
  --           suggestion_color = { gui = "#808080", cterm = 244 },
  --           exclude_filetypes = { "TelescopePrompt" },
  --         }
  --       end,
  --     },
  --   },
  --   -- override the options table that is used in the require("cmp").setup() call
  --   opts = function(_, opts)
  --     -- opts parameter is the default options table
  --     -- the function is lazy loaded so cmp is able to be required
  --     local cmp = require "cmp"
  --     -- modify the sources part of the options table
  --     opts.sources = cmp.config.sources {
  --       { name = "nvim_lsp", priority = 800 },
  --       { name = "luasnip",  priority = 750 },
  --       { name = "buffer",   priority = 500 },
  --       { name = "path",     priority = 250 },
  --       { name = "tabnine",  priority = 9000 },
  --     }
  --     -- return the new table to be used
  --     return opts
  --   end,
  -- },

  -- Mise en place des commandes lspsaga
  vim.keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>"),
  --
  -- Code action
  vim.keymap.set({ "n", "v" }, "<leader>lsa", "<cmd>Lspsaga code_action<CR>"),
  --
  -- Rename all occurrences of the hovered word for the entire file
  vim.keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>"),
  --
  -- Rename all occurrences of the hovered word for the selected files
  vim.keymap.set("n", "gr", "<cmd>Lspsaga rename ++project<CR>"),

  --
  -- Peek definition
  -- You can edit the file containing the definition in the floating window
  -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
  -- It also supports tagstack
  -- Use <C-t> to jump back
  vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<CR>"),

  -- Go to definition
  vim.keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>"),

  -- Peek type definition
  -- You can edit the file containing the type definition in the floating window
  -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
  -- It also supports tagstack
  -- Use <C-t> to jump back
  vim.keymap.set("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>"),

  -- Go to type definition
  vim.keymap.set("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>"),


  -- Show line diagnostics
  -- You can pass argument ++unfocus to
  -- unfocus the show_line_diagnostics floating window
  vim.keymap.set("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>"),

  -- Show buffer diagnostics
  vim.keymap.set("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>"),

  -- Show workspace diagnostics
  vim.keymap.set("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>"),

  -- Show cursor diagnostics
  vim.keymap.set("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>"),

  -- Diagnostic jump
  -- You can use <C-o> to jump back to your previous location
  vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>"),
  vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>"),

  -- Diagnostic jump with filters such as only jumping to an error
  vim.keymap.set("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end),
  vim.keymap.set("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end),

  -- Toggle outline
  vim.keymap.set("n", "<leader>oo", "<cmd>Lspsaga outline<CR>"),

  -- Hover Doc
  -- If there is no hover doc,
  -- there will be a notification stating that
  -- there is no information available.
  -- To disable it just use ":Lspsaga hover_doc ++quiet"
  -- Pressing the key twice will enter the hover window
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>"),

  -- If you want to keep the hover window in the top right hand corner,
  -- you can pass the ++keep argument
  -- Note that if you use hover with ++keep, pressing this key again will
  -- close the hover window. If you want to jump to the hover window
  -- you should use the wincmd command "<C-w>w"
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>"),

  -- Call hierarchy
  vim.keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>"),
  vim.keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>"),

  -- Floating terminal
  vim.keymap.set({ "n", "t" }, "<A-d>", "<cmd>Lspsaga term_toggle<CR>"),
}
