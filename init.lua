print("****************************************")
print("*** *** Julwrites' Neovim Config *** ***")
print("****************************************")

-- Stuff that needs to be set before plugins run
local nvim = require("nvim")
local conda_env = "envs/labelImg"
nvim.g.python3_host_prog = "/usr/local/Caskroom/miniconda/base/" .. conda_env .. "/bin/python3"

local plug = require("config.plugins")
plug.update()

local keys = require("config.keymaps")
keys.config()

-- Stuff that needs to be set after plugins run
local opts = require("config.options")
opts.config()
