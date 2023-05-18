local session_setup, session = pcall(require, "auto-session")
if not session_setup then
	return
end

local session_lens_setup, session_lens = pcall(require, "session-lens")
if not session_lens_setup then
	return
end

session.setup({
	-- log_level = "error",
	-- auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
	-- IT PREVENT THE AUTO LOAD SESSION WHEN OPENING A NEOVIM
	auto_restore_enabled = false,
})

session_lens.setup({
	prompt_title = "SESSIONS LIST",
})
