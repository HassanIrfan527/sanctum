-- Faster, on-demand Lua library loading for lua_ls (nvim config editing)
vim.pack.add { 'https://github.com/folke/lazydev.nvim' }

require('lazydev').setup {
  library = {
    -- Load luvit/vim.uv types only when they're actually used
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
}
