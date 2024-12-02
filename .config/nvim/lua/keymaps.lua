-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- IMPORTANT: the following keybindings come in two formats.
-- First is with qwerty keyboard, second with noted layout.
-- Only use one

-- First
-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows

-- See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Leave insert mode
vim.keymap.set('i', 'jk', '<ESC>', { desc = 'Leave Insert Mode with jk' })
vim.keymap.set('i', 'jK', '<ESC>', { desc = 'Leave Insert Mode with jK' })

-- Start and End of Line
vim.keymap.set('n', 'H', '0', { desc = 'Jump to start of Line' })
vim.keymap.set('n', 'L', '$', { desc = 'Jump to start of Line' })

-- second
--
-- specific bindings for moving with noted
--
-- -- hjkl movements
-- vim.keymap.set('n', 't', 'j')
-- vim.keymap.set('n', 'n', 'k')
-- vim.keymap.set('n', 'd', 'h')
-- vim.keymap.set('n', 'r', 'l')
--
-- vim.keymap.set('v', 't', 'j')
-- vim.keymap.set('v', 'n', 'k')
-- vim.keymap.set('v', 'd', 'h')
-- vim.keymap.set('v', 'r', 'l')
--
-- vim.keymap.set('n', 'D', '0', { desc = 'Jump to start of Line' })
-- vim.keymap.set('n', 'R', '$', { desc = 'Jump to start of Line' })
--
-- -- remaps from d to k
-- -- Remap 'k' to 'd'
-- vim.keymap.set('n', 'k', 'd') -- Normal mode: k to d
-- vim.keymap.set('n', 'K', 'D') -- Normal mode: K to D
-- vim.keymap.set('v', 'k', 'd') -- Visual mode: k to d
-- vim.keymap.set('v', 'K', 'D') -- Visual mode: K to D
-- vim.keymap.set('n', 'kk', 'dd') -- Normal mode: kk to dd
-- vim.keymap.set('x', 'k', 'd') -- Visual selection mode: k to d
--
-- -- Add more combinations as necessary
-- vim.keymap.set('n', 'k$', 'd$') -- Normal mode: k$ to d$
-- vim.keymap.set('n', 'kt', 'dt') -- Normal mode: kt to dt
-- vim.keymap.set('v', 'k$', 'd$') -- Visual mode: k$ to d$
-- vim.keymap.set('v', 'kt', 'dt') -- Visual mode: kt to dt
--
-- -- Remap 'l' to 'r'
-- vim.keymap.set('n', 'l', 'r') -- Normal mode: l to r
-- vim.keymap.set('n', 'L', 'R') -- Normal mode: L to R
-- vim.keymap.set('v', 'l', 'r') -- Visual mode: l to r
-- vim.keymap.set('v', 'L', 'R') -- Visual mode: L to R
-- vim.keymap.set('n', 'll', 'rr') -- Normal mode: ll to rr
-- vim.keymap.set('x', 'l', 'r') -- Visual selection mode: l to r
--
-- -- Add more combinations as necessary
-- vim.keymap.set('n', 'l$', 'r$') -- Normal mode: l$ to r$
-- vim.keymap.set('n', 'lt', 'rt') -- Normal mode: lt to rt
-- vim.keymap.set('v', 'l$', 'r$') -- Visual mode: l$ to r$
-- vim.keymap.set('v', 'lt', 'rt') -- Visual mode: lt to rt
--
-- -- Window navigation
-- vim.keymap.set('n', '<C-d>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-t>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-n>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-r>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--
-- -- Leave insert mode
-- vim.keymap.set('i', 'tn', '<ESC>', { desc = 'Leave Insert Mode with tn' })
-- vim.keymap.set('i', 'tN', '<ESC>', { desc = 'Leave Insert Mode with tN' })
--
-- -- Start and End of Line
-- vim.keymap.set('n', 'H', '0', { desc = 'Jump to start of Line' })
-- vim.keymap.set('n', 'L', '$', { desc = 'Jump to start of Line' })

-- END

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- GenAI
vim.keymap.set({ 'v', 'n' }, '<leader>aa', ':Gen<CR>', { desc = 'Open [A]I-Gen' })
vim.keymap.set({ 'v', 'n' }, '<leader>as', function()
  require('gen').select_model()
end, { desc = '[S]elect the model' })

-- Jester
vim.keymap.set('n', '<leader>tr', function()
  require('jester').run()
end, { desc = '[R]un nearest test' })

vim.keymap.set('n', '<leader>tf', function()
  require('jester').run_file()
end, { desc = 'Test [F]ile' })

vim.keymap.set('n', '<leader>tl', function()
  require('jester').run_last()
end, { desc = 'Run [L]ast Test' })

-- Lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>:LazyGit<cr>', { desc = 'Open Lazy[G]it' })
