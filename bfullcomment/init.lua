local api = vim.api

local function createComment(langu)
	print(langu)
end

local function pasteWord(line)
	api.nvim_put({line}, 'l', false, false)
end


local function getText()

	local currentline = api.nvim_get_current_line()
	local filetype = vim.bo.filetype

	print(filetype)
	api.nvim_del_current_line()

	createComment(filetype)
end


return{
	getText = getText
}
