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
  use "nvim-tree/nvim-web-devicons" 
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

  use { "junegunn/fzf", 
        run = "./install --bin"}
  use { "ibhagwan/fzf-lua",
        -- optional for icon support
        requires = { 
          { "nvim-tree/nvim-web-devicons", opt = true },
          { "junegunn/fzf", opt = true }
        }
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
          nvim.set_keymap("n", "<C-p><C-k>", ":Telescope keymaps<CR>", {})
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

  -- LSP
  use "neovim/nvim-lspconfig"
  use "hrsh7th/cmp-nvim-lsp"

  -- Snippets
  use "rafamadriz/friendly-snippets"
  use { "L3MON4D3/LuaSnip",
        requires = {
          { "rafamadriz/friendly-snippets", opt = true }
        },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      }

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
  use { "nvim-telescope/telescope-dap.nvim",
        requires = {
          { "mfussenegger/nvim-dap", opt = false },
          { "nvim-telescope/telescope.nvim", opt = false },
        },
        config = function()
          require('telescope').load_extension('dap')

          nvim.set_keymap("n", "<C-p><C-d><C-d>", ":Telescope dap commands<CR>", {})
          nvim.set_keymap("n", "<C-p><C-d><C-c>", ":Telescope dap configuration<CR>", {})
          nvim.set_keymap("n", "<C-p><C-d><C-b>", ":Telescope dap list_breakpoints<CR>", {})
          nvim.set_keymap("n", "<C-p><C-d><C-v>", ":Telescope dap variables<CR>", {})
          nvim.set_keymap("n", "<C-p><C-d><C-f>", ":Telescope dap frames<CR>", {})
        end
      }
  use { "rcarriga/nvim-dap-ui", 
        requires = {
          { "mfussenegger/nvim-dap", opt = false },
        },
        config = function()
          nvim.set_keymap("n", "<C-p><C-d>", ":lua require'dapui'.toggle()<CR>", {})
        end
      }
  use { "rcarriga/cmp-dap",
        config = function()
          require("cmp").setup({
            enabled = function()
              return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
                  or require("cmp_dap").is_dap_buffer()
            end
          })

          require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
            sources = {
              { name = "dap" },
            },
          })
        end
      }

  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"

  -- Completion
  use { "hrsh7th/nvim-cmp",
        requires = {
          { "L3MON4D3/LuaSnip", opt = true },
          { "hrsh7th/cmp-nvim-lsp", opt = true }
        },
        config = function()
          local cmp = require'cmp'

          cmp.setup({
            snippet = {
              -- REQUIRED - you must specify a snippet engine
              expand = function(args)
                require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
              end,
            },
            window = {
              -- completion = cmp.config.window.bordered(),
              -- documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
              ['<C-b>'] = cmp.mapping.scroll_docs(-4),
              ['<C-f>'] = cmp.mapping.scroll_docs(4),
              ['<C-Space>'] = cmp.mapping.complete(),
              ['<C-e>'] = cmp.mapping.abort(),
              ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
              { name = 'nvim_lsp' },
              { name = 'luasnip' }, -- For luasnip users.
            }, {
              { name = 'buffer' },
            })
          })

          -- Set configuration for specific filetype.
          cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
              { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
            }, {
              { name = 'buffer' },
            })
          })

          -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = 'buffer' }
            }
          })

          -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
          cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
              { name = 'path' }
            }, {
              { name = 'cmdline' }
            })
          })

          -- Set up lspconfig.
          local capabilities = require('cmp_nvim_lsp').default_capabilities()

          -- TODO: List and run through configs
          require('lspconfig')['sumneko_lua'].setup {
            capabilities = capabilities
          }
        end
      }

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