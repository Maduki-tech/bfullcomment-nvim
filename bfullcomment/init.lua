local api = vim.api

local function createComment(langu, line)
	if langu == "javascript" or langu == "typescript" or langu == "typescriptreact" or langu == "javascriptreact" then
		local commentStart = "/*"
		local commentLength = 76
		local spacerComment = "*"
		local commentEnd = "*/"
		local spacer = ""
		local placerholder = " "
		local center = ""


		-- GET THE HALF LENGTH WITH COMMENT
		local cLength = string.len(line)
		if (cLength % 2 == 0) then

			cLength = string.len(line)
		else
			line = line .. " "
		end

		local spaceLength = ((commentLength - cLength) / 2)

		for i = 1, commentLength, 1 do
			spacer = spacer .. spacerComment
		end

		for i = 1, spaceLength, 1 do
			center = center .. placerholder
		end



		local commandLineStart = commentStart .. spacer
		local buildString = spacerComment .. center .. line .. center .. spacerComment
		local commandLineEnd = spacer .. commentEnd




		api.nvim_put({commandLineEnd}, 'l', false, false)
		api.nvim_put({buildString}, 'l', false, false)
		api.nvim_put({commandLineStart}, 'l', false, false)
	end
end


local function getText()

	local currentline = api.nvim_get_current_line()
	local filetype = vim.bo.filetype

	api.nvim_del_current_line()

	createComment(filetype, currentline)
end


return{
	getText = getText
}
