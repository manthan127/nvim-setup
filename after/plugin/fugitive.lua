local vim = vim
vim.keymap.set('n', '<leader>gs', vim.cmd.Git)

local function multipleArgs(nargs, desc)
    return {
        nargs = nargs,
        desc = desc
    }
end

vim.api.nvim_create_user_command(
    'GitInit', function(remoteURL)
        local success, _ = pcall(vim.cmd, 'Git init | Git add .')
        if not success then return end

        if remoteURL then
            --TODO: validate url
            vim.fn.system('git remote add origin' .. remoteURL)
        end
    end,
    multipleArgs('?', 'git init && git add .')
)

vim.api.nvim_create_user_command(
    'GitIgnore', function(opts)
        -- need to decide where .gitignore will be created
        local file, err = io.open(".gitignore", "a")
        if file then
            if opts.args ~= "" then
                vim.cmd('Git rm --cached ' .. opts.args)
                local content = table.concat(opts.fargs, "\n")

                file:write(content)
            end
            file:close()
        else
            print("Error opening file: " .. err)
        end
    end,
    multipleArgs('*', 'add file name in .gitignore and remove those files from git traking at same time')
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
