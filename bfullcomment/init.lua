local api = vim.api


local function pasteWord(line)
	api.nvim_put(line)
end


local function getText()

	-- Get the current line
	print(vim.api.nvim_get_current_line())

	local currentline = api.nvim_get_current_line()

	api.nvim_del_current_line()

	pasteWord(currentline)
end

return{
	getText = getText
}
