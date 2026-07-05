-- Statusline
vim.pack.add { 'https://github.com/nvim-lualine/lualine.nvim' }

require('lualine').setup {
  options = {
    theme = 'tokyonight', -- matches my colorscheme
    icons_enabled = vim.g.have_nerd_font,
    component_separators = '', -- flat, no chevrons — minimal look
    section_separators = '',
    globalstatus = true, -- one statusline for all splits, not per-window
  },
}
