-- import telescope plugin safely
local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
	return
end

-- import telescope actions safely
local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
	return
end

-- configure telescope
telescope.setup({
	defaults = {
		prompt_prefix = "  ", --" " 
		selection_caret = " ", -- " " 
		-- configure custom mappings
		mappings = {
			i = {
				["<C-k>"] = actions.move_selection_previous, -- move to prev result
				["<C-j>"] = actions.move_selection_next, -- move to next result
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- send selected to quickfixlist
				["<C-c>"] = actions.close,
				["<esc>"] = actions.close,
				["<C-h>"] = telescope.extensions.hop.hop, -- hop.hop_toggle_selection
				-- ["<RightMouse>"] = actions.close,
				-- ["<LeftMouse>"] = actions.select_default,
				-- ["<ScrollWheelDown>"] = actions.move_selection_next,
				-- ["<ScrollWheelUp>"] = actions.move_selection_previous,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		hop = {
			-- the shown `keys` are the defaults, no need to set `keys` if defaults work for you ;)
			keys = {
				"a",
				"s",
				"d",
				"f",
				"g",
				"h",
				"j",
				"k",
				"l",
				";",
				"q",
				"w",
				"e",
				"r",
				"t",
				"y",
				"u",
				"i",
				"o",
				"p",
				"A",
				"S",
				"D",
				"F",
				"G",
				"H",
				"J",
				"K",
				"L",
				":",
				"Q",
				"W",
				"E",
				"R",
				"T",
				"Y",
				"U",
				"I",
				"O",
				"P",
			},
			-- Highlight groups to link to signs and lines; the below configuration refers to demo
			-- sign_hl typically only defines foreground to possibly be combined with line_hl
			sign_hl = { "WarningMsg", "Title" },
			-- optional, typically a table of two highlight groups that are alternated between
			line_hl = { "CursorLine", "Normal" },
			-- options specific to `hop_loop`
			-- true temporarily disables Telescope selection highlighting
			clear_selection_hl = false,
			-- highlight hopped to entry with telescope selection highlight
			-- note: mutually exclusive with `clear_selection_hl`
			trace_entry = true,
			-- jump to entry where hoop loop was started from
			reset_selection = true,
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("hop")

-- alias
local keymap = vim.keymap.set

-- General
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory
keymap("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")
keymap("n", "<leader>fl", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
-- keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap("n", "<leader>fc", "<cmd>Telescope neoclip<cr>") -- list all copied words
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- list recently used files
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>") -- list all digdiagnostics
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- Git Mapings

-- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")
-- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>")
-- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")
-- list current changes per file with diff preview ["gs" for git status]
keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>")

-- find string in current buffer
-- It is not working in new version on vim
keymap("n", "<leader>ft", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end)

keymap("n", "<leader>fs", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end)
