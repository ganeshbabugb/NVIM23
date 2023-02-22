--------------------------------------------------------------------------------
-- Neovim API aliases for chatGPT
--------------------------------------------------------------------------------
vim.fn.setenv("OPENAI_API_KEY", "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") -- chatGPT environment key

--------------------------------------------------------------------------------
-- General Neovim settings and configuration
--------------------------------------------------------------------------------
local opt = vim.opt -- Set options (global/buffer/windows-scoped)

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noselect" -- Autocomplete options
opt.undofile = false -- undo and redo after closing a file
opt.iskeyword:append("-") -- consider string-string as whole word

--------------------------------------------------------------------------------
-- Neovim UI
--------------------------------------------------------------------------------
opt.number = true -- Show line number
opt.relativenumber = false -- Show relative line number
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
opt.colorcolumn = "80" -- Line lenght marker at 80 columns
opt.splitright = true -- Vertical split to the right
opt.splitbelow = true -- Orizontal split to the bottom
opt.ignorecase = true -- Ignore case letters when search
opt.smartcase = true -- Ignore lowercase for the whole pattern
opt.linebreak = true -- Wrap on word boundary
opt.termguicolors = true -- Enable 24-bit RGB colors
opt.hlsearch = false -- Set highlight on search

--------------------------------------------------------------------------------
-- Tabs, indent
--------------------------------------------------------------------------------
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Shift 4 spaces when tab
opt.tabstop = 4 -- 1 tab == 4 spaces
opt.smartindent = true -- Autoindent new lines

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden = true -- Enable background buffers
opt.history = 100 -- Remember N lines in history
opt.lazyredraw = true -- Faster scrolling
opt.synmaxcol = 240 -- Max column for syntax highlight

-- Disable nvim intro in startup
opt.shortmess:append("sI")

opt.fillchars = {
	eob = " ", -- suppress ~ at EndOfBuffer
	diff = "╱", -- alternatives = ⣿ ░ ─
	msgsep = " ", -- alternatives: ‾ ─
	fold = " ",
	foldopen = "▾",
	foldsep = " ",
	foldclose = "▸",
}

-- Cursor blink
opt.guicursor = {
	[[n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50]],
	[[a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor]],
	[[sm:block-blinkwait175-blinkoff150-blinkon175]],
}

opt.cursorline = true
-- opt.cursorcolumn = true

-- number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- Set cursor line color on visual mode
-- highlight Visual cterm=NONE ctermbg=236 ctermfg=NONE guibg=Grey40
-- highlight LineNr cterm=none ctermfg=240 guifg=#2b506e guibg=#000000

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

--------------------------------------------------------------------------------
-- Autocommands
--------------------------------------------------------------------------------
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

--  Highlight on yank
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 200,
		})
	end,
})

-- copy relative path
local function copy_relative_path()
	local path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
	vim.fn.setreg("+", path)
	vim.notify('Copied "' .. path .. '" to the clipboard!')
end

vim.api.nvim_create_user_command("CopyRelativePath", copy_relative_path, {})

-- copy absolute path
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
