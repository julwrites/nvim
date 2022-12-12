print("****************************************")
print("*** *** Julwrites' Neovim Config *** ***")
print("****************************************")

plug = require("config.plugins")
plug.update()

keys = require("config.keymaps")
keys.update()

opts = require("config.options")
opts.update()
