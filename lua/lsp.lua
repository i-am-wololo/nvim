local lsp = require "lspconfig"
local coq = require "coq" -- add this

vim.cmd('COQnow --shut-up')

-- lua lsp --
lsp.lua_ls.setup( coq.lsp_ensure_capabilities{
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- jedi lsp (python) --
require'lspconfig'.jedi_language_server.setup(coq.lsp_ensure_capabilities{})

