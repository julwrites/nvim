nvim = require "nvim" -- Ignore warning here, better to define once for the whole file than set it locally in every single config function

function Update()
  -- Lazy.nvim
  require("lazy").setup({
    --- Base plugins, used for language or UI setup in other plugins

    {
      "navarasu/onedark.nvim",
      config = function() require("onedark").load() end
    },

    "norcalli/nvim.lua",     -- Lua functions for nvim
    "nvim-lua/plenary.nvim", -- Lua functions, very useful for a lot of lua-based plugins
    "MunifTanjim/nui.nvim",  -- UI for Neovim
    {
      "arsham/arshlib.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
      }
    }, -- Functions for Neovim

    --------------------------------------------------------------------------------
    -- Interface packages
    --------------------------------------------------------------------------------
    "ryanoasis/vim-devicons", -- Icons for file interaction
    {
      "navarasu/onedark.nvim",
      config = function() require("onedark").load() end
    },
    "nvim-tree/nvim-web-devicons",

    {
      "nvim-tree/nvim-tree.lua", -- File explorer
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
          view = {
            width = 70,
          },
          filters = {
            enable = true,
            dotfiles = false,
            git_ignored = false,
            git_clean = false,
            no_buffer = false,
            no_bookmark = false,
            custom = { 'node_modules' },
            exclude = {},
          }
        }
        nvim.set_keymap("n", "<C-n><C-n>", ":NvimTreeToggle<CR>", {})
        nvim.set_keymap("n", "<C-n><C-f>", ":NvimTreeFocus<CR>", {})
        nvim.set_keymap("n", "<C-n><C-t>", ":NvimTreeFindFile<CR>", {})
      end,
    },

    {
      "nvim-lualine/lualine.nvim", -- Status line
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      },
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
    },

    -- Fuzzy interface
    {
      "nvim-telescope/telescope.nvim",
      config = function()
        -- Chords (Ivy)
        nvim.set_keymap("n", "<C-f><C-f>", ":Telescope current_buffer_fuzzy_find theme=ivy<CR>", {})
        nvim.set_keymap("n", "<C-f><C-g>", ":Telescope live_grep theme=ivy<CR>", {})
        nvim.set_keymap("n", "<C-p><C-f>", ":Telescope find_files theme=ivy<CR>", {})
        -- Chords (Dropdown)
        nvim.set_keymap("n", "<C-g><C-s>", ":Telescope git_status theme=dropdown<CR>", {})
        nvim.set_keymap("n", "<C-g><C-b>", ":Telescope git_branches theme=dropdown<CR>", {})
        -- Chords (Float)
        nvim.set_keymap("n", "<C-p>", ":Telescope<CR>", {})
        nvim.set_keymap("n", "<C-p><C-p>", ":Telescope commands theme=dropdown<CR>", {})
        nvim.set_keymap("n", "<C-p><C-h>", ":Telescope help_tags<CR>", {})
        nvim.set_keymap("n", "<C-p><C-b>", ":Telescope buffers<CR>", {})
        nvim.set_keymap("n", "<C-p><C-m>", ":Telescope oldfiles<CR>", {})
        nvim.set_keymap("n", "<C-p><C-k>", ":Telescope keymaps<CR>", {})
      end
    },
    {
      "ibhagwan/fzf-lua", -- Fuzzy search
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end
    },
    {
      "nvim-telescope/telescope-media-files.nvim",
      config = function()
        require('telescope').load_extension('media_files')
        require 'telescope'.setup {
          extensions = {
            media_files = {
              -- filetypes whitelist
              -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
              filetypes = { "png", "webp", "jpg", "jpeg" },
              -- find command (defaults to `fd`)
              find_cmd = "rg"
            }
          },
        }
      end
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("lazy").setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "http" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })
      end
    },
    "BurntSushi/ripgrep", -- Regex search

    --------------------------------------------------------------------------------
    -- Utility packages
    --------------------------------------------------------------------------------

    {
      "akinsho/toggleterm.nvim", -- Terminal
      opts = {
        tag = '*',
      },
      config = function()
        require("toggleterm").setup {
          open_mapping = [[<C-t>]],
          insert_mappings = true,
          terminal_mappings = true,
          autochdir = true,
          start_in_insert = true,
        }
        nvim.set_keymap("t", "<Esc>", "<C-\\><C-n>", {})
      end
    },

    -- Task runner
    {
      "jedrzejboczar/toggletasks.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "akinsho/toggleterm.nvim",
        "nvim-telescope/telescope.nvim"
      },
      config = function()
        require('toggletasks').setup {
          search_paths = {
            "toggletasks",
            ".toggletasks",
            ".nvim/toggletasks",
            ".vscode/toggletasks",
            ".vscode/tasks"
          }
        }

        require('telescope').load_extension('toggletasks')
        nvim.set_keymap("n", "<C-t><C-t>", ":Telescope toggletasks select<CR>", {})
        nvim.set_keymap("n", "<C-t><C-s>", ":Telescope toggletasks spawn<CR>", {})
        nvim.set_keymap("n", "<C-t><C-e>", ":Telescope toggletasks edit<CR>", {})
      end
    },

    -- Remote access
    {
      "amitds1997/remote-nvim.nvim",
      version = "*",                     -- Pin to GitHub releases
      dependencies = {
        "nvim-lua/plenary.nvim",         -- For standard functions
        "MunifTanjim/nui.nvim",          -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
      },
      config = function()
        require("remote-nvim").setup({
          client_callback = function(port, _)
            local cmd = ("neovide --server localhost:%s"):format(port)
            vim.fn.jobstart(cmd, {
              detach = true
            })
          end
        })
      end,
    },

    -- Docker
    {
      "mgierada/lazydocker.nvim",
      dependencies = { "akinsho/toggleterm.nvim" },
      config = function()
        require("lazydocker").setup {}
        nvim.set_keymap("n", "<C-l><C-d>", ":Lazydocker<CR>", {})
      end,
      event = "VeryLazy", -- or any other event you might want to use.
    },

    {
      "vimwiki/vimwiki", -- Wiki
      init = function()
        nvim.g.vimwiki_list = { {
          path = "~/julwrites/wiki",
          syntax = "markdown",
          ext = ".md"
        } }
        nvim.g.vimwiki_global_ext = 0
        nvim.set_keymap("n", "<BS>", ":VimwikiGoBacklink<CR>", {})
        nvim.set_keymap("n", "<Leader>ww", ":VimwikiIndex<CR>", {})
        nvim.set_keymap("n", "<Leader>bb", ":VimwikiBacklinks<CR>", {})
        nvim.set_keymap("n", "<Leader>tt", ":VimwikiTable<CR>", {})
        nvim.set_keymap("n", "<Leader>lt", ":VimwikiToggleListItem<CR>", {})
        nvim.set_keymap("n", "<Leader>lr", ":VimwikiToggleRejectedListItem<CR>", {})
      end
    },

    -- URL Viewing
    {
      "axieax/urlview.nvim",
      config = function()
        require("urlview").setup({
          default_picker = "telescope",
          default_action = "system"
        })

        nvim.set_keymap("n", "<C-p><C-u>", ":UrlView<CR>", { desc = "View buffer URLs" })
        nvim.set_keymap("n", "<C-p><C-u><C-p>", ":UrlView packer<CR>", { desc = "View Packer plugin URLs" })
      end
    },

    -- HTTP Request Scratchpad
    {
      "rest-nvim/rest.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "http")
        end,
      }
    },

    "wannesm/wmgraphviz.vim", -- Graphviz
    "godlygeek/tabular",

    {
      "sindrets/diffview.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },               -- Difftool

    "lervag/vimtex", -- LaTeX

    --------------------------------------------------------------------------------
    -- Software Development packages
    --------------------------------------------------------------------------------

    -- Git

    "tpope/vim-fugitive",   -- Git manipulation
    "tpope/vim-surround",   -- Use `S<?>` to surround a visual selection with `<?>`
    "tpope/vim-commentary", -- Manipulate comments

    {
      "kdheepak/lazygit.nvim",
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      -- optional for floating window border decoration
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      -- setting the keybinding for LazyGit with 'keys' is recommended in
      -- order to load the plugin when the command is run for the first time
      keys = {
        { "<C-l><C-g>", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit" }
      }
    }, -- GitUI

    -- LSP

    {
      'numToStr/Comment.nvim',
      opts = {
      },
      lazy = false,
    },

    {
      'williamboman/mason.nvim',
      config = function()
        require("mason").setup()
      end,
      run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim'
      },
      config = function()
        require("mason-lspconfig").setup {
          ensure_installed = {
            "lua_ls",
            "bashls",
            "pyright",
            "clangd",
            "ts_ls",
            "volar",
            "astro",
            "rust_analyzer",
            "ltex",
          }
        }
      end
    },

    {
      "neovim/nvim-lspconfig",
      dependencies = {
        'williamboman/mason-lspconfig.nvim'
      }
    },
    {
      "hrsh7th/cmp-nvim-lsp",
      dependencies = {
        "neovim/nvim-lspconfig"
      }
    },

    {
      "stevearc/conform.nvim",
      opts = {},
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            lua = { "stylua" },
            python = { "isort", "black" },
            rust = { "rustfmt", lsp_format = "fallback" },
            cpp = { "clang-format" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
          },
          format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
          },
        })
      end
    },

    -- Debug Adaptor Protocol
    {
      'simrat39/rust-tools.nvim',
      config = function()
        local rt = require("rust-tools")
        rt.setup({
          server = {
            on_attach = function(_, bufnr)
              -- Hover actions
              nvim.set_keymap("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
              -- Code action groups
              nvim.set_keymap("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
          },
        })
      end
    },

    {
      "mfussenegger/nvim-dap",
      config = function()
        nvim.set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", {})
        nvim.set_keymap("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", {})
        nvim.set_keymap("n", "<C-F9>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {})
        nvim.set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", {})
        nvim.set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", {})
        nvim.set_keymap("n", "<C-F11>", ":lua require'dap'.step_out()<CR>", {})

        -- local debug = require("config.debug")
        -- debug.load_configs()
      end
    },
    {
      "nvim-telescope/telescope-dap.nvim",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-telescope/telescope.nvim"
      },
      config = function()
        require('telescope').load_extension('dap')

        nvim.set_keymap("n", "<C-p><C-d><C-d>", ":Telescope dap commands<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-c>", ":Telescope dap configuration<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-b>", ":Telescope dap list_breakpoints<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-v>", ":Telescope dap variables<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-f>", ":Telescope dap frames<CR>", {})
      end
    },
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap"
      },
      config = function()
        nvim.set_keymap("n", "<C-p><C-d>", ":lua require'dapui'.toggle()<CR>", {})
      end
    },
    {
      "rcarriga/cmp-dap",
      config = function()
        require("cmp").setup({
          enabled = function()
            return nvim.bo.buftype ~= "prompt"
                or require("cmp_dap").is_dap_buffer()
          end
        })

        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
          sources = {
            { name = "dap" },
          },
        })
      end
    },

    -- Completion
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline"
      },
      config = function()
        local cmp = require 'cmp'

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
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        for _, lsp in ipairs({
          "lua_ls",
          "bashls",
          "pyright",
          "tsserver",
          "volar",
          "astro",
          "sourcekit",
          "rls",
          "rust_analyzer",
          "ltex",
        }) do
          lspconfig[lsp].setup {
            capabilities = capabilities
          }
        end
      end
    },

    -- GenAI Tools
    {
      "olimorris/codecompanion.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "hrsh7th/nvim-cmp",                      -- Optional: For using slash commands and variables in the chat buffer
        "nvim-telescope/telescope.nvim",         -- Optional: For using slash commands
        { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves the default Neovim UI
      },
      config = function()
        require("codecompanion").setup({
          strategies = {
            chat = {
              adapter = "anthropic",
              tools = {
                ["mcp"] = {
                  callback = function() return require("mcphub.extensions.codecompanion") end,
                  description = "Call tools and resources from the MCP Servers",
                  opts = {
                    requires_approval = true,
                  }
                }
              }
            },
            inline = {
              adapter = "ollama",
            },
            agent = {
              adapter = "anthropic",
            },
          },
          adapters = {
            anthropic = function()
              return require("codecompanion.adapters").extend("anthropic", {
                env = {
                  api_key = "ANTHROPIC_API_KEY"
                },
                schema = {
                  model = {
                    default = "claude-3-5-sonnet-latest"
                  }
                }
              })
            end,
            mistral = function()
              return require("codecompanion.adapters").extend("ollama", {
                name = "ollama", -- Give this adapter a different name to differentiate it from the default ollama adapter
                env = {
                  url = "https://ollama.tehj.sh"
                },
                schema = {
                  model = {
                    default = "qwen2.5:7b",
                  },
                  num_ctx = {
                    default = 16384,
                  },
                  num_predict = {
                    default = -1,
                  },
                },
              })
            end,
          }
        })
      end
    },

    {
      "ravitemer/mcphub.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
      },
      -- cmd = "MCPHub", -- lazily start the hub when `MCPHub` is called
      build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
      config = function()
        require("mcphub").setup({
          -- Required options
          port = 3000,                                               -- Port for MCP Hub server
          config = vim.fn.expand("~/julwrites/mcp/mcpservers.json"), -- Absolute path to config file

          -- Optional options
          on_ready = function(hub)
            -- Called when hub is ready
          end,
          on_error = function(err)
            -- Called on errors
          end,
          log = {
            level = vim.log.levels.WARN,
            to_file = false,
            file_path = nil,
            prefix = "MCPHub"
          },
        })
      end
    }

  })
end

return { update = Update }
