local setup, zenMode = pcall(require, "zen-mode")
if not setup then
	return
end

zenMode.setup()

vim.keymap.set("n", "<C-w>o", "<cmd>ZenMode<cr>", { silent = true })
