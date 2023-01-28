nvim = require "nvim"

function config() 

  local conda_env = ""
  nvim.g.python3_host_prog = "/usr/local/Caskroom/miniconda/base/" .. conda_env .. "/bin/python3"

end

return { config = config }
