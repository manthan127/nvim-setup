local langs = { "c", "elixir", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" }
local ts = require('nvim-treesitter')
local vim = vim
ts.setup({
    -- Optional: directory to install parsers (defaults to data/site)
    install_dir = vim.fn.stdpath('data') .. '/site',
})

ts.install(langs)

-- Automatically enable Treesitter syntax highlighting for opened files
vim.api.nvim_create_autocmd('FileType', {
    group = vim.api.nvim_create_augroup('TreesitterSetup', { clear = true }),
    callback = function()
        -- Safely start treesitter highlighting
        pcall(vim.treesitter.start)

        -- Optional: If you want Treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

