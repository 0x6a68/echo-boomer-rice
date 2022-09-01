local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {

		file_sorter = require("telescope.sorters").get_fzf_sorter,
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		file_ignore_patterns = { ".git/", "node_modules" },

		mappings = {
			i = {
				["<Down>"] = actions.cycle_history_next,
				["<Up>"] = actions.cycle_history_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-h>"] = require("telescope").extensions.send_to_harpoon.actions.send_selected_to_harpoon,
			},
			n = {
				["<C-h>"] = require("telescope").extensions.send_to_harpoon.actions.send_selected_to_harpoon,
			},
		},
	},
	extensions = {
		cder = {
			-- dir_command = { "fd", "--hidden", "--max-depth=3", "--type=d", ".", os.getenv("XDG_CODE_HOME") },
		},
	},
})

telescope.load_extension("fzy_native")
telescope.load_extension("send_to_harpoon")
telescope.load_extension("cder")
