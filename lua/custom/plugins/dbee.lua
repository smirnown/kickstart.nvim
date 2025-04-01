return {
  'kndndrj/nvim-dbee',
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  build = function()
    -- Install tries to automatically detect the install method.
    -- if it fails, try calling it with one of these parameters:
    --    "curl", "wget", "bitsadmin", "go"
    require('dbee').install()
  end,
  config = function()
    local dbee = require 'dbee'
    dbee.setup {
      sources = {
        require('dbee.sources').MemorySource:new {
          {
            name = 'local',
            type = 'postgres',
            url = 'postgres://bss@localhost:5432/bss?sslmode=disable',
          },
        },
      },
    }
    vim.keymap.set('n', '<leader>do', function()
      dbee.open()
    end, { desc = 'Open database client' })
    vim.keymap.set('n', '<leader>dc', function()
      dbee.close()
    end, { desc = 'Close database client' })
  end,
}
