local alpha_setup, alpha = pcall(require, "alpha")
if not alpha_setup then
	return
end

local dashboard_setup, dashboard = pcall(require, "alpha.themes.dashboard")
if not dashboard_setup then
	return
end

local fortune_setup, fortune = pcall(require, "alpha.fortune")
if not fortune_setup then
	return
end

-- Footer
local function footer()
	local datetime = os.date(" %a %H:%M")
	local quote = table.concat(fortune(), "\n")
	return " " .. datetime .. "\n" .. quote
end

-- Banner
local banner = {
	"  ██████╗  █████╗ ███╗   ██╗███████╗███████╗██╗  ██╗ ",
	" ██╔════╝ ██╔══██╗████╗  ██║██╔════╝██╔════╝██║  ██║ ",
	" ██║  ███╗███████║██╔██╗ ██║█████╗  ███████╗███████║ ",
	" ██║   ██║██╔══██║██║╚██╗██║██╔══╝  ╚════██║██╔══██║ ",
	" ╚██████╔╝██║  ██║██║ ╚████║███████╗███████║██║  ██║ ",
	"  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═╝ ",
}

dashboard.section.header.val = banner

-- Different banners open at different times.
-- dashboard.section.header.val = require("ganesh.plugins.dashboard.banners")["random"]
-- 

dashboard.section.buttons.val = {
	dashboard.button("N", "  New File", "<cmd>ene <BAR> startinsert <CR>"),
	dashboard.button("B", "  Browse", "<cmd>NvimTreeFocus <CR>"),
	-- dashboard.button("B", "  Browse", "<cmd>NeoTreeShowToggle <CR>"),
	dashboard.button("R", "  Recents", "<cmd>Telescope oldfiles <CR>"),
	dashboard.button("C", "  Config", "<cmd>Neotree /root/.config/nvim <CR>"),
	dashboard.button("U", "  Update", "<cmd>PackerUpdate <CR>"),
	dashboard.button("S", "  Last Session", "<cmd>SessionManager! load_last_session <cr>"),
	dashboard.button("T", "  Terminate", "<cmd>qa <CR>"),
}

dashboard.section.footer.val = footer()

alpha.setup(dashboard.config)
