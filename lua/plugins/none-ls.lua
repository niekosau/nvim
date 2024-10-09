return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local venv_path =
				"import sys; import pylint_venv; pylint_venv.inithook(force_venv_activation=True, quiet=True)"
			local null_ls = require("null-ls")
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.dotenv_linter,
					null_ls.builtins.diagnostics.markdownlint,
					null_ls.builtins.diagnostics.pylint.with({ extra_args = { "--init-hook", venv_path } }),
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
					null_ls.builtins.diagnostics.mypy,
					null_ls.builtins.diagnostics.rpmspec,
					null_ls.builtins.diagnostics.sqlfluff.with({
						extra_args = { "--dialect", "postgres" }, -- change to your dialect
					}),
					null_ls.builtins.diagnostics.terraform_validate,
					null_ls.builtins.formatting.hclfmt,
					null_ls.builtins.formatting.nginx_beautifier,
					null_ls.builtins.formatting.npm_groovy_lint,
					-- null_ls.builtins.formatting.prettier.with({
					--   filetypes = { "yaml", "yaml.ansible", "markdown" },
					-- }),
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.terraform_fmt,
					null_ls.builtins.formatting.yamlfix,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
								-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
								vim.lsp.buf.format({ async = false })
							end,
						})
					end
				end,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		-- config = function()
		-- 	local mason_null_ls = require("mason-null-ls")
		-- 	mason_null_ls.setup({
		-- 		handlers = {
		-- 			pylint = function() end,
		-- 		},
		-- 	})
		-- end,
	},
}
