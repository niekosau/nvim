return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local ts_config = require("nvim-treesitter.configs")
    ts_config.setup({
      auto_install = true,
      ensure_installed = {
        "bash",
        "lua",
        "awk",
        "diff",
        "http",
        "json",
        "markdown",
        "php",
        "sql",
        "terraform",
        "vim",
        "yaml",
        "ini",
        "python",
        "ssh_config",
        "nginx",
      },
      highlight = { enable = true, disable = { "ini", "yaml", "yaml.ansible" } },
      indent = { enable = true, disable = { "ini", "yaml", "yaml.ansible" } },
    })
  end,
}
