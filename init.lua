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

print("Bootstrapping Nvim.lua")
bootstrap("norcalli", "nvim.lua")

local nvim = require("nvim")

print("Bootstrapping Lazy.nvim")
bootstrap("folke", "lazy.nvim")

local plug = require("config.plugins")
plug.update()

local keys = require("config.keymaps")
keys.config()

-- Stuff that needs to be set after plugins run
local opts = require("config.options")
opts.config()
