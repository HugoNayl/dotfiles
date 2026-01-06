-- Buffer navigation
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'Find buffer' })
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Buffer management
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bo', ':%bd|e#|bd#<CR>', { desc = 'Delete other buffers' })

-- Escape
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- Indent
vim.keymap.set('v', '<Tab>', '>gv', { desc = 'Indent right' })
vim.keymap.set('v', '<S-Tab>', '<gv', { desc = 'Indent left' })

-- Panes move
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

-- Telescope
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { desc = 'Live grep' })

-- Neotree
vim.keymap.set('n', '<leader>e', function()
  -- Try to find an existing neo-tree window
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == 'neo-tree' then
      if win == vim.api.nvim_get_current_win() then
        -- Focused → close
        vim.cmd('Neotree close')
      else
        -- Open but not focused → focus
        vim.api.nvim_set_current_win(win)
      end
      return
    end
  end

  -- Closed → open, then focus (async-safe)
  vim.cmd('Neotree toggle')
end, { desc = 'Neo-tree smart toggle' })
