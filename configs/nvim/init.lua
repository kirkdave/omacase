local home = os.getenv("HOME")
local omacase_dir = home .. "/.local/share/omacase"
local omacase_nvim_config = omacase_dir .. "/defaults/nvim"

vim.opt.rtp:prepend(omacase_nvim_config)

require("omacase")

