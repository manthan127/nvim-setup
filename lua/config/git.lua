local vim = vim

local gitFunc = require("config.git_funcs")
local function multipleArgs(nargs, desc)
    return {
        nargs = nargs,
        desc = desc
    }
end

vim.api.nvim_create_user_command(
    'GitInit', gitFunc.init,
    multipleArgs('?', 'git init && git add .')
)

vim.api.nvim_create_user_command(
    'GitIgnore', gitFunc.gitignore,
    multipleArgs('*', 'add file name in .gitignore and remove those files from git traking at same time')
)

vim.keymap.set("n", "<leader>gc", gitFunc.commit)
