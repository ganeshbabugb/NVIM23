local setup, browse = pcall(require, "browse")
if not setup then
	return
end

browse.setup({
	provider = "google",
})

local bookmarks = {
	"http://localhost:3000/",
	"https://github.com/ganeshbabugb",
	"https://chat.openai.com/",
	"https://www.google.com/",
	"https://www.ganesh-babu.online/",
}

local function command(name, rhs, opts)
	opts = opts or {}
	vim.api.nvim_create_user_command(name, rhs, opts)
end

command("BrowseBookmarks", function()
	browse.open_bookmarks({ bookmarks = bookmarks })
end, {})
