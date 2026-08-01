-- vim.pack.add {'https://github.com/epwalsh/obsidian.nvim'}

local vault_dir = "/mnt/PERSONAL/Obsidian/Personal" -- Matched from your session error traceback!

vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
  callback = function(args)
    local buf_path = vim.api.nvim_buf_get_name(args.buf)

    if buf_path:find(vault_dir, 1, true) == 1 then
      vim.cmd.packadd "obsidian.nvim"

      require("obsidian").setup {
        workspaces = {
          {
            name = "Personal",
            path = vault_dir,
          },
        },
        -- Rest of your setup...
      }

      return true
    end
  end,
})
