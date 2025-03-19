-- Arsync
vim.api.nvim_set_keymap("n", "<leader>su", ":w<CR>:ARsyncUpDelete<CR>", { noremap = true, silent = true })
-- Diffview
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { silent = true })
vim.keymap.set("n", "<leader>gc", "<cmd>DiffviewClose<CR>", { silent = true })
-- Git
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {})
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", {})
-- vim.keymap.set("n", "<leader>gd", ":Gdiffsplit<CR>", {})
vim.keymap.set("n", "<leader>ga", ":Git add %<CR>", {})
vim.keymap.set("n", "<leader>gap", ":Git add --patch %<CR>", {})
vim.keymap.set("n", "<leader>gr", ":Git reset --quiet %<CR>", {})
vim.keymap.set("n", "gc", ":Git commit<CR>", {})
vim.keymap.set("n", "gp", ":Git push<CR>")
vim.keymap.set("n", "<leader>gs", ":Git status --find-renames  --ahead-behind --renames<CR>", {})

-- LSP
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n", "x" }, "<leader>gf", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)

-- git-wroktree
-- vim.g.git_worktree = {
-- 	change_directory_command = "cd",
-- 	update_on_change = true,
-- 	update_on_change_command = "e .",
-- 	clearjumps_on_change = true,
-- 	confirm_telescope_deletions = true,
-- 	autopush = false,
-- }
vim.keymap.set("n", "<leader>gwc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
