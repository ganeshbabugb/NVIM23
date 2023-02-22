local setup, chatgpt = pcall(require, "chatgpt")
if not setup then
	return
end

chatgpt.setup()
