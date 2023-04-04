-- Shorten function name
-- local keymap = vim.keymap.set
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Modes --
-- Normal = "n",
-- Insert = "i",
-- Visual = "v",
-- Visual_block = "x",
-- Term = "t",
-- Command = "c",

-- Delete backwords
-- keymap("n", "dw", 'vb"_d', opts)

-- RELOAD NVIM
vim.keymap.set("n", "<F5>", function()
	vim.cmd("so")
end)

-- Clear search highlighting
keymap("n", "<leader>c", ":nohl<CR>", opts)

-- Delete single character without copying into register
keymap("n", "x", '"_x', opts)

-- Change a word using cw
keymap("n", "cw", "ciw", opts)

-- Paste over the text without copying into register
keymap("v", "p", '"_dP', opts)

-- -- After yanking keep the cursor in the last selected position
-- keymap("v", "y", "ygv<Esc>", opts)
--
-- -- After yanking keep the cursor in the last selected position
-- keymap("v", "y", "myy`y", opts)
-- keymap("v", "Y", "myY`y", opts)

-- Move cursor
keymap("n", "j", "gj", opts)
keymap("v", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap("v", "k", "gk", opts)

-- Center cursor when scrolling
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Center cursor when searching
keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)

-- Center cursor when searching
-- keymap("n", "K", "kzz")
-- keymap("n", "J", "jzz")

-- Map jk to esc
keymap("t", "jk", "<C-\\><C-n>", opts)

-- I hate typing these
keymap("v", "H", "^", opts)
keymap("v", "L", "$", opts)
keymap("x", "H", "^", opts)
keymap("x", "L", "$", opts)
keymap("o", "H", "^", opts)
keymap("o", "L", "$", opts)

-- This maping slow down the nvim bcz of i mode
-- keymap("i", "<C-b>", "<ESC>^i", opts)
-- keymap("i", "<C-e>", "<End>", opts)

-- Disable arrow keys
keymap("", "<up>", "<nop>", opts)
keymap("", "<down>", "<nop>", opts)
keymap("", "<left>", "<nop>", opts)
keymap("", "<right>", "<nop>", opts)

-- Fast saving with <leader> and w
vim.keymap.set({ "i", "v", "n", "s" }, "<leader>w", "<cmd>w<cr><esc>")

-- New buffer
keymap("n", "<leader>fn", "<cmd>enew<cr>", opts)

-- Select all
keymap("n", "<leader>z", "gg<S-v>G", opts)

-- Move around splits using Ctrl + {h,j,k,l}
-- I prefer plugin insted of this.
-- keymap("n", "<C-h>", "<C-w>h", opts)
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize split with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move Lines
-- credits https://github.com/asyncedd?tab=repositories
keymap("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
keymap("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
keymap("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts)
keymap("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts)
keymap("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
keymap("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)

-- Move text left and right
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Close all windows and exit from Neovim with <leader> and q
keymap("n", "<leader>Q", ":qa!<CR>", opts) -- Exit all windows
keymap("n", "<leader>q", ":q!<CR>", opts) -- Close current buffer

--Rename a variable using f2 key
keymap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- Split Pane
keymap("n", "<leader>sv", "<C-w>v", opts) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", opts) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>", opts) -- close current split window

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Change split orientation
keymap("n", "<leader>x", "<C-w>t<C-w>K", opts) -- change vertical to horizontal
keymap("n", "<leader>y", "<C-w>t<C-w>H", opts) -- change horizontal to vertical

-- Increment/Decrement numbers
keymap("n", "+", "<C-a>", opts) -- Increment numbers in Insert block mode
keymap("n", "-", "<C-x>", opts) -- Decrement numbers in Insert block mode
keymap("x", "+", "g<C-a>", opts) -- Increment numbers in visual block mode
keymap("x", "-", "g<C-x>", opts) -- Decrement numbers in visual block mode

-- Spell check
keymap("n", "<leader>sc", ":set spell!<cr>", opts)

-- Terminal mappings
-- I prefer TMUX
-- keymap("n", "<leader>gt", ":tabnew+term<CR>", opts) -- open in new term

-- Get Path
keymap("n", "<leader>pr", ":CopyRelativePath<cr>", opts) -- copy relative path
keymap("n", "<leader>pa", ":CopyAbsolutePath<cr>", opts) -- copy absolute path

-- UNDOTREE
keymap("n", "<leader>u", ":UndotreeToggle<cr>", opts)

-- NvimTree
-- keymap("n", "<leader>n", ":NeoTreeShowToggle<cr>", opts) -- open/close
keymap("n", "<leader>n", ":NvimTreeToggle<cr>", opts) -- open/close
keymap("n", "<leader>e", ":NvimTreeFocus<cr>", opts) -- focous

-- Null-ls (indent-fomating)
keymap("n", "<Leader>lf", ":lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", opts) --complete file
keymap("v", "<Leader>lF", ":lua vim.lsp.buf.range_formatting()<CR>", opts) --only for selected range

-- Run-code (Automatically)
-- I use this for C, C++, JAVA, PYTHON
-- keymap("n", "<leader>r", ":RunCode<CR>")
-- keymap("n", "<leader>rf", ":RunFile<CR>")
-- keymap("n", "<leader>rft", ":RunFile tab<CR>")
-- keymap("n", "<leader>rp", ":RunProject<CR>")
-- keymap("n", "<leader>rc", ":RunClose<CR>")
