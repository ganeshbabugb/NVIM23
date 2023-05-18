local setup, nvimtree = pcall(require, "nvim-tree")
if not setup then
	return
end

-- recommended settings from nvim-tree documentation
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- change color for arrows in tree to light blue
-- vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	api.config.mappings.default_on_attach(bufnr)

	-- This is for removing default keymaps
	-- Mappings removed via:

	-- vim.keymap.set("n", "O", "", { buffer = bufnr })
	-- vim.keymap.del("n", "O", { buffer = bufnr })
	-- vim.keymap.set("n", "<2-RightMouse>", "", { buffer = bufnr })
	-- vim.keymap.del("n", "<2-RightMouse>", { buffer = bufnr })
	-- vim.keymap.set("n", "D", "", { buffer = bufnr })
	-- vim.keymap.del("n", "D", { buffer = bufnr })
	-- vim.keymap.set("n", "E", "", { buffer = bufnr })
	-- vim.keymap.del("n", "E", { buffer = bufnr })

	-- Mappings migrated from view.mappings.list

	-- vim.keymap.set("n", "E", api.tree.expand_all, opts("Expand All"))
	vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
	vim.keymap.set("n", "o", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "u", api.tree.change_root_to_parent, opts("Up"))
	vim.keymap.set("n", "P", function()
		local node = api.tree.get_node_under_cursor()
		print(node.absolute_path)
	end, opts("Print Node Path"))

	vim.keymap.set("n", "Z", api.node.run.system, opts("Run System"))
end

nvimtree.setup({
	sort_by = "case_sensitive",
	on_attach = on_attach,
	view = {
		--number = true,
		--relativenumber = true,
		-- side = "right",
		-- -- signcolumn = "no",
		adaptive_size = false,

		-- This view.mappings.list was depreciated

		-- mappings = {
		-- 	list = {
		-- 		{ key = "u", action = "dir_up" }, -- u (parent dir)
		-- 		{ key = "o", action = "cd" }, -- Change dir
		-- 		-- { key = "h", action = "toggle_dotfiles" }, -- show hidden files
		-- 	},
		-- },
	},
	renderer = {
		root_folder_label = true,
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
