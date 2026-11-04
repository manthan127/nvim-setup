local vim = vim

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
			vim.opt.completeopt = { 'menu', 'menuone', 'noinsert', 'fuzzy', 'popup' }
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			vim.keymap.set('i', '<C-Space>', function()
				vim.lsp.completion.get()
			end)
		end
	end,
})

-- Diagnostics
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
