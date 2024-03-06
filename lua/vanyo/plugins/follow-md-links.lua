return {
	"tvanyo/follow-md-links.nvim",
	--	Having VeryLazy set meant the full plugin wasn't being loaded when I opened a markdown
	--	file from the command line. Why?
	--	event = "VeryLazy",
	-- Setting the filetype keeps the plugin from loading until a markdown file is in the buffer.
	-- True even if starting from command line.
	ft = "markdown",
}
