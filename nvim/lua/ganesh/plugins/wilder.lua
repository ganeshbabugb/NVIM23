local setup, wilder = pcall(require, "wilder")
if not setup then
	return
end

wilder.setup({
	next_key = "<C-j>",
	accept_key = "<C-l>",
	reject_key = "<C-h>",
	previous_key = "<C-k>",
	modes = { ":", "/", "?" },
})

wilder.set_option(
	"renderer",
	wilder.popupmenu_renderer(wilder.popupmenu_palette_theme({
		left = { "  ", wilder.popupmenu_devicons() },
		right = { "  ", wilder.popupmenu_scrollbar() },
		border = "rounded", -- 'single', 'double', 'rounded' or 'solid'
		max_height = "50%", -- max height of the palette
		min_height = "50%", -- set to the same as 'max_height' for a fixed height window
		prompt_position = "top", -- 'top' or 'bottom'
		reverse = 0, -- set to 1 to reverse the order of the list, use in combination with 'prompt_position'
	}))
)

-- :h wilder#popupmenu_palette_theme() for more details
