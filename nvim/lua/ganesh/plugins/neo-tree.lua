require("neo-tree").setup({
	close_if_last_window = true,
	enable_diagnostics = true,
	enable_git_status = true,
	source_selector = {
		winbar = true,
		content_layout = "center",
		tab_labels = {
			-- filesystem = astronvim.get_icon("FolderClosed") .. " File",
			-- buffers = astronvim.get_icon("DefaultFile") .. " Bufs",
			-- git_status = astronvim.get_icon("Git") .. " Git",
			-- diagnostics = astronvim.get_icon("Diagnostic") .. " Diagnostic",
		},
	},
	default_component_configs = {
		indent = { padding = 0 },
		icon = {
			folder_closed = "",
			folder_open = "",
			folder_empty = "ﰊ",
			default = "*",
		},
		git_status = {
			symbols = {
				added = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
				modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
				deleted = "✖", -- this can only be used in the git_status source
				renamed = "", -- this can only be used in the git_status source
				untracked = "",
				ignored = "",
				unstaged = "",
				staged = "",
				conflict = "",
			},
		},
	},
	window = {
		width = 30,
		mappings = {
			["<space>"] = false, -- disable space until we figure out which-key disabling
			o = "open",
			H = "prev_source",
			L = "next_source",
		},
	},
	filesystem = {
		follow_current_file = true,
		hijack_netrw_behavior = "open_current",
		use_libuv_file_watcher = true,
		window = {
			mappings = {
				h = "toggle_hidden",
			},
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function(_)
				vim.opt_local.signcolumn = "auto"
			end,
		},
	},
})
