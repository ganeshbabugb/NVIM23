local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

nvimtree.setup({
	sort_by = "case_sensitive",
	view = {
		--number = true,
		--relativenumber = true,
		-- side = "right",
		-- signcolumn = "no",
		hide_root_folder = true,
		adaptive_size = false,
		mappings = {
			list = {
				{ key = "u", action = "dir_up" }, -- u (parent dir)
				{ key = "o", action = "cd" }, -- Change dir
				-- { key = "h", action = "toggle_dotfiles" }, -- show hidden files
			},
		},
	},
	renderer = {
		group_empty = true,
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "", -- 
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "", --  ▸
					arrow_closed = "", --  ▾
				},
			},
		},
	},
	filters = {
		dotfiles = true,
		custom = { "^.git$", "^node_modules$" },
	},
	diagnostics = {
		enable = true,
		show_on_dirs = false,
		debounce_delay = 50,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})
