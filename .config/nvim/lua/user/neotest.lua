local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	status = {
		signs = true,
		virtual_text = true,
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
	auto_close = false,
	output = {
		open_on_run = true,
	},
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
		}),
		require("neotest-elixir"),
	},
})
