local finders = require("telescope.finders")
local entry_display = require("telescope.pickers.entry_display")
local harpoon = require("harpoon")
local harpoon_mark = require("harpoon.mark")
-- local harpoon_ui = require("harpoon.ui")
-- locl actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

-- Harpoon
local function filter_empty_string(list)
	local next = {}
	for idx = 1, #list do
		if list[idx].filename ~= "" then
			table.insert(next, list[idx])
		end
	end
	return next
end

local generate_new_finder = function()
	return finders.new_table({
		results = filter_empty_string(harpoon.get_mark_config().marks),
		entry_maker = function(entry)
			local line = entry.filename .. ":" .. entry.row .. ":" .. entry.col
			local displayer = entry_display.create({
				separator = " - ",
				items = {
					{ width = 2 },
					{ width = 50 },
					{ remaining = true },
				},
			})
			local make_display = function(entry)
				return displayer({
					tostring(entry.index),
					line,
				})
			end
			local line = entry.filename .. ":" .. entry.row .. ":" .. entry.col
			return {
				value = entry,
				ordinal = line,
				display = make_display,
				lnum = entry.row,
				col = entry.col,
				filename = entry.filename,
			}
		end,
	})
end

local delete_harpoon_mark = function(prompt_bufnr)
	local selection = action_state.get_selected_entry()
	harpoon_mark.rm_file(selection.filename)
	local current_picker = action_state.get_current_picker(prompt_bufnr)
	current_picker:refresh(generate_new_finder(), { reset_prompt = true })
end

local telescope_harpoon = function(opts)
	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "harpoon marks",
			finder = generate_new_finder(),
			sorter = conf.generic_sorter(opts),
			previewer = conf.grep_previewer(opts),
			attach_mappings = function(_, map)
				map("i", "<c-d>", delete_harpoon_mark)
				map("n", "<c-d>", delete_harpoon_mark)
				return true
			end,
		})
		:find()
end

local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }
keymap("n", "<leader>ma", harpoon_mark.add_file, opts)
keymap("n", "<leader>mm", telescope_harpoon, opts)
