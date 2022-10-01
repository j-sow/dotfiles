-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  user = function()
    vim.opt.number = false
    vim.g.mapleader = ","
    vim.opt.numberwidth = 2
    vim.opt.relativenumber = false
    vim.opt.expandtab = true
    vim.opt.shiftwidth = 2
    vim.opt.tabstop = 2
  end,
}

M.ui = {
  theme = "chadracula",
  statusline = {
    separator_style = "round",
  },
}

M.mappings = {
  general = {
    n = {
      ["<space>n"] = { "<cmd> set nu! <CR>", "   toggle line number" },
			["<leader>ft"] = { ":Telescope treesitter<CR>", "toggle telescope for treesitter"},
			["<leader>gb"] = { ":Gitsigns toggle_current_line_blame<CR>", "Toggle git blame"},
			["<leader>gr"] = { ":Telescope lsp_references<CR>", "toggle telescope for lsp references"},
    }
  },
  nvimtree = {
    n = {
      -- toggle
      ["<leader>n"] = { "<cmd> NvimTreeToggle <CR>", "   toggle nvimtree" },
      -- focus
      ["<leader>e"] = { "<cmd> NvimTreeFocus <CR>", "   focus nvimtree" },
    },
  },
  bufferline = {
    n = {
      -- new buffer
      ["<S-b>"] = { "<cmd> enew <CR>", "烙 new buffer" },

      -- cycle through buffers
      ["<C-n>"] = { "<cmd> BufferLineCycleNext <CR>", "  cycle next buffer" },
      ["<C-p>"] = { "<cmd> BufferLineCyclePrev <CR>", "  cycle prev buffer" },

      -- close buffer + hide terminal buffer
      ["<leader>q"] = {
         function()
            require("core.utils").close_buffer()
         end,
         "   close buffer",
      },
    },
  }
}


M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.configs.lsp_configs"
    },
  },
  override = {
    ["kyazdani42/nvim-tree.lua"] = {
      renderer = { 
        git = {
          enable = true,
        }
      },
      view = {
         side = "left",
         width = "20%",
         hide_root_folder = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      }
    }
  },
  user = {
    ["ur4ltz/surround.nvim"] = {
      config = function()
        require("surround").setup {mappings_style = "sandwich"}
      end
    },
    ["lambdalisue/suda.vim"] = {},
    ["jose-elias-alvarez/null-ls.nvim"] = {
      after = "nvim-lspconfig",
      config = function()
         require("custom.configs.null-ls").setup()
      end
    },
  },
}

return M
