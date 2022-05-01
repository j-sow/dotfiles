local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

   -- webdev stuff
   b.formatting.deno_fmt,
   b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },

   -- Lua
   b.formatting.stylua,
   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

   -- Shell
   b.formatting.shfmt,
   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

   -- cpp
   b.formatting.clang_format,
   b.diagnostics.cppcheck,

   -- protobufs
   b.diagnostics.buf,

   -- python
   b.diagnostics.pylint,
   b.diagnostics.mypy,

   -- emscript (ts, react, vue, js)
   b.diagnostics.eslint_d,

   -- golang
   b.diagnostics.golangci_lint,

   -- json
   b.diagnostics.jsonlint,

   -- markdown
   b.diagnostics.markdownlint,

}

local M = {}

M.setup = function()
   null_ls.setup {
      debug = true,
      sources = sources,
   }
end

return M
