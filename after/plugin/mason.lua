require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "elixirls",
        "clangd"
    },
    automatic_installation = true,
})

