--------------------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------------------
--  Highlight on yank
local autocmd = vim.api.nvim_create_autocmd

local function augroup(name)
	return vim.api.nvim_create_augroup("nvim_" .. name, { clear = true })
end

autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- Copy relative path
local function copy_relative_path()
	local path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end

vim.api.nvim_create_user_command("CopyRelativePath", copy_relative_path, {})

-- Copy absolute path
local function copy_absolute_path()
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end

vim.api.nvim_create_user_command("CopyAbsolutePath", copy_absolute_path, {})

-- Don't auto commenting new lines
autocmd("BufEnter", {
	pattern = "",
	command = "set fo-=c fo-=r fo-=o",
})

-- Show cursor line only in active window
autocmd({ "InsertLeave", "WinEnter" }, {
	callback = function()
		local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
		if ok and cl then
			vim.wo.cursorline = true
			vim.api.nvim_win_del_var(0, "auto-cursorline")
		end
	end,
})
autocmd({ "InsertEnter", "WinLeave" }, {
	callback = function()
		local cl = vim.wo.cursorline
		if cl then
			vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
			vim.wo.cursorline = false
		end
	end,
})

-- Showing the Inline Diagnostics Automatically in the Hover Window
-- vim.o.updatetime = 250
-- vim.cmd([[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

-- THIS HELP TO YOU GOTO THE END LINE IN THE  JS FILE
-- vim.cmd([[autocmd BufEnter *.js nnoremap <silent> <buffer> <CR> /-- END --<CR>O<Esc>O]])

-- Change relative numbers according to the mode.
-- local o = vim.opt
-- autocmd("InsertEnter", {
-- 	callback = function()
-- 		o.relativenumber = false
-- 		o.number = true
-- 	end,
-- })
-- autocmd("InsertLeave", {
-- 	callback = function()
-- 		o.relativenumber = true
-- 	end,
-- })

-- resize splits if window got resized
autocmd({ "VimResized" }, {
	group = augroup("resize_splits"),
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})

-- navigate to config folder
vim.api.nvim_create_user_command("Config", function()
	vim.cmd([[cd ~/.config/GanzNvim]])
end, {})
