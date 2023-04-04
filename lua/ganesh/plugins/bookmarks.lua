vim.g.bookmark_sign = "♥"
vim.g.bookmark_highlight_lines = 1

local keymap = vim.keymap.set

keymap("n", "ma", "<cmd>lua require('telescope').extensions.vim_bookmarks.all()<cr>")
keymap("n", "mn", "<cmd>lua require('telescope').extensions.vim_bookmarks.current_file()<cr>")
