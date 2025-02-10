-- We need MISE shims to be in our PATH
vim.env.PATH = vim.env.HOME .. "/.local/share/mise/shims:" .. vim.env.PATH

local opt = vim.opt

opt.number = true
opt.relativenumber = true

-- syncs the keyboard with the OS clipboard
-- schedule the setting after `UiEnter` to improve startup time
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- we enable mouse mode as it can be useful at times, e.g. resizing splits
opt.mouse = "a"

-- 4 spaces
-- using 4 spaces helps to draw the eye to excessive nesting and we don't need to be super strict
-- in line length because we aren't using a teletype (looking at you PEP8)
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

-- when searching, ignore case unless we provide a multi-case search string
opt.ignorecase = true
opt.smartcase = true

-- preview substitutions as we're typing them
opt.inccommand = "split"

-- some appearance goodies
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes:1"
opt.cursorline = true
opt.scrolloff = 10

opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

opt.splitright = true
opt.splitbelow = true

-- allow our backspace key to work "as expected"
opt.backspace = "indent,eol,start"

opt.swapfile = false
opt.undofile = true

-- decrease update time and mapped sequence wait time
opt.updatetime = 250
opt.timeoutlen = 300
