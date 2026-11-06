vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

local function commandOpts(nargs, desc)
    return {
        nargs = nargs,
        desc = desc
    }
end

vim.api.nvim_create_user_command(
    'GitInit', function(opts)
        local success, _ = pcall(vim.cmd, 'Git init | Git add .')
        if not success then return end

        local remoteURL = opts.args
        if remoteURL ~= "" then
            vim.fn.system('git remote add origin' .. remoteURL)
        end
        vim.cmd.Ex()
    end,
    commandOpts('?', 'initialize git and add remote')
)

vim.api.nvim_create_user_command(
    'GitIgnore', function(opts)
        local file, err = io.open(".gitignore", "a")
        if not file then
            print("Error opening file: " .. err)
            return
        end
        if opts.args ~= "" then
            vim.cmd('Git rm --cached ' .. opts.args)
            local content = table.concat(opts.fargs, "\n")

            file:write(content)
        end

        file:close()
        vim.cmd('Git add .gitignore')
        vim.cmd.Ex()
    end,
    commandOpts('*', 'add file name in .gitignore and remove those files from git traking at same time')
)

vim.keymap.set("n", "<leader>gc", function()
    vim.cmd.wa()

    local success, _ = pcall(vim.cmd, "Git add .")
    if not success then return end

    local msg = vim.fn.input("Commit Message: ")
    if msg == "" then
        return
    end

    success, _ = pcall(vim.cmd, "Git commit -m " .. '"' .. msg .. '"')
    if not success then
        return
    end

    -- TODO: push only if remote exists -- user explicitly says it
    vim.cmd("Git push")
end)
