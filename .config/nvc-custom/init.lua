-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

-- MAPPINGS
-- To add new mapps, use the "setup_mappings" hook,
-- local map = require("core.utils").map
-- 
--  map("n", "<leader>q", ":bd<CR>", opt)
--  map("n", "<leader>ft", ":Telescope treesitter<CR>")
--  map("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
--  map("n", "<leader>gr", ":Telescope lsp_references<CR>")

-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

-- Install plugins
-- To add new plugins, use the "install_plugin" hook,

-- examples below:
-- local customPlugins = require("core.customPlugins")
-- customPlugins.add(function(use)
--    use {
--      "ur4ltz/surround.nvim",
--       config = function()
--         require("surround").setup {mappings_style = "sandwich"}
--       end
--    }
--    use {
--      "lambdalisue/suda.vim"
--    }
--    use {
--       "jose-elias-alvarez/null-ls.nvim",
--       after = "nvim-lspconfig",
--       config = function()
--          require("custom.configs.null-ls").setup()
--       end
--    }
-- end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
