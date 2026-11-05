vim.keymap.set("n", "<leader>tf", vim.diagnostic.open_float)
vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,

	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
        wrap = true,
        max_width = 80
	},

    jump = {
      on_jump = function(_, bufnr)
        vim.diagnostic.open_float {
          bufnr = bufnr,
          scope = 'cursor',
          focus = false,
        }
      end,
    },
	-- signs = {
	-- 	text = {
	-- 		[vim.diagnostic.severity.ERROR] = "󰅚 ",
	-- 		[vim.diagnostic.severity.WARN] = "󰀪 ",
	-- 		[vim.diagnostic.severity.INFO] = "󰋽 ",
	-- 		[vim.diagnostic.severity.HINT] = "󰌶 ",
	-- 	},
	-- 	numhl = {
	-- 		[vim.diagnostic.severity.ERROR] = "ErrorMsg",
	-- 		[vim.diagnostic.severity.WARN] = "WarningMsg",
	-- 	},
	-- },
 })
