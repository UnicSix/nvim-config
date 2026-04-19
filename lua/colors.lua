vim.api.nvim_set_hl(0, "LineNr", { fg = "#FFC7A7" })
--
-- local total_lines = vim.fn.line("$")
-- local colors = {
-- 	[0] = "#F08787",
-- 	[1] = "#FFC7A7",
-- 	[2] = "#FEE2AD",
-- 	[3] = "#F8FAB4",
-- }
-- local color_groups = {
-- 	vim.api.nvim_create_namespace("line_color0"),
-- 	vim.api.nvim_create_namespace("line_color1"),
-- 	vim.api.nvim_create_namespace("line_color2"),
-- 	vim.api.nvim_create_namespace("line_color3"),
-- }
--
-- vim.api.nvim_set_hl(0, "line_color0", {fg = colors[0]})
-- vim.api.nvim_set_hl(0, "line_color1", {fg = colors[1]})
-- vim.api.nvim_set_hl(0, "line_color2", {fg = colors[2]})
-- vim.api.nvim_set_hl(0, "line_color3", {fg = colors[3]})
--
-- local function get_color_index(target, current)
-- 	local abs_line = math.abs(target - current)
-- 	if abs_line == 0 then
-- 		return 0
-- 	end
-- 	local index = math.floor(total_lines / abs_line + 0.5)
--
-- 	return math.min(3, math.max(0, index))
-- end
--
-- local function SetLineColor()
-- 	local current = vim.fn.line(".")
-- 	for line = 1, total_lines do
-- 		local index = get_color_index(line, current)
-- 		vim.api.nvim_buf_set_extmark(0, color_groups[index+1], line - 1, 0, { number_hl_group = "line_color" .. index })
-- 	end
-- end
--
-- vim.api.nvim_create_autocmd("CursorMoved", {
-- 	callback = SetLineColor,
-- })
--
local colors = {
	[0] = "#F08787",
	[1] = "#FFC7A7",
	[2] = "#FEE2AD",
	[3] = "#F8FAB4",
}
local color_groups = {
	vim.api.nvim_create_namespace("line_color0"),
	vim.api.nvim_create_namespace("line_color1"),
	vim.api.nvim_create_namespace("line_color2"),
	vim.api.nvim_create_namespace("line_color3"),
}
vim.api.nvim_set_hl(0, "line_color0", { fg = colors[0] })
vim.api.nvim_set_hl(0, "line_color1", { fg = colors[1] })
vim.api.nvim_set_hl(0, "line_color2", { fg = colors[2] })
vim.api.nvim_set_hl(0, "line_color3", { fg = colors[3] })

local function get_color_index(target, current)
	local abs_line = math.abs(target - current)
	if abs_line == 0 then
		return 0  -- Current line gets first color
	end
	local total_lines = vim.fn.line("$")
	local index = math.floor(total_lines / abs_line + 0.5)
	return math.min(3, math.max(0, index))  -- Clamp to 0-3
end

local function SetLineColor()
	local current = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	for line = 1, total_lines do
		local index = get_color_index(line, current)
		vim.api.nvim_buf_set_extmark(
			0,
			color_groups[index + 1],
			line - 1,
			0,
			{ number_hl_group = "line_color" .. index }
		)
	end
end

-- vim.api.nvim_create_autocmd("CursorMoved", {
-- 	callback = SetLineColor,
-- })
--
--
