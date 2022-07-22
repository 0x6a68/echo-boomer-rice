local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	always_visible = true,
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = "±", modified = "~", removed = "-" },
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
}
local fileformat = {
	"fileformat",
	icons_enabled = false,
}
local mode = {
	"mode",
	fmt = function(data)
		return data:sub(1, 1)
	end,
}

local filename = {
	"filename",
	path = 1,
}

local location = {
	"location",
}

lualine.setup({
	options = {
		globalstatus = true,
		icons_enabled = false,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "alpha", "dashboard" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { diagnostics },
		lualine_c = { diff, filename },
		lualine_x = {},
		lualine_y = { "encoding", fileformat },
		lualine_z = { location },
		-- lualine_x = { spaces, "encoding", filetype },
	},
})
