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
				-- ["<RightMouse>"] = actions.close,
				-- ["<LeftMouse>"] = actions.select_default,
				-- ["<ScrollWheelDown>"] = actions.move_selection_next,
				-- ["<ScrollWheelUp>"] = actions.move_selection_previous,
			},
		},
	},
})

telescope.load_extension("fzf")

-- alias
local keymap = vim.keymap.set

keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap("n", "<leader>fl", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap("n", "<leader>fc", "<cmd>Telescope neoclip<cr>") -- list all copied words
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- list recently used files
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>") -- list all digdiagnostics
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- find string in current buffer
keymap("n", "<leader>ft", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end)
