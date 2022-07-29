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

vim.cmd([[
  command RunTest lua require("neotest").run.run()
  command RunTestFile lua require("neotest").run.run(vim.fn.expand("%"))
  command RunLastTest lua require("neotest").run.run_last()
  command DebugTest lua require("neotest").run.run({strategy = "dap"})
  command StopTest lua require("neotest").run.stop()
  command ToggleTestSummary lua require("neotest").summary.toggle()
  command JumpBackFailedTest lua require("neotest").jump.prev({ status = "failed" })
  command JumpNextFailedTest lua require("neotest").jump.next({ status = "failed" })
  command OpenTest lua require("neotest").output.open({ enter = true })
  ]])
