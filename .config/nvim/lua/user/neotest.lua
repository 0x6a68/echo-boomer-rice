require("neotest").setup({
	status = {
		-- signs = false,
		-- virtual_text = true,
	},
	icons = {
		passed = "✔",
		running = "🗘",
		failed = "",
		skipped = "ﰸ",
		unknown = "?",
	},
	highlights = {
		passed = "FoldColumn",
		failed = "Error",
		running = "Warn",
	},
	output = {
		open_on_run = false,
	},
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
		}),
	},
})
