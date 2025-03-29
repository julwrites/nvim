function Config()
  local nvim = require "nvim"

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
  nvim.o.conceallevel = 2

  nvim.g.completeopt = { 'menu', 'menuone', 'noselect' }

  nvim.g.loaded_perl_provider = 0

  nvim.g.loaded_netrw = 1
  nvim.g.loaded_netrwPlugin = 1
end

return { config = Config }
