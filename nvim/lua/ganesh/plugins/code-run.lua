local setup, coderun = pcall(require, "code_runner")
if not setup then
	return
end

coderun.setup({
	focus = false,
	filetype = {
		java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
		c = "cd $dir && gcc $fileName -o $fileNameWithoutExt &&  ./$fileNameWithoutExt",
		cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt &&  ./$fileNameWithoutExt",
		dart = "dart $dir/$fileName",
		-- python = "python3 -u",
		-- typescript = "deno run",
		-- rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt",
		excluded_buftypes = { "message" },
	},
})
