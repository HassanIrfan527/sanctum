-- Statusline
vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

require('lualine').setup {
  options = {
    theme = 'catppuccin-nvim',
    icons_enabled = vim.g.have_nerd_font,
    component_separators = '',
    section_separators = '',
    globalstatus = true,
  },
}
