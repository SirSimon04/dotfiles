vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>qe', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

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
local layout = os.getenv 'KEYBOARD_LAYOUT'

if layout == 'NOTED' then
  -- hjkl movements
  vim.keymap.set('n', 't', 'j')
  vim.keymap.set('n', 'n', 'k')
  vim.keymap.set('n', 'd', 'h')
  vim.keymap.set('n', 'r', 'l')

  vim.keymap.set('v', 't', 'j')
  vim.keymap.set('v', 'n', 'k')
  vim.keymap.set('v', 'd', 'h')
  vim.keymap.set('v', 'r', 'l')

  vim.keymap.set('n', 'D', '0', { desc = 'Jump to start of Line' })
  vim.keymap.set('n', 'R', '$', { desc = 'Jump to start of Line' })

  -- remaps from d to k
  -- Remap 'k' to 'd'
  vim.keymap.set('n', 'k', 'd') -- Normal mode: k to d
  vim.keymap.set('n', 'K', 'D') -- Normal mode: K to D
  vim.keymap.set('v', 'k', 'd') -- Visual mode: k to d
  vim.keymap.set('v', 'K', 'D') -- Visual mode: K to D
  vim.keymap.set('n', 'kk', 'dd') -- Normal mode: kk to dd
  vim.keymap.set('x', 'k', 'd') -- Visual selection mode: k to d

  -- Add more combinations as necessary
  vim.keymap.set('n', 'k$', 'd$') -- Normal mode: k$ to d$
  vim.keymap.set('n', 'kt', 'dt') -- Normal mode: kt to dt
  vim.keymap.set('v', 'k$', 'd$') -- Visual mode: k$ to d$
  vim.keymap.set('v', 'kt', 'dt') -- Visual mode: kt to dt

  -- Remap 'l' to 'r'
  vim.keymap.set('n', 'l', 'r') -- Normal mode: l to r
  vim.keymap.set('n', 'L', 'R') -- Normal mode: L to R
  vim.keymap.set('v', 'l', 'r') -- Visual mode: l to r
  vim.keymap.set('v', 'L', 'R') -- Visual mode: L to R
  vim.keymap.set('n', 'll', 'rr') -- Normal mode: ll to rr
  vim.keymap.set('x', 'l', 'r') -- Visual selection mode: l to r

  -- Add more combinations as necessary
  vim.keymap.set('n', 'l$', 'r$') -- Normal mode: l$ to r$
  vim.keymap.set('n', 'lt', 'rt') -- Normal mode: lt to rt
  vim.keymap.set('v', 'l$', 'r$') -- Visual mode: l$ to r$
  vim.keymap.set('v', 'lt', 'rt') -- Visual mode: lt to rt

  -- Window navigation
  vim.keymap.set('n', '<C-d>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
  vim.keymap.set('n', '<C-r>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
  vim.keymap.set('n', '<C-t>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
  vim.keymap.set('n', '<C-n>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

  -- Leave insert mode
  vim.keymap.set('i', 'tn', '<ESC>', { desc = 'Leave Insert Mode with tn' })
  vim.keymap.set('i', 'tN', '<ESC>', { desc = 'Leave Insert Mode with tN' })

  -- Start and End of Line
  vim.keymap.set('n', 'H', '0', { desc = 'Jump to start of Line' })
  vim.keymap.set('n', 'L', '$', { desc = 'Jump to start of Line' })

  vim.keymap.set('n', '<C-u>', '<C-r>', { desc = 'Revert last undo' })
else
  --
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
end
-- First

-- second
--
-- END

-- GenAI
vim.keymap.set({ 'v', 'n' }, '<leader>aa', ':Gen<CR>', { desc = 'Open [A]I-Gen' })
vim.keymap.set({ 'v', 'n' }, '<leader>as', function()
  require('gen').select_model()
end, { desc = '[S]elect the model' })

-- Jester
-- vim.keymap.set('n', '<leader>tr', function()
--   require('jester').run()
-- end, { desc = '[R]un nearest test' })
--
-- vim.keymap.set('n', '<leader>tf', function()
--   require('jester').run_file()
-- end, { desc = 'Test [F]ile' })
--
-- vim.keymap.set('n', '<leader>tl', function()
--   require('jester').run_last()
-- end, { desc = 'Run [L]ast Test' })

-- Tests
-- Run the nearest test
vim.keymap.set('n', '<leader>tr', "<cmd>lua require('neotest').run.run()<cr>", { desc = '[R]un the nearest test' })

-- Run the current file
vim.keymap.set('n', '<leader>tf', "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { desc = 'Run the current [F]ile' })

-- Debug the nearest test
vim.keymap.set('n', '<leader>td', "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", { desc = 'Debug the nearest test' })

-- Stop the nearest test
vim.keymap.set('n', '<leader>tS', "<cmd>lua require('neotest').run.stop()<cr>", { desc = '[S]top the nearest test' })

-- Attach to the nearest test
vim.keymap.set('n', '<leader>ta', "<cmd>lua require('neotest').run.attach()<cr>", { desc = '[A]ttach to the nearest test' })

-- Watch tests for changes
vim.keymap.set('n', '<leader>tc', "<cmd>lua require('neotest').watch.watch()<cr>", { desc = 'Watch tests under [C]ursor for changes' })

-- Watch mode for relevant tests
vim.keymap.set('n', '<leader>tw', "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watch ' })<cr>", { desc = '[W]atch relevant tests (changed)' })

-- Watch all tests
vim.keymap.set('n', '<leader>tW', "<cmd>lua require('neotest').run.run({ jestCommand = 'jest --watchAll ' })<cr>", { desc = '[W]atch all tests' })

-- Open output window for the nearest test
vim.keymap.set('n', '<leader>to', "<cmd>lua require('neotest').output.open({ enter = true })<cr>", { desc = 'Show the [O]utput of the nearest test' })

-- Open output window and hover for the nearest test
vim.keymap.set(
  'n',
  '<leader>th',
  "<cmd>lua require('neotest').output.open({ enter = true, hover = true })<cr>",
  { desc = 'Show the output of the nearest test and [H]over' }
)

-- Open summary window
vim.keymap.set('n', '<leader>tsw', "<cmd>lua require('neotest').summary.open()<cr>", { desc = 'Open summary window' })

-- Close summary window
vim.keymap.set('n', '<leader>tsc', "<cmd>lua require('neotest').summary.close()<cr>", { desc = 'Close summary window' })

-- Toggle summary window
vim.keymap.set('n', '<leader>tst', "<cmd>lua require('neotest').summary.toggle()<cr>", { desc = 'Toggle summary window' })

-- Open output panel
vim.keymap.set('n', '<leader>tpo', "<cmd>lua require('neotest').output_panel.open()<cr>", { desc = 'Open output panel' })

-- Close output panel
vim.keymap.set('n', '<leader>tpc', "<cmd>lua require('neotest').output_panel.close()<cr>", { desc = 'Close output panel' })

-- Toggle output panel
vim.keymap.set('n', '<leader>tpt', "<cmd>lua require('neotest').output_panel.toggle()<cr>", { desc = 'Toggle output panel' })

-- Lazygit
vim.keymap.set('n', '<leader>gg', '<cmd>:LazyGit<cr>', { desc = 'Open Lazy[G]it' })

-- Debug
vim.keymap.set('n', '<leader>de', '<cmd>:lua require("dapui").eval()<cr>', { desc = 'Evaluate' })

-- Navigate Quickfix lis
vim.keymap.set('n', '[q', '<cmd>:cprev<cr>', { desc = 'Previous [Q]uickfix item' })
vim.keymap.set('n', ']q', '<cmd>:cnext<cr>', { desc = 'Next [Q]uickfix item' })
