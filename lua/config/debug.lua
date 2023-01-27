dap = require("dap")
nvim = require("nvim")

function load_configs()
  --- Python debug setup
  dap.adapters = {
    python = {
      type = 'executable';
      command = nvim.g.python3_host_prog;
      args = { '-m', 'debugpy.adapter' };
    }
  }
  dap.configurations = {
    python = {
        {
        type = 'python';
        request = 'launch';
        name = "Launch (Python File)";
        program = "${file}";
        pythonPath = nvim.g.python3_host_prog;
      }
    }
  }
end

return { load_configs = load_configs }
