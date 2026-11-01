return {
	cmd = {
		"clangd",
		"--background-index", -- Tokenize files in the background
		"--clang-tidy", -- Enable clang-tidy diagnostics
		"--header-insertion=never", -- Prevent automatic adding of #include lines on auto-complete
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		"configure.ac",
		".git",
	},
}
