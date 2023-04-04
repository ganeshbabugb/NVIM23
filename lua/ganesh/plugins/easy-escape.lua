local setup, betterescape = pcall(require, "better_escape")
if not setup then
	return
end

betterescape.setup()
