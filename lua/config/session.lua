-- ============================================================
-- SECTION - SESSIONS
-- Auto-save/restore an editing session per directory (no plugins)
-- ============================================================

local session_dir = vim.fn.stdpath 'state' .. '/sessions/'
vim.fn.mkdir(session_dir, 'p')

-- What to persist. (Deliberately no 'options' — that can restore stale settings.)
vim.o.sessionoptions = 'buffers,curdir,folds,tabpages,winsize,help'

-- Turn the current working dir into a safe, unique session filename.
local function session_file()
  local encoded = vim.fn.getcwd():gsub('[/\\:]', '%%')
  return session_dir .. encoded .. '.vim'
end

-- Only manage a session when you launch nvim *at* a project:
--   `nvim`   (no args)  or  `nvim .` / `nvim somedir`  (a directory arg)
-- Launching `nvim file.php` directly is left alone, so it won't clobber
-- the project's saved layout.
local function should_manage()
  if vim.g.started_with_stdin then return false end
  local argc = vim.fn.argc()
  if argc == 0 then return true end
  if argc == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1 then return true end
  return false
end

-- Note if input came from stdin (e.g. `cat x | nvim`) so we don't restore over it.
vim.api.nvim_create_autocmd('StdinReadPre', {
  callback = function() vim.g.started_with_stdin = true end,
})

-- Restore on launch.
vim.api.nvim_create_autocmd('VimEnter', {
  nested = true, -- let filetype/treesitter/LSP fire for restored buffers
  callback = function()
    if not should_manage() then return end
    vim.g.session_active = true
    local file = session_file()
    if vim.fn.filereadable(file) == 1 then vim.cmd('silent! source ' .. vim.fn.fnameescape(file)) end
  end,
})

-- Save on exit (only if we were managing this session).
vim.api.nvim_create_autocmd('VimLeavePre', {
  callback = function()
    if not vim.g.session_active then return end
    vim.cmd('mksession! ' .. vim.fn.fnameescape(session_file()))
  end,
})
