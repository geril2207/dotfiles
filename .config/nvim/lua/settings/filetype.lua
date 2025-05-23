vim.filetype.add({
	pattern = {
		["%.env%.[%w_.-]+"] = "sh",
	},
	extension = {
		mdx = "jsx",
		ftl = "ftl",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		-- vim.opt.formatoptions:remove({ "o", "c" })
		vim.bo.formatoptions = "tqj"
	end,
})
