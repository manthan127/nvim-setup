return {
	cmd = { "elixir-ls" },
	filetypes = { "elixir", "eelixir", "heex", "surface" },
	root_markers = { "mix.exs", ".git" },
	settings = {
		elixirLS = {
			dialyzerEnabled = true, -- Set to false if dialyzer slows down large projects
			fetchDeps = false, -- Prevents the LSP from running 'mix deps.get' automatically
		},
	},
}
