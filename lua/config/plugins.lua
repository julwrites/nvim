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
  use "ryanoasis/vim-devicons" -- Icons for file interaction
  use { "navarasu/onedark.nvim",
        config = function() require("onedark").load() end
      }
  use { "nvim-lualine/lualine.nvim",
        requires = { "ryanoasis/vim-devicons", opt = true },
        config = function()
          require("lualine").setup {
            options = {
              theme = "codedark",
              extensions = {
                "fugitive",
                "fzf",
                "toggleterm",
              }
            }
          }
        end
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

  use { "akinsho/toggleterm.nvim",
        tag = '*', 
        config = function()
          require("toggleterm").setup {
            open_mapping = [[<C-t>]],
            insert_mappings = true,
            terminal_mappings = true,
            autochdir = true,
            start_in_insert = true,
          }
        end
      }

  -- Task runner
  use { "jedrzejboczar/toggletasks.nvim",
        requires = {
          { "nvim-lua/plenary.nvim", opt = true },
          { "akinsho/toggleterm.nvim", opt = true },
          { "nvim-telescope/telescope.nvim", opt = true },
        },
        config = function()
          require('toggletasks').setup()
          require('telescope').load_extension('toggletasks')
          nvim.set_keymap("n", "<C-t><C-t>", ":Telescope toggletasks select<CR>", {})
          nvim.set_keymap("n", "<C-t><C-s>", ":Telescope toggletasks spawn<CR>", {})
          nvim.set_keymap("n", "<C-t><C-e>", ":Telescope toggletasks edit<CR>", {})
        end
      }

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
        requires = { "nvim-lua/plenary.nvim", opt = true }
      } -- Difftool

  --------------------------------------------------------------------------------
  -- Software Development packages
  --------------------------------------------------------------------------------

  -- Git
  use "tpope/vim-fugitive" -- Git manipulation
  use "tpope/vim-surround" -- Use `S<?>` to surround a visual selection with `<?>`
  use "tpope/vim-commentary" -- Manipulate comments

  -- Debug Adaptor Protocol
  use { "mfussenegger/nvim-dap",
        config = function()
          nvim.set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", {})
          nvim.set_keymap("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", {})
          nvim.set_keymap("n", "<C-F9>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
          nvim.set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", {})
          nvim.set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", {})
          nvim.set_keymap("n", "<C-F11>", ":lua require'dap'.step_out()<CR>", {})

          local debug = require("config.debug")
          debug.load_configs()
        end
      }

end

function update()
  packer_bootstrap_success = ensure_packer()

  packer = require("packer")

  packer.init {
            display = { non_interactive = true }, -- Silent install and update
            profile = { enable = true } -- Enable profiling for package management
          }

  packer.reset()

  config(packer.use)

  packer.sync()

end

return { update = update }
