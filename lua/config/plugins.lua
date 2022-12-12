
local function ensure_packer()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local function config(use)
  nvim = require "nvim" 

 --------------------------------------------------------------------------------
 -- Base packages
 --------------------------------------------------------------------------------
  use "wbthomason/packer.nvim"
  use "norcalli/nvim.lua" -- Lua functions for nvim
  use "nvim-lua/plenary.nvim" -- Lua functions, very useful for a lot of lua-based plugins
  use "MunifTanjim/nui.nvim" -- UI for Neovim
  use { "arsham/arshlib.nvim", 
        requires = { 
          { "nvim-lua/plenary.nvim", opt = true }, 
          { "MunifTanjim/nui.nvim", opt = true } 
        } 
      } -- Functions for Neovim


 --------------------------------------------------------------------------------
 -- Interface packages
 --------------------------------------------------------------------------------
  use "kyazdani42/nvim-web-devicons" -- Icons for file interaction
  use { "navarasu/onedark.nvim",
        config = function() require("onedark").load() end
      }
  use { "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        options = {
          theme = "onedark"
        },
        config = function() require("lualine").setup() end
      }

  use { "nvim-telescope/telescope.nvim",
        config = function()
                   -- Chords (Ivy)
                   nvim.set_keymap("n", "<C-f>", ":Telescope current_buffer_fuzzy_find theme=ivy<CR>", {})
                   nvim.set_keymap("n", "<C-f><C-f>", ":Telescope treesitter theme=ivy<CR>", {})
                   nvim.set_keymap("n", "<C-f><C-g>", ":Telescope live_grep theme=ivy<CR>", {})
                   -- Chords (Dropdown)
                   nvim.set_keymap("n", "<C-p><C-p>", ":Telescope commands theme=dropdown<CR>", {})
                   nvim.set_keymap("n", "<C-p><C-f>", ":Telescope find_files theme=ivy<CR>", {})
                   -- Chords (Float)
                   nvim.set_keymap("n", "<C-p>", ":Telescope<CR>", {})
                   nvim.set_keymap("n", "<C-p><C-b>", ":Telescope buffers<CR>", {})
                   nvim.set_keymap("n", "<C-p><C-m>", ":Telescope oldfiles<CR>", {})
                  end
      } -- Fuzzy finder
  use { "nvim-treesitter/nvim-treesitter",
        run = function()
          local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
          ts_update()
        end,
      }
  use "BurntSushi/ripgrep" -- Regex search

 --------------------------------------------------------------------------------
 -- Utility packages
 --------------------------------------------------------------------------------

  -- Terminal
  use { "s1n7ax/nvim-terminal",
        config = function()
          nvim.o.hidden = true
          require('nvim-terminal').setup()
          nvim.set_keymap("n", "<C-t>", ":lua NTGlobal['terminal']:toggle()<CR>", {})
        end
  }
  -- use { "voldikss/vim-floaterm"
  --       { config = function()
  --          nvim.set_keymap("n", "<C-t>", ":FloatermToggle<CR>", {})
  --          nvim.set_keymap("t", "<C-t>", "<C-\\><C-n>:FloatermToggle<CR>", {})
  --         end
  --       } -- Floating terminal
  --     }

  -- Misc Tools
  use { "vimwiki/vimwiki", 
        config = function() 
          nvim.g.vimwiki_list = {{
            path = "~/julwrites/wiki/vimwiki",
            syntax = "markdown",
            ext = ".md"
         }}
        end 
     } -- Local wiki
  use "wannesm/wmgraphviz.vim" -- Graphviz

  use { "sindrets/diffview.nvim",
        requires = { "nvim-lua/plenary.nvim", opt = false }
      } -- Difftool

  --------------------------------------------------------------------------------
  -- Software Development packages
  --------------------------------------------------------------------------------

  -- Git
  use "tpope/vim-fugitive" -- Git manipulation
  use "tpope/vim-surround" -- Use `S<?>` to surround a visual selection with `<?>`
  use "tpope/vim-commentary" -- Manipulate comments

end

function update()
  packer_bootstrap_success = ensure_packer()

  packer = require("packer")

  packer.init {
            display = { non_interactive = false }, -- Silent install and update
            profile = { enable = true } -- Enable profiling for package management
          }

  packer.reset()

  config(packer.use)

  packer.sync()

end

return { update = update }
