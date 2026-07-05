-- Fading messages + cleaner cmdline
vim.pack.add {
  'https://github.com/MunifTanjim/nui.nvim', -- required dependency
  'https://github.com/folke/noice.nvim',
  'https://github.com/rcarriga/nvim-notify', -- Adding nvim-notify to use with noice
}

-- nvim-notify styling. noice's notify view calls require('notify') directly,
-- so configuring it here controls how every notification looks.
-- background_colour is required with a transparent colorscheme, otherwise
-- nvim-notify can't detect a backdrop and renders nearly invisible.
require('notify').setup { ---@diagnostic disable-line: missing-fields

  background_colour = '#000000',
  render = 'wrapped-compact',
  stages = 'slide',
  fps = 60, -- higher fps = the fade animation finishes twice as fast (default 30)
  timeout = 1200, -- how long the toast lingers before fading out (default 5000)
  top_down = true,
}

require('noice').setup {
  cmdline = {
    view = 'cmdline_popup',
  },

  notify = { view = 'notify' },
  messages = {
    view = 'notify', -- messages -> small fading popup (this is what you actually wanted)
    view_error = 'notify',
    view_warn = 'notify',
  },
  lsp = {
    progress = { enabled = false },
  },
  presets = {
    long_message_to_split = true,
    command_palette = true, -- position the cmdline and popupmenu together
    bottom_search = true,
  },
}

-- NOTE: Do NOT set `vim.notify = require('notify')` here.
-- noice takes over vim.notify and forwards to nvim-notify's renderer itself.
-- Overriding it bypasses noice's routing and breaks message handling.
