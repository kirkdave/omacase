-- the leader key needs to be set before any plugins are loaded, otherwise the plugins
-- will pick up the wrong leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local km = vim.keymap

km.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlighting" })

km.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- makes navigating around splits a bit simpler
-- use ctrl+h/j/k/l to move between windows
km.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
km.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
km.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upeer window" })
km.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
