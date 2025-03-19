return {
	"alexghergh/nvim-tmux-navigation",
	config = function()
		local nvim_tmux_nav = require("nvim-tmux-navigation")

		nvim_tmux_nav.setup({
			disable_when_zoomed = true, -- defaults to false
		})

		vim.keymap.set("n", "<S-Left>", nvim_tmux_nav.NvimTmuxNavigateLeft)
		vim.keymap.set("n", "<S-Down>", nvim_tmux_nav.NvimTmuxNavigateDown)
		vim.keymap.set("n", "<S-Up>", nvim_tmux_nav.NvimTmuxNavigateUp)
		vim.keymap.set("n", "<S-Right>", nvim_tmux_nav.NvimTmuxNavigateRight)
		vim.keymap.set("n", "<S-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
		vim.keymap.set("n", "<S-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
	end,
}
