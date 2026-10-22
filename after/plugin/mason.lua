require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",     -- Lua
    },
    automatic_installation = true,
})

require("mason-lspconfig").setup({
    automatic_enable = {
        "luai_ls"
    },
    --function(server_name)
    --require("lspconfig")[server_name].setup({})
    --end,
})

