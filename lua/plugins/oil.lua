-- Oil replaces the built-in netrw file explorer, so disable netrw early.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require('oil').setup {
  -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
  -- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
  default_file_explorer = true,
  columns = {
    'icons',
  },

  -- Show a rounded border around the floating window
  float = {
    border = "rounded",
  },
  -- Show dotfiles (.env, .gitignore, etc.) by default.
  -- Toggle them on/off from inside oil with `g.`
  view_options = {
    show_hidden = true,
  },
  -- Buffer-local keymaps active *inside* the oil window.
  -- These are MERGED with oil's defaults (press `g?` in oil to see them all),
  -- so we just add <leader>-based alternatives to avoid reaching for <Ctrl>.
  keymaps = {
    ['q'] = { 'actions.close', desc = 'Close oil' },
    ['<Esc>'] = { 'actions.close', desc = 'Close oil' },
    ['<leader>p'] = { 'actions.preview', desc = 'Preview file under cursor' },
    ['<leader>v'] = { 'actions.select', opts = { vertical = true }, desc = 'Open in vertical split' },
    ['<leader>x'] = { 'actions.select', opts = { horizontal = true }, desc = 'Open in horizontal split' },
  },
}

-- Open oil in a floating window from anywhere.
-- `-` (oil's default) still opens oil in the current window, at the parent directory.
vim.keymap.set('n', '<leader>o', require('oil').toggle_float, { desc = 'Open [O]il file explorer' })
