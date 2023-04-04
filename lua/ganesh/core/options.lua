--------------------------------------------------------------------------------
-- Neovim API aliases for chatGPT
--------------------------------------------------------------------------------
vim.fn.setenv("OPENAI_API_KEY", "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") -- chatGPT environment key

--------------------------------------------------------------------------------
-- General Neovim settings and configuration
--------------------------------------------------------------------------------
local opt = vim.opt -- Set options (global/buffer/windows-scoped)
local g = vim.g

-- set space key as leader
g.mapleader = " "
opt.timeoutlen = 400

--------------------------------------------------------------------------------
-- General
--------------------------------------------------------------------------------
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Copy/paste to system clipboard
opt.swapfile = false -- Don't use swapfile
opt.completeopt = "menuone,noselect" -- Auto complete options
opt.undofile = false -- undo and redo after closing a file
opt.iskeyword:append("-") -- consider string-string as whole word

--------------------------------------------------------------------------------
-- Neovim UI
--------------------------------------------------------------------------------
opt.number = true -- Show line number
opt.relativenumber = false -- Show relative line number
opt.showmatch = true -- Highlight matching parenthesis
opt.foldmethod = "marker" -- Enable folding (default 'foldmarker')
-- opt.colorcolumn = "80" -- Line lenght marker at 80 columns
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

-- spelling
-- opt.spelllang = "en_us"
-- opt.spell = true
