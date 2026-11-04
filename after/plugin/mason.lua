require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "elixirls",
        "clangd",
        "pyright"
    },
    automatic_installation = true,
})
