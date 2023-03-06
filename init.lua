print("****************************************")
print("*** *** Julwrites' Neovim Config *** ***")
print("****************************************")

-- Stuff that needs to be installed on first run
function bootstrap (user, repo)
    local fn = vim.fn
    local install_path = fn.stdpath('data')..string.format('/site/pack/packer/start/%s', repo)
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', string.format('https://github.com/%s/%s', user, repo), install_path})
        vim.api.nvim_command(string.format('packadd %s', repo))
    end
end

local nvim = require("nvim")

if vim.loop.os_uname().sysname == "Darwin" then
  nvim.g.python3_host_prog = "/usr/local/bin/python3"
end

print("Bootstrapping Nvim.lua")
bootstrap("norcalli", "nvim.lua")

print("Bootstrapping Packer.nvim")
bootstrap("wbthomason", "packer.nvim")

local plug = require("config.plugins")
plug.update()

local keys = require("config.keymaps")
keys.config()

-- Stuff that needs to be set after plugins run
local opts = require("config.options")
opts.config()
