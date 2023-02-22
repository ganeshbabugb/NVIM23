local setup, indent = pcall(require, "indent_blankline")
if not setup then
	return
end

-- vim.opt.list = true
-- vim.opt.listchars:append("eol:↴")

indent.setup({
	-- show_end_of_line = true,
	-- space_char_blankline = " ",
	-- show_current_context = true,
	-- show_current_context_start = true,
})
