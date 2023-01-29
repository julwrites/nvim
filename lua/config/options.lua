local nvim = require "nvim"

function Config()
  -- Display row number
  nvim.wo.number = true
  nvim.command(":set nowrap")

  nvim.g.autoread = true

  nvim.g.showcmd = true
  nvim.g.showmatch = true
  nvim.g.showmode = true

  nvim.o.autoindent = true
  nvim.o.smarttab = true
  nvim.o.expandtab = true
  nvim.o.tabstop = 2
  nvim.o.shiftwidth = 2

  nvim.g.completeopt = {'menu', 'menuone', 'noselect'}
end

return { config = Config }
