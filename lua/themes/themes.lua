vim.pack.add { { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' } }

require('catppuccin').setup {
  transparent_background = true,
  no_underline = true,
}

vim.pack.add { 'https://github.com/folke/tokyonight.nvim' }

---@diagnostic disable-next-line: missing-fields
require('tokyonight').setup {
  transparent = true,
  styles = {
    comments = { italic = false }, -- Disable italics in comments
  },
}
