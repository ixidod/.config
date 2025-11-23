local ok, builtin = pcall(require, 'telescope.builtin')
if not ok then
	-- Skip binding keys when Telescope is not installed yet.
	return
end

vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
