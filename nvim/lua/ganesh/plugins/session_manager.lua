local setup, session_manager = pcall(require, "session_manager")
if not setup then
	return
end

session_manager.setup()
