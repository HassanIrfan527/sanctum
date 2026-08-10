
vim.pack.add { 'https://github.com/goolord/alpha-nvim' }

local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
[[███████╗ █████╗ ███╗   ██╗ ██████╗████████╗██╗   ██╗███╗   ███╗]],
[[██╔════╝██╔══██╗████╗  ██║██╔════╝╚══██╔══╝██║   ██║████╗ ████║]],
[[███████╗███████║██╔██╗ ██║██║        ██║   ██║   ██║██╔████╔██║]],
[[╚════██║██╔══██║██║╚██╗██║██║        ██║   ██║   ██║██║╚██╔╝██║]],
[[███████║██║  ██║██║ ╚████║╚██████╗   ██║   ╚██████╔╝██║ ╚═╝ ██║]],
[[╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝     ╚═╝]],
}
local quote = {
  type = "text",
  val = "It works on my machine.",
  opts = {
    position = "center",
    hl = "Comment",
  },
}

dashboard.config.layout = {
  { type = "padding", val = 2 },
  dashboard.section.header,
  { type = "padding", val = 1 },
  quote,
  { type = "padding", val = 2 },
  dashboard.section.buttons,
  dashboard.section.footer,
}
require("alpha").setup(dashboard.opts)
