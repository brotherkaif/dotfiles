-- Create scratch buffer and focus on it
-- Config.new_scratch_buffer = function()
--   local buf_id = vim.api.nvim_create_buf(true, true)
--   vim.api.nvim_win_set_buf(0, buf_id)
--   return buf_id
-- end

-- Tabpage with lazygit
Config.open_lazygit = function()
  vim.cmd('tabedit')
  vim.cmd('setlocal nonumber signcolumn=no')

  -- Unset vim environment variables to be able to call `vim` without errors
  -- Use custom `--git-dir` and `--work-tree` to be able to open inside
  -- symlinked submodules
  vim.fn.termopen('VIMRUNTIME= VIM= lazygit --git-dir=$(git rev-parse --git-dir) --work-tree=$(realpath .)', {
    on_exit = function()
      vim.cmd('silent! :checktime')
      vim.cmd('silent! :bw')
    end,
  })
  vim.cmd('startinsert')
  vim.b.minipairs_disable = true
end

-- Toggle quickfix window
-- Config.toggle_quickfix = function()
--   local quickfix_wins = vim.tbl_filter(
--     function(win_id) return vim.fn.getwininfo(win_id)[1].quickfix == 1 end,
--     vim.api.nvim_tabpage_list_wins(0)
--   )
--
--   local command = #quickfix_wins == 0 and 'copen' or 'cclose'
--   vim.cmd(command)
-- end
