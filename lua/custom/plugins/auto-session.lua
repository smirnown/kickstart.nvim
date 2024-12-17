-- return {
--   'rmagatti/auto-session',
--   config = function()
--     require("auto-session").setup {
--       log_level = "error",
--       auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
--       post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
--         require("lualine").refresh() -- refresh lualine so the new session name is displayed in the status bar
--       end,
--       auto_session_enable_last_session = true,
--       auto_session_enabled = true,
--       auto_session_create_enabled = true,
--       auto_save_enabled = true,
--       auto_restore_enabled = true,
--       auto_session_use_git_branch = true,
--     }
--     require('lualine').setup {
--       sections = { lualine_c = { require('auto-session.lib').current_session_name }}
--     }
--   end,
-- }
return {
  'rmagatti/auto-session',
  lazy = false,

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
  },
  -- NOTE: On macos, I had to go into Terminal -> Settings -> Keyboard and select "Use Option as Meta key"
  vim.keymap.set('n', '<M-f>', '<CMD>SessionSearch<CR>', { desc = 'Search sessions' }),
  vim.keymap.set('n', '<M-s>', '<CMD>SessionSave<CR>', { desc = 'Save sessions' }),
}
