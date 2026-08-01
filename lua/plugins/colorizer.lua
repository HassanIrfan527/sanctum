vim.pack.add{
	'https://github.com/norcalli/nvim-colorizer.lua'
}
require("colorizer").setup({
      filetypes = { "*" }, -- Highlight all files
      user_default_options = {
        RGB = true,          -- #RGB hex codes
        RRGGBB = true,       -- #RRGGBB hex codes
        names = false,       -- "Name" codes like Blue or Red
        RRGGBBAA = true,     -- #RRGGBBAA hex codes
        rgb_fn = true,       -- CSS rgb() and rgba() functions
        hsl_fn = true,       -- CSS hsl() and hsla() functions
        css = true,          -- Enable all CSS features
        tailwind = true,     -- Enable tailwind colors
      },
    })
