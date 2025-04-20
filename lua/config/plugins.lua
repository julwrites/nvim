-- Load nvim module globally for the file to avoid repeated local declarations
nvim = require "nvim" -- Ignore warning here, better to define once for the whole file

function Update()
  -- Initialize lazy.nvim plugin manager
  require("lazy").setup({
    --------------------------------------------------------------------------------
    -- Core/Foundation plugins
    --------------------------------------------------------------------------------

    -- Lua utility libraries
    "norcalli/nvim.lua",     -- Lua functions specifically for Neovim
    "nvim-lua/plenary.nvim", -- Common Lua functions used by many plugins
    "MunifTanjim/nui.nvim",  -- UI component library for Neovim plugins

    -- Additional utility functions
    {
      "arsham/arshlib.nvim", -- Extended functions for Neovim
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
      }
    },

    -- Theme
    {
      "navarasu/onedark.nvim", -- Atom's One Dark theme for Neovim
      config = function() require("onedark").load() end
    },

    --------------------------------------------------------------------------------
    -- Interface plugins
    --------------------------------------------------------------------------------

    -- Icons
    "ryanoasis/vim-devicons",      -- Icons for various plugins (legacy)
    "nvim-tree/nvim-web-devicons", -- Modern icon support with patched fonts

    -- File explorer
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
          view = {
            width = 70, -- Wider view for better readability
          },
          filters = {
            enable = true,
            dotfiles = false,
            git_ignored = false,
            git_clean = false,
            no_buffer = false,
            no_bookmark = false,
            custom = { 'node_modules' }, -- Hide node_modules folder
            exclude = {},
          }
        }
        -- Keymaps for file explorer
        nvim.set_keymap("n", "<C-n><C-n>", ":NvimTreeToggle<CR>", {})
        nvim.set_keymap("n", "<C-n><C-f>", ":NvimTreeFocus<CR>", {})
        nvim.set_keymap("n", "<C-n><C-t>", ":NvimTreeFindFile<CR>", {})
      end,
    },

    -- Status line
    {
      "nvim-lualine/lualine.nvim",
      dependencies = {
        "nvim-tree/nvim-web-devicons"
      },
      config = function()
        require("lualine").setup {
          options = {
            theme = "codedark", -- Theme that matches editor theme
            extensions = {
              "fugitive",       -- Git integration
              "fzf",            -- Fuzzy finder integration
              "toggleterm",     -- Terminal integration
            }
          }
        }
      end
    },

    -- Fuzzy finder and navigation
    {
      "nvim-telescope/telescope.nvim",
      config = function()
        -- Keymaps organized by theme type
        -- Ivy theme (minimal, at the bottom)
        nvim.set_keymap("n", "<C-f><C-f>", ":Telescope current_buffer_fuzzy_find theme=ivy<CR>", {})
        nvim.set_keymap("n", "<C-f><C-g>", ":Telescope live_grep theme=ivy<CR>", {})
        nvim.set_keymap("n", "<C-p><C-f>", ":Telescope find_files theme=ivy<CR>", {})

        -- Dropdown theme (centered menu)
        nvim.set_keymap("n", "<C-g><C-s>", ":Telescope git_status theme=dropdown<CR>", {})
        nvim.set_keymap("n", "<C-g><C-b>", ":Telescope git_branches theme=dropdown<CR>", {})
        nvim.set_keymap("n", "<C-p><C-p>", ":Telescope commands theme=dropdown<CR>", {})

        -- Default float theme
        nvim.set_keymap("n", "<C-p>", ":Telescope<CR>", {})
        nvim.set_keymap("n", "<C-p><C-h>", ":Telescope help_tags<CR>", {})
        nvim.set_keymap("n", "<C-p><C-b>", ":Telescope buffers<CR>", {})
        nvim.set_keymap("n", "<C-p><C-m>", ":Telescope oldfiles<CR>", {})
        nvim.set_keymap("n", "<C-p><C-k>", ":Telescope keymaps<CR>", {})
      end
    },
    -- Alternative fuzzy finder with fzf backend
    {
      "ibhagwan/fzf-lua",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("fzf-lua").setup({})
        require("fzf-lua").register_ui_select() -- Use for vim.ui.select replacement
      end
    },

    -- Media file preview for telescope
    {
      "nvim-telescope/telescope-media-files.nvim",
      config = function()
        require('telescope').load_extension('media_files')
        require('telescope').setup {
          extensions = {
            media_files = {
              filetypes = { "png", "webp", "jpg", "jpeg" }, -- Image formats to preview
              find_cmd = "rg"                               -- Use ripgrep for finding files
            }
          },
        }
      end
    },

    -- Syntax highlighting and code parsing
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate", -- Auto-update parsers when needed
      config = function()
        require("lazy").setup({
          ensure_installed = {
            "c", "lua", "vim", "vimdoc", "query",
            "elixir", "heex", "javascript", "html", "http"
          },
          sync_install = false,
          highlight = { enable = true }, -- Enable syntax highlighting
          indent = { enable = true },    -- Enable indentation
        })
      end
    },

    -- Fast grep tool for searching
    "BurntSushi/ripgrep",

    --------------------------------------------------------------------------------
    -- Utility plugins
    --------------------------------------------------------------------------------

    -- Integrated terminal
    {
      "akinsho/toggleterm.nvim",
      opts = {
        tag = '*',
      },
      config = function()
        require("toggleterm").setup {
          open_mapping = [[<C-t>]],                      -- Toggle terminal with Ctrl+t
          insert_mappings = true,                        -- Enable mappings in insert mode
          terminal_mappings = true,                      -- Enable mappings in terminal mode
          autochdir = true,                              -- Auto change directory to current file
          start_in_insert = true,                        -- Start terminal in insert mode
        }
        nvim.set_keymap("t", "<Esc>", "<C-\\><C-n>", {}) -- Escape from terminal mode
      end
    },

    -- Task runner integration
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
            ".vscode/toggletasks", -- Compatible with VS Code tasks
            ".vscode/tasks"
          }
        }

        -- Register with telescope and set up keymaps
        require('telescope').load_extension('toggletasks')
        nvim.set_keymap("n", "<C-t><C-t>", ":Telescope toggletasks select<CR>", {})
        nvim.set_keymap("n", "<C-t><C-s>", ":Telescope toggletasks spawn<CR>", {})
        nvim.set_keymap("n", "<C-t><C-e>", ":Telescope toggletasks edit<CR>", {})
      end
    },

    -- Remote editing support
    {
      "amitds1997/remote-nvim.nvim",
      version = "*",                     -- Pin to GitHub releases for stability
      dependencies = {
        "nvim-lua/plenary.nvim",         -- For standard functions
        "MunifTanjim/nui.nvim",          -- To build the plugin UI
        "nvim-telescope/telescope.nvim", -- For picking between different remote methods
      },
      config = function()
        require("remote-nvim").setup({
          client_callback = function(port, _)
            -- Launch neovide GUI client connected to this instance
            local cmd = ("neovide --server localhost:%s"):format(port)
            vim.fn.jobstart(cmd, {
              detach = true
            })
          end
        })
      end,
    },

    -- Docker integration
    {
      "mgierada/lazydocker.nvim",
      dependencies = { "akinsho/toggleterm.nvim" },
      config = function()
        require("lazydocker").setup {}
        nvim.set_keymap("n", "<C-l><C-d>", ":Lazydocker<CR>", {}) -- Open Docker UI
      end,
      event = "VeryLazy",                                         -- Load only when needed
    },

    -- Personal wiki system
    {
      "vimwiki/vimwiki",
      init = function()
        -- Configure wiki location and format
        nvim.g.vimwiki_list = { {
          path = "~/julwrites/wiki",
          syntax = "markdown",        -- Use markdown syntax
          ext = ".md"                 -- Use .md extension
        } }
        nvim.g.vimwiki_global_ext = 0 -- Don't treat all .md files as wiki pages

        -- Wiki navigation keymaps
        nvim.set_keymap("n", "<BS>", ":VimwikiGoBacklink<CR>", {})
        nvim.set_keymap("n", "<Leader>ww", ":VimwikiIndex<CR>", {})
        nvim.set_keymap("n", "<Leader>bb", ":VimwikiBacklinks<CR>", {})
        nvim.set_keymap("n", "<Leader>tt", ":VimwikiTable<CR>", {})
        nvim.set_keymap("n", "<Leader>lt", ":VimwikiToggleListItem<CR>", {})
        nvim.set_keymap("n", "<Leader>lr", ":VimwikiToggleRejectedListItem<CR>", {})
      end
    },

    -- URL extraction and management
    {
      "axieax/urlview.nvim",
      config = function()
        require("urlview").setup({
          default_picker = "telescope", -- Use telescope for URL selection
          default_action = "system"     -- Open URLs with system default app
        })

        nvim.set_keymap("n", "<C-p><C-u>", ":UrlView<CR>", { desc = "View buffer URLs" })
        nvim.set_keymap("n", "<C-p><C-u><C-p>", ":UrlView packer<CR>", { desc = "View Packer plugin URLs" })
      end
    },

    -- HTTP request client
    {
      "rest-nvim/rest.nvim",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, "http") -- Ensure HTTP syntax is installed
        end,
      }
    },

    -- Specialized file format support
    "wannesm/wmgraphviz.vim", -- Graphviz dot file support
    "godlygeek/tabular",      -- Text alignment

    -- Git diff viewer
    {
      "sindrets/diffview.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- LaTeX support
    "lervag/vimtex",

    --------------------------------------------------------------------------------
    -- Software Development plugins
    --------------------------------------------------------------------------------

    -- Git integration
    "tpope/vim-fugitive", -- Git commands within Vim

    -- Text manipulation
    "tpope/vim-surround",   -- Surround text with pairs (brackets, quotes, etc.)
    "tpope/vim-commentary", -- Comment/uncomment code easily

    -- Git UI
    {
      "kdheepak/lazygit.nvim",
      cmd = {
        "LazyGit",
        "LazyGitConfig",
        "LazyGitCurrentFile",
        "LazyGitFilter",
        "LazyGitFilterCurrentFile",
      },
      dependencies = {
        "nvim-lua/plenary.nvim",
      },
      keys = {
        { "<C-l><C-g>", "<cmd>LazyGitCurrentFile<cr>", desc = "Open LazyGit for current file" }
      }
    },

    -- SQL support
    "kkharji/sqlite.lua", -- SQLite interface for Lua
    {
      "LostbBlizzard/lazysql.nvim",
      opts = {}, -- Use default configuration
      dependencies = {
        "MunifTanjim/nui.nvim",
      }
    },

    --------------------------------------------------------------------------------
    -- LSP (Language Server Protocol) support
    --------------------------------------------------------------------------------

    -- Code commenting
    {
      'numToStr/Comment.nvim',
      opts = {},
      lazy = false, -- Load on startup
    },

    -- LSP package manager
    {
      'williamboman/mason.nvim',
      config = function()
        require("mason").setup()
      end,
      run = ":MasonUpdate" -- Command to update Mason packages
    },

    -- Bridge between Mason and LSP config
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim'
      },
      config = function()
        require("mason-lspconfig").setup {
          ensure_installed = {
            -- Languages
            "lua_ls",        -- Lua
            "bashls",        -- Bash
            "pyright",       -- Python
            "clangd",        -- C/C++
            "ts_ls",         -- TypeScript
            "volar",         -- Vue
            "astro",         -- Astro
            "rust_analyzer", -- Rust
            "ltex",          -- LaTeX/Text
          }
        }
      end
    },

    -- Core LSP configuration
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        'williamboman/mason-lspconfig.nvim'
      }
    },

    -- LSP completion integration
    {
      "hrsh7th/cmp-nvim-lsp",
      dependencies = {
        "neovim/nvim-lspconfig"
      }
    },

    -- Code formatting
    {
      "stevearc/conform.nvim",
      opts = {},
      config = function()
        require("conform").setup({
          formatters_by_ft = {
            lua = { "stylua" },                                                -- Lua formatter
            python = { "isort", "black" },                                     -- Python formatters (imports, then code)
            rust = { "rustfmt", lsp_format = "fallback" },                     -- Rust formatter
            cpp = { "clang-format" },                                          -- C/C++ formatter
            javascript = { "prettierd", "prettier", stop_after_first = true }, -- JS formatters (faster version first)
          },
          format_on_save = {
            timeout_ms = 500,        -- Timeout for formatting
            lsp_format = "fallback", -- Use LSP formatting as fallback
          },
        })
      end
    },

    --------------------------------------------------------------------------------
    -- Debugging and language-specific tools
    --------------------------------------------------------------------------------

    -- Rust development tools
    {
      'simrat39/rust-tools.nvim',
      config = function()
        local rt = require("rust-tools")
        rt.setup({
          server = {
            on_attach = function(_, bufnr)
              -- Hover actions for documentation
              nvim.set_keymap("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
              -- Code action groups for refactoring
              nvim.set_keymap("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
            end,
          },
        })
      end
    },

    -- Debug Adapter Protocol core
    {
      "mfussenegger/nvim-dap",
      config = function()
        -- Standard debugging keymaps
        nvim.set_keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", {})                                               -- Start/continue debugging
        nvim.set_keymap("n", "<F9>", ":lua require'dap'.toggle_breakpoint()<CR>", {})                                      -- Toggle breakpoint
        nvim.set_keymap("n", "<C-F9>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {}) -- Conditional breakpoint
        nvim.set_keymap("n", "<F10>", ":lua require'dap'.step_over()<CR>", {})                                             -- Step over
        nvim.set_keymap("n", "<F11>", ":lua require'dap'.step_into()<CR>", {})                                             -- Step into
        nvim.set_keymap("n", "<C-F11>", ":lua require'dap'.step_out()<CR>", {})                                            -- Step out

        -- Uncomment to load debug configurations from separate file
        -- local debug = require("config.debug")
        -- debug.load_configs()
      end
    },

    -- Telescope integration for DAP
    {
      "nvim-telescope/telescope-dap.nvim",
      dependencies = {
        "mfussenegger/nvim-dap",
        "nvim-telescope/telescope.nvim"
      },
      config = function()
        require('telescope').load_extension('dap')

        -- Telescope DAP commands
        nvim.set_keymap("n", "<C-p><C-d><C-d>", ":Telescope dap commands<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-c>", ":Telescope dap configuration<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-b>", ":Telescope dap list_breakpoints<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-v>", ":Telescope dap variables<CR>", {})
        nvim.set_keymap("n", "<C-p><C-d><C-f>", ":Telescope dap frames<CR>", {})
      end
    },

    -- UI for debugging
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap"
      },
      config = function()
        nvim.set_keymap("n", "<C-p><C-d>", ":lua require'dapui'.toggle()<CR>", {}) -- Toggle debug UI
      end
    },

    -- Completion in debug windows
    {
      "rcarriga/cmp-dap",
      config = function()
        require("cmp").setup({
          enabled = function()
            -- Enable completion in normal buffers or DAP buffers
            return nvim.bo.buftype ~= "prompt"
                or require("cmp_dap").is_dap_buffer()
          end
        })

        -- Set up DAP-specific completion sources
        require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
          sources = {
            { name = "dap" }, -- Use DAP as completion source
          },
        })
      end
    },

    --------------------------------------------------------------------------------
    -- Completion system
    --------------------------------------------------------------------------------

    -- Completion sources
    "hrsh7th/cmp-buffer",  -- Buffer words
    "hrsh7th/cmp-path",    -- Filesystem paths
    "hrsh7th/cmp-cmdline", -- Command line

    -- Main completion engine
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
            -- Snippet engine configuration
            expand = function(args)
              require('luasnip').lsp_expand(args.body) -- Use LuaSnip
            end,
          },
          window = {
            -- Uncomment for bordered windows
            -- completion = cmp.config.window.bordered(),
            -- documentation = cmp.config.window.bordered(),
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),           -- Scroll docs up
            ['<C-f>'] = cmp.mapping.scroll_docs(4),            -- Scroll docs down
            ['<C-Space>'] = cmp.mapping.complete(),            -- Show completion suggestions
            ['<C-e>'] = cmp.mapping.abort(),                   -- Close completion window
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item
          }),
          sources = cmp.config.sources({
            -- Primary sources
            { name = 'nvim_lsp' }, -- LSP completions
            { name = 'luasnip' },  -- Snippets
          }, {
            -- Fallback sources
            { name = 'buffer' }, -- Current buffer text
          })
        })

        -- Git commit message completions
        cmp.setup.filetype('gitcommit', {
          sources = cmp.config.sources({
            { name = 'cmp_git' }, -- Git-specific completions
          }, {
            { name = 'buffer' },  -- Buffer text
          })
        })

        -- Search command completions (/ and ?)
        cmp.setup.cmdline({ '/', '?' }, {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' } -- Complete from buffer text
          }
        })

        -- Command line completions (:)
        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }    -- Filesystem paths
          }, {
            { name = 'cmdline' } -- Vim commands
          })
        })

        -- Configure LSP servers with completion capabilities
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        -- Set up each language server
        for _, lsp in ipairs({
          "lua_ls",        -- Lua
          "bashls",        -- Bash
          "pyright",       -- Python
          "ts_ls",         -- TypeScript
          "volar",         -- Vue
          "astro",         -- Astro
          "sourcekit",     -- Swift
          "rls",           -- Rust (legacy)
          "rust_analyzer", -- Rust (modern)
          "ltex",          -- LaTeX/Text
        }) do
          lspconfig[lsp].setup {
            capabilities = capabilities
          }
        end
      end
    },

    --------------------------------------------------------------------------------
    -- AI Assistance
    --------------------------------------------------------------------------------

    -- Aider AI coding assistant
    {
      "GeorgesAlkhouri/nvim-aider",
      cmd = "Aider", -- Load only when the Aider command is used
      keys = {
        -- Core functionality
        { "<leader>a/", "<cmd>Aider toggle<cr>",       desc = "Toggle Aider chat interface" },
        { "<leader>as", "<cmd>Aider send<cr>",         desc = "Send selection to Aider",         mode = { "n", "v" } },
        { "<leader>ac", "<cmd>Aider command<cr>",      desc = "Execute Aider commands" },
        { "<leader>ab", "<cmd>Aider buffer<cr>",       desc = "Send current buffer to Aider" },

        -- File management
        { "<leader>a+", "<cmd>Aider add<cr>",          desc = "Add file to Aider context" },
        { "<leader>a-", "<cmd>Aider drop<cr>",         desc = "Remove file from Aider context" },
        { "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "Add file as read-only reference" },

        -- File explorer integration
        { "<leader>a+", "<cmd>AiderTreeAddFile<cr>",   desc = "Add selected file to Aider",      ft = "NvimTree" },
        { "<leader>a-", "<cmd>AiderTreeDropFile<cr>",  desc = "Remove selected file from Aider", ft = "NvimTree" },
      },
      dependencies = {
        "folke/snacks.nvim",       -- Notifications
        "catppuccin/nvim",         -- Theme support
        "nvim-tree/nvim-tree.lua", -- File explorer integration

        -- Neo-tree integration (alternative file explorer)
        {
          "nvim-neo-tree/neo-tree.nvim",
          opts = function(_, opts)
            require("nvim_aider.neo_tree").setup(opts)
          end,
        },
      },
      config = true, -- Use default configuration
    },

    {
      'julwrites/llm-nvim',
      dir = "~/julwrites/llm-nvim",
      config = function()
        -- Configure the plugin
        require('llm').setup({
          model = 'gpt-4o',
          system_prompt = 'You are a helpful assistant.',
          -- debug = true
        })
      end
    }

  })
end

-- Export the Update function
return { update = Update }
