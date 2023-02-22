local setup, dap = pcall(require, "dap")
if not setup then
	return
end

dap.adapters.dart = {
	type = "executable",
	command = "dart",
	args = { "debug_adapter" },
}
dap.configurations.dart = {
	{
		type = "dart",
		request = "launch",
		name = "Launch Dart Program",
		program = "${file}",
		cwd = "${workspaceFolder}",
	},
}
