print("****************************************")
print("*** *** Julwrites' Neovim Config *** ***")
print("****************************************")

-- Stuff that needs to be set before plugins run
warm = require("config.warmups")
warm.up()

plug = require("config.plugins")
plug.update()

keys = require("config.keymaps")
keys.config()

-- Stuff that needs to be set after plugins run
opts = require("config.options")
opts.config()
