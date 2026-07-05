-- ================================================
-- Session Persistence for nvim
-- ================================================

-- Persist & restore editing sessions per directory (auto-session)
vim.pack.add { 'https://github.com/rmagatti/auto-session' }

-- What gets stored in a session. 'localoptions' keeps per-buffer settings
-- (like filetype) correct on restore.
vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'

require('auto-session').setup {
  -- Don't auto-save/restore in these dirs (home, downloads, root) —
  -- you only want sessions inside actual projects.
  suppressed_dirs = { '~/', '~/Downloads', '/' },
}
