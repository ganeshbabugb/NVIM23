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

-- Custom functions

local action_state = require("telescope.actions.state")

--- Insert filename into the current buffer and keeping the insert mode.
actions.insert_name_i = function(prompt_bufnr)
	local symbol = action_state.get_selected_entry().ordinal
	actions.close(prompt_bufnr)
	vim.schedule(function()
		vim.cmd([[startinsert]])
		vim.api.nvim_put({ symbol }, "", true, true)
	end)
end

--- Insert file path and name into the current buffer and keeping the insert mode.
actions.insert_name_and_path_i = function(prompt_bufnr)
	local symbol = action_state.get_selected_entry().value
	actions.close(prompt_bufnr)
	vim.schedule(function()
		vim.cmd([[startinsert]])
		vim.api.nvim_put({ symbol }, "", true, true)
	end)
end

-- configure telescope
telescope.setup({
	file_ignore_patterns = { "./node_modules/*", "node_modules", "^node_modules/*", "node_modules/*" },
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
				["<C-Y>"] = actions.insert_name_i,
				["<C-P>"] = actions.insert_name_and_path_i,
			},
			n = {
				["q"] = actions.close,
			},
		},
	},
	extensions = {
		file_browser = {
			-- theme = "ivy",
			hidden = true,
			mappings = {
				["i"] = {
					-- ["<S-M>"] = fb_actions.move,
					["<C-Y>"] = actions.insert_name_i,
					["<C-P>"] = actions.insert_name_and_path_i,
				},
			},
		},
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
telescope.load_extension("file_browser")

-- alias
local keymap = vim.keymap.set

-- General
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory
keymap("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>")
keymap("n", "<leader>fl", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap("n", "<leader>fs", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap("n", "<leader>fc", "<cmd>Telescope neoclip<cr>") -- list all copied words
keymap("n", "<leader>sb", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>") -- list recently used files
keymap("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>") -- list all digdiagnostics
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

--file browser
-- vim.api.nvim_set_keymap("n", "<space>B", ":Telescope file_browser<cr>", { noremap = true })

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
	"n",
	"<space>fb",
	":Telescope file_browser path=%:p:h select_buffer=true<cr>",
	{ noremap = true }
)

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
		file_ignore_patterns = { "node_modules/*" },
	}))
end)

-- keymap("n", "<leader>fs", function()
-- require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
-- end)
