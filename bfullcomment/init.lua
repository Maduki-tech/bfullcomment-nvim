local api = vim.api

local function createLineComment(langu, line)

	if langu == "javascript" or langu == "typescript" or langu == "typescriptreact" or langu == "javascriptreact" then
		local commentStart = "/*"
		local commentLength = 76
		local spacerComment = "*"
		local commentEnd = "*/"
		local center = ""

		-- Handle Comment length with Word
		line = " " .. line .. " "
		local cLength = string.len(line)
		-- if string is 2 4 6 8
		if (cLength % 2 == 0) then
			cLength = string.len(line)
		end


		local spaceLength = ((commentLength - cLength) / 2)

		for _ = 1, spaceLength, 1 do
			center = center .. spacerComment
		end

		local buildString = commentStart .. center .. line .. center .. commentEnd

		api.nvim_put({buildString}, 'l', false, false)


	end
end


local function simpleComment(langu, line)
	if langu == "javascript" or langu == "typescript" or langu == "typescriptreact" or langu == "javascriptreact" then
		local comment = "// "
		local simple = comment .. line
		api.nvim_put({simple}, 'l', false, false)
	end
end

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

		for _ = 1, commentLength, 1 do
			spacer = spacer .. spacerComment
		end

		for _ = 1, spaceLength, 1 do
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

	return filetype, currentline
end

local function HeaderComment()
	local filetype, currentline = getText()

	createComment(filetype, currentline)
end



local function LineSeperator()
	local filetype, currentline = getText()
	createLineComment(filetype, currentline)
end

local function simpleOne()
	local filetype, currentline = getText()
	simpleComment(filetype, currentline)
end

-- ALL RETURN FUNTIONS TO CALL IN VIM
return{
	HeaderComment = HeaderComment,
	LineSeperator = LineSeperator,
	simpleOne = simpleOne
}
