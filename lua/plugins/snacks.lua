-- [[ snacks.nvim ]]
--  A collection of QoL modules (folke). We intentionally enable ONLY `bigfile`
--  to keep things minimal — every other snacks module stays off by default.
--
--  bigfile: when you open a very large file (default > 1.5MB), it disables
--  expensive features (treesitter, LSP, syntax, folds, etc.) for that buffer
--  so Neovim stays snappy instead of chugging. Zero interaction needed.

vim.pack.add { 'https://github.com/folke/snacks.nvim' }

require('snacks').setup {
  bigfile = { enabled = true },
}
