local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- load vs-code like snippets from plugins (e.g. friendly-snippets
require("luasnip/loaders/from_vscode").lazy_load()
-- load snippets from /root/.config/nvim/
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "/root/.config/GanzNvim/.snippets" } })

-- Expand snip
vim.keymap.set({ "i", "s" }, "<a-e>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand()
	end
end)

-- NXT PLACEHOLDER
vim.keymap.set({ "i", "s" }, "<a-n>", function()
	if luasnip.jumpable(1) then
		luasnip.jump(1)
	end
end)

-- PREV PLACEHOLDER
vim.keymap.set({ "i", "s" }, "<a-p>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end)

-- CYCLE A CHOICE
vim.keymap.set({ "i", "s" }, "<a-l>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)
vim.keymap.set({ "i", "s" }, "<a-h>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(-1)
	end
end)
