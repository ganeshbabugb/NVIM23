local fidget_setup, fidget = pcall(require, "fidget")
if not fidget_setup then
	return
end

fidget.setup({})
