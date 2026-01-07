-- Neovim configuration
-- Minimal setup with transparent background and cursor colors

-- Basic settings
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.mouse = 'a'                  -- Enable mouse support
vim.opt.ignorecase = true            -- Case insensitive search
vim.opt.smartcase = true             -- Case sensitive if uppercase present
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.shiftwidth = 4               -- Indent width
vim.opt.tabstop = 4                  -- Tab width
vim.opt.termguicolors = true         -- True color support
vim.opt.shortmess:append("I")        -- Disable intro/start screen

-- Transparent background
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight SignColumn guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

-- Cursor colors per mode (matching your terminal colors)
-- Normal mode: orange (#ff9800)
-- Insert mode: green (#8bc34a)
vim.opt.guicursor = {
  'n-v-c:block-Cursor/lCursor',           -- Normal, Visual, Command: block
  'i-ci-ve:ver25-CursorInsert/lCursorInsert', -- Insert: vertical bar
  'r-cr:hor20-CursorReplace/lCursorReplace',  -- Replace: horizontal bar
  'o:hor50',                                   -- Operator pending
  'a:blinkwait700-blinkoff400-blinkon250',   -- All modes: blink settings
}

-- Set cursor colors (these work in terminals that support it like foot)
vim.cmd([[
  highlight Cursor guifg=black guibg=#ff9800
  highlight CursorInsert guifg=black guibg=#8bc34a
  highlight CursorReplace guifg=black guibg=#f36c60
]])


-- Basic key mappings
vim.g.mapleader = ' '  -- Space as leader key
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'Quit' })

-- ESC alternatives (for easier exit from insert mode)
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })
