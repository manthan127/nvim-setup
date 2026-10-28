require("mason").setup()
local mason_lspconfig = require("mason-lspconfig")

mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls"     -- Lua
    },
    automatic_installation = true,
})

mason_lspconfig.setup({
    automatic_enable = {
        "lua_ls"
    },
    --function(server_name)
    --require("lspconfig")[server_name].setup({})
    --end,
})

