local vim = vim
local G = {}

-- :GitInit <remote url>
G.init = function(remoteURL)
    local output = vim.fn.system('git init && git add .')

    if vim.v.shell_error ~= 0 then
        vim.notify('Git error: ' .. output, vim.log.levels.ERROR)
    else
        vim.notify('Git initialized and all files staged successfully!', vim.log.levels.INFO)
        if remoteURL then
            --TODO: validate url
            vim.fn.system('git remote add origin' .. remoteURL)
        end
    end
end

G.gitignore = function(opts)
    -- need to decide where .gitignore will be created
    local file, err = io.open(".gitignore", "a")
    if file then
        if opts.args ~= "" then
            vim.fn.system('git rm --cached ' .. opts.args)
            local content = table.concat(opts.fargs, "\n")

            file:write(content)
        end
        file:close()
    else
        print("Error opening file: " .. err)
    end
end


local push = function()
    -- TODO:- push the code if remote exists
    vim.cmd("Git push")
end
-- cheack if need to stage any changes before commit
-- if unstaged changes found then
--      save = ask to save unsaved files[y/n]
--      sta = ask to stage all [y/n]
--      if not sta then
--          continue  [y/n]
--
-- commit(inputMsg)
G.commit = function()
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
    push()
end

return G
