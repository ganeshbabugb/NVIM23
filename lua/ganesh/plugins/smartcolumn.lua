local setup, smartcolumn = pcall(require, "smartcolumn")
if not setup then
	return
end

smartcolumn.setup({
	colorcolumn = "80",
	disabled_filetypes = { "help", "text", "markdown", "NvimTree", "mason", "alpha" },
	custom_colorcolumn = {},
	scope = "file",
})
