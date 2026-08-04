-- ============================================================
-- SECTION - KEYMAPS
-- basic keymaps
-- ============================================================
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic Config & Keymaps
--  See `:help vim.diagnostic.Opts`
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },

  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = {
    on_jump = function(_, bufnr)
      vim.diagnostic.open_float {
        bufnr = bufnr,
        scope = 'cursor',
        focus = false,
      }
    end,
  },
}

vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Scroll down and up using Alt + j and Alt + k
vim.keymap.set({ 'n', 'v' }, '<M-j>', '<C-d>zz', { desc = 'Scroll down and center' })
vim.keymap.set({ 'n', 'v' }, '<M-k>', '<C-u>zz', { desc = 'Scroll up and center' })

-- Keybinds to make split navigation easier.
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>h', '<C-w>H', { desc = 'Move window to the left' })
vim.keymap.set('n', '<leader>l', '<C-w>L', { desc = 'Move window to the right' })
vim.keymap.set('n', '<leader>j', '<C-w>J', { desc = 'Move window to the lower' })
vim.keymap.set('n', '<leader>k', '<C-w>K', { desc = 'Move window to the upper' })

-- Split creation:  % = vertical divider,  " = horizontal divider
vim.keymap.set('n', '<leader>%', '<cmd>vsplit<CR>', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>"', '<cmd>split<CR>', { desc = 'Split horizontal' })

-- Window close / cleanup
vim.keymap.set('n', '<leader>c', '<cmd>close<CR>', { desc = 'Close window (split)' })
vim.keymap.set('n', '<leader>C', '<C-w>o', { desc = 'Close other windows' })
vim.keymap.set('n', '<leader>=', '<C-w>=', { desc = 'Equalize windows' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Keymaps for obsidian.nvim plugin
-- vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>", { desc = "[O]bsidian [S]earch vault" })
-- vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>", { desc = "[O]bsidian [F]ind note" })
-- vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "[O]bsidian [B]acklinks" })
-- vim.keymap.set("n", "<leader>od", "<cmd>ObsidianToday<cr>", { desc = "[O]bsidian [D]aily note" })
-- vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>", { desc = "[O]bsidian [N]ew note" })
-- vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>", { desc = "[O]bsidian [T]ags search" })
