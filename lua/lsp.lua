
local coq = require "coq" -- add this
local lsp = require "lspconfig"


-- ensure LSPs are installed
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "jedi_language_server", "lemminx", "gopls", },
}


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

-- xml lsp --
require'lspconfig'.lemminx.setup(coq.lsp_ensure_capabilities{})

-- C# lsp --
require'lspconfig'.omnisharp.setup(coq.lsp_ensure_capabilities{
    cmd = { "dotnet", "/path/to/omnisharp/OmniSharp.dll" },

    -- Enables support for reading code style, naming convention and analyzer
    -- settings from .editorconfig.
    enable_editorconfig_support = true,

    -- If true, MSBuild project system will only load projects for files that
    -- were opened in the editor. This setting is useful for big C# codebases
    -- and allows for faster initialization of code navigation features only
    -- for projects that are relevant to code that is being edited. With this
    -- setting enabled OmniSharp may load fewer projects and may thus display
    -- incomplete reference lists for symbols.
    enable_ms_build_load_projects_on_demand = false,

    -- Enables support for roslyn analyzers, code fixes and rulesets.
    enable_roslyn_analyzers = true,

    -- Specifies whether 'using' directives should be grouped and sorted during
    -- document formatting.
    organize_imports_on_format = false,

    -- Enables support for showing unimported types and unimported extension
    -- methods in completion lists. When committed, the appropriate using
    -- directive will be added at the top of the current file. This option can
    -- have a negative impact on initial completion responsiveness,
    -- particularly for the first few completion sessions after opening a
    -- solution.
    enable_import_completion = false,

    -- Specifies whether to include preview versions of the .NET SDK when
    -- determining which version to use for project loading.
    sdk_include_prereleases = true,

    -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
    -- true
    analyze_open_documents_only = true,
})
-- crystal lsp crystalline --
require'lspconfig'.crystalline.setup(coq.lsp_ensure_capabilities{})
-- laTEX --

-- Markdown --

-- Typst --
require'lspconfig'.typst_lsp.setup(coq.lsp_ensure_capabilities{
	root_dir = require'lspconfig'.util.root_pattern('*typ')
})

-- Gopls --
require'lspconfig'.gopls.setup(coq.lsp_ensure_capabilities{})

-- Rust --
require'lspconfig'.rust_analyzer.setup(coq.lsp_ensure_capabilities{})

-- emmet --
require'lspconfig'.emmet_language_server.setup(coq.lsp_ensure_capabilities{})

-- asm --
require'lspconfig'.asm_lsp.setup(coq.lsp_ensure_capabilities{
	root_dir = require'lspconfig'.util.root_pattern('*asm')
})

require'lspconfig'.clangd.setup(coq.lsp_ensure_capabilities{})



-- cmake lsp --
require'lspconfig'.neocmake.setup(coq.lsp_ensure_capabilities{})


-- meson lsp --
require'lspconfig'.mesonlsp.setup(coq.lsp_ensure_capabilities{})

-- zig lsp --
require'lspconfig'.zls.setup{}
