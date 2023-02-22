local keymap = vim.keymap.set

-- set space key as leader
vim.g.mapleader = " "
-- keymap("n", " ", "<Nop>", { silent = true, remap = false })

--------
-- Modes
--------
-- Normal = "n",
-- Insert = "i",
-- Visual = "v",
-- Visual_block = "x",
-- Term = "t",
-- Command = "c",

-- delete backwords
-- keymap("n", "dw", 'vb"_d')

-- Clear search highlighting
keymap("n", "<leader>c", ":nohl<CR>")

-- Delete single character without copying into register
keymap("n", "x", '"_x')

-- Paste over the text without copying into register
keymap("v", "p", '"_dP')

-- After yanking keep the cursor in the last selected position
keymap("v", "y", "ygv<Esc>")

-- After yanking keep the cursor in the last selected position
keymap("v", "y", "myy`y")
keymap("v", "Y", "myY`y")

-- Move cursor
keymap("n", "j", "gj")
keymap("v", "j", "gj")
keymap("n", "k", "gk")
keymap("v", "k", "gk")

-- Center cursor when scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Center cursor when searching
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- Center cursor when searching
keymap("n", "K", "kzz")
keymap("n", "J", "jzz")

-- Map Esc to kk
-- keymap("i", "kk", "<Esc>")
keymap("t", "jk", "<C-\\><C-n>")

-- Disable arrow keys
keymap("", "<up>", "<nop>")
keymap("", "<down>", "<nop>")
keymap("", "<left>", "<nop>")
keymap("", "<right>", "<nop>")

-- Fast saving with <leader> and w
keymap("n", "<leader>w", ":w<CR>")

-- Select all
keymap("n", "<leader>z", "gg<S-v>G")

-- Move around splits using Ctrl + {h,j,k,l}
-- keymap("n", "<C-h>", "<C-w>h")
-- keymap("n", "<C-j>", "<C-w>j")
-- keymap("n", "<C-k>", "<C-w>k")
-- keymap("n", "<C-l>", "<C-w>l")

-- Resize split with arrows
keymap("n", "<C-Up>", ":resize -2<CR>")
keymap("n", "<C-Down>", ":resize +2<CR>")
keymap("n", "<C-Left>", ":vertical resize -2<CR>")
keymap("n", "<C-Right>", ":vertical resize +2<CR>")

-- keymap("v", "K", ":m-2<CR>gv=gv")
-- keymap("v", "J", ":m+1<CR>gv=gv")

-- Move text
-- keymap("v", "<C-K>", ":move '<-2<CR>gv-gv")
-- keymap("v", "<C-J>", ":move '>+1<CR>gv-gv")

-- Close all windows and exit from Neovim with <leader> and q
keymap("n", "<leader>q", ":qa!<CR>") -- Exit all windows
keymap("n", "<leader>k", ":q<CR>") -- Close current buffer

-- Split
keymap("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap("n", "<leader>sx", ":close<CR>") -- close current split window

-- Tabs
keymap("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- Change split orientation
keymap("n", "<leader>x", "<C-w>t<C-w>K") -- change vertical to horizontal
keymap("n", "<leader>y", "<C-w>t<C-w>H") -- change horizontal to vertical

-- Increment/Decrement
keymap("n", "+", "<C-a>") -- Increment numbers in Insert block mode
keymap("n", "-", "<C-x>") -- Decrement numbers in Insert block mode
keymap("x", "+", "g<C-a>") -- Increment numbers in visual block mode
keymap("x", "-", "g<C-x>") -- Decrement numbers in visual block mode

-- Terminal mappings
-- keymap("n", "<leader>gt", ":tabnew+term<CR>") -- open in new term

-- Get path
keymap("n", "<leader>pr", ":CopyRelativePath<cr>") -- copy relative path
keymap("n", "<leader>pa", ":CopyAbsolutePath<cr>") -- copy absolute path

-- delete a word using cw
keymap("n", "cw", "ciw")

-- Plugin Keybinds

-----------
-- Tree
-----------
-- keymap("n", "<leader>n", ":NeoTreeShowToggle<CR>") -- open/close
keymap("n", "<leader>n", ":NvimTreeToggle<CR>") -- open/close

----------------------------
-- Null-ls (indent-fomating)
----------------------------
keymap("n", "<Leader>lf", ":lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>") --complete file
keymap("v", "<Leader>lF", ":lua vim.lsp.buf.range_formatting()<CR>") --only for selected range

-------------------------
-- Telescope git commands
-------------------------
keymap("n", "<leader>gc", "<cmd>Telescope git_commits<cr>") -- list all git commits (use <cr> to checkout) ["gc" for git commits]

keymap("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]

keymap("n", "<leader>gb", "<cmd>Telescope git_branches<cr>") -- list git branches (use <cr> to checkout) ["gb" for git branch]

keymap("n", "<leader>gs", "<cmd>Telescope git_status<cr>") -- list current changes per file with diff preview ["gs" for git status]

---------------------------
-- Run-code (Automatically)
---------------------------
keymap("n", "<leader>r", ":RunCode<CR>")
keymap("n", "<leader>rf", ":RunFile<CR>")
keymap("n", "<leader>rft", ":RunFile tab<CR>")
keymap("n", "<leader>rp", ":RunProject<CR>")
keymap("n", "<leader>rc", ":RunClose<CR>")

keymap("n", "<leader>Sl", "<cmd>SessionManager! load_last_session<cr>")
keymap("n", "<leader>Ss", "<cmd>SessionManager! save_current_session<cr>")
keymap("n", "<leader>Sd", "<cmd>SessionManager! delete_session<cr>")
keymap("n", "<leader>Sf", "<cmd>SessionManager! load_session<cr>")
keymap("n", "<leader>S", "<cmd>SessionManager! load_current_dir_session<cr>")
