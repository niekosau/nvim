return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {},
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.pylsp.setup({
        capabilities = capabilities,
      })
      lspconfig.groovyls.setup({
        cmd = { "groovy-language-server" },
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        autostart = true,
        capabilities = capabilities,
        settings = {
          keyOrdering = true,
          format = {
            enabled = false,
          },
          yaml = {
            customTags = {
              "!vault",
            },
          },
        },
      })
      require("lspconfig").ansiblels.setup({
        capabilities = capabilities,
        single_file_support = false,
        filetypes = { "yaml.ansible" },
        settings = {
          ansible = {
            python = {
              interpreterPath = "/opt/homebrew/bin/python3.11",
            },
            ansible = {
              useFullyQualifiedCollectionNames = false,
            },
            builtin = {
              installRequirementsTools = true,
              force = false,
              ansibleVersion = "2.15.5",
            },
            ansibleLint = {
              enabled = false,
            },
            executionEnvironment = {
              enabled = false,
            },
            completion = {
              provideRedirectModules = true,
              provideModuleOptionAliases = true,
            },
            validation = {
              enabled = true,
              lint = {
                enabled = true,
                arguments = "-c ~/.config/ansible-lint",
              },
            },
          },
        },
      })
    end,
  },
  -- {
  -- 	"VonHeikemen/lsp-zero.nvim",
  -- 	branch = "v4.x",
  -- 	lazy = true,
  -- 	config = function()
  -- 		local lsp_zero = require("lsp-zero")
  -- 		local lsp_attach = function(client, bufnr)
  -- 			local opts = { buffer = bufnr }
  -- 		end
  -- 		lsp_zero.extend_lspconfig({
  -- 			sign_text = true,
  -- 			lsp_attach = lsp_attach,
  -- 			capabilities = require("cmp_nvim_lsp").default_capabilities(),
  -- 		})
  -- 	end,
  -- },
}
