-- [[ CodeCompanion ]]
--  An AI chat sidebar + inline assistant, wired to GitHub Copilot (free tier).
--
--  Dependencies (plenary + treesitter) are already installed elsewhere in
--  init.lua, so this file is required *after* those sections have run.
--
--  AUTH: The Copilot adapter reads your OAuth token from
--    ~/.config/github-copilot/{hosts,apps}.json
--  That file is created when you authenticate Copilot in the editor. We install
--  copilot.lua below PURELY as the authenticator — its inline "ghost text"
--  suggestions and panel are DISABLED, so it never competes with blink.cmp.
--
--  One-time setup after first launch:
--    :Copilot auth      -- opens the GitHub device-login flow in your browser
--  (Requires an active GitHub Copilot subscription — the free tier works.)

-- copilot.lua — used only to obtain/refresh the Copilot token. No ghost text.
vim.pack.add { 'https://github.com/zbirenbaum/copilot.lua' }
require('copilot').setup {
  suggestion = { enabled = false }, -- no inline ghost-text completion
  panel = { enabled = false }, -- no suggestion panel
}

vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/olimorris/codecompanion.nvim',
  'https://github.com/github/copilot.vim',
}

require('codecompanion').setup {
  -- `interactions` is the current config key (chat / inline / cmd).
  -- To pin both the adapter AND a specific model, `adapter` takes the
  -- table form `{ name = ..., model = ... }` rather than a bare string.
  -- Copilot's free default is 'gpt-5.4-mini'. Change the model here, or
  -- switch it live inside a chat buffer with `ga` (adapter/model menu).
  interactions = {
    chat = {
      adapter = {
        name = 'copilot',
        model = 'gpt-4o',
      },
    },
    inline = {
      adapter = {
        name = 'copilot',
        model = 'gpt-4o',
      },
    },
  },

  opts = {
    log_level = 'ERROR', -- keep logs quiet unless troubleshooting
  },
}

-- [[ Keymaps ]] — grouped under <leader>a ([A]I) to match the which-key setup.
local map = vim.keymap.set

-- Toggle the chat sidebar from anywhere.
map({ 'n', 'v' }, '<leader>aa', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion: Toggle [A]I chat' })

-- Open the actions palette (all CodeCompanion commands / prompts).
map({ 'n', 'v' }, '<leader>ac', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion: [C]ommand palette' })

-- Add the current visual selection to the chat buffer as context.
map('v', '<leader>ad', '<cmd>CodeCompanionChat Add<cr>', { desc = 'CodeCompanion: A[d]d selection to chat' })

-- Inline assist: prompt Copilot to edit the selection in place.
map('v', '<leader>ai', ':CodeCompanion ', { desc = 'CodeCompanion: [I]nline edit selection' })

-- Handy `:cc` abbreviation for the inline command in the cmdline.
vim.cmd [[cabbrev cc CodeCompanion]]
