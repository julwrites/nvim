nvim = require "nvim" -- Ignore warning here, better to define once for the whole file than set it locally in every single config function

function Update()
  -- Lazy.nvim
  require("lazy").setup({
    { "navarasu/onedark.nvim",
        config = function() require("onedark").load() end
    },
    "norcalli/nvim.lua", -- Lua functions for nvim
    "nvim-lua/plenary.nvim", -- Lua functions, very useful for a lot of lua-based plugins
    "MunifTanjim/nui.nvim", -- UI for Neovim
    { "arsham/arshlib.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim"
      }
    }, -- Functions for Neovim

    --------------------------------------------------------------------------------
    -- Interface packages
    --------------------------------------------------------------------------------
    "ryanoasis/vim-devicons", -- Icons for file interaction
    { "navarasu/onedark.nvim",
      config = function() require("onedark").load() end
    },

    "nvim-tree/nvim-web-devicons",

    { "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
        "nvim-tree/nvim-web-devicons",
      },
      config = function()
        require("nvim-tree").setup {
          view = {
            width = 100,
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

    { "nvim-lualine/lualine.nvim",
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

    { "ibhagwan/fzf-lua",
      -- optional for icon support
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
      end
    },

    { "nvim-telescope/telescope.nvim",
      config = function()
        -- Chords (Ivy)
        nvim.set_keymap("n", "<C-f><C-f>", ":Telescope current_buffer_fuzzy_find theme=ivy<CR>", {})
        nvim.set_keymap("n", "<C-f><C-g>", ":Telescope live_grep theme=ivy<CR>", {})
        nvim.set_keymap("n", "<C-p><C-f>", ":Telescope find_files theme=ivy<CR>", {})
        nvim.set_keymap("n", "<C-p><C-g>", ":Telescope git_files theme=ivy<CR>", {})
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
    }, -- Fuzzy finder
    { "nvim-telescope/telescope-media-files.nvim",
      config = function()
        require('telescope').load_extension('media_files')
        require'telescope'.setup {
          extensions = {
            media_files = {
              -- filetypes whitelist
              -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
              filetypes = {"png", "webp", "jpg", "jpeg"},
              -- find command (defaults to `fd`)
              find_cmd = "rg"
            }
          },
        }
      end
    },
    { "nvim-treesitter/nvim-treesitter",
      config = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()

        require("nvim-treesitter.configs").setup({
          ensure_installed = { "markdown", "markdown_inline" },
          highlight = {
            enable = true,
            additional_vim_regex_highlighting = { "markdown" },
          },
        })
      end,
    },
    "BurntSushi/ripgrep", -- Regex search

    --------------------------------------------------------------------------------
    -- Utility packages
    --------------------------------------------------------------------------------

    { "akinsho/toggleterm.nvim",
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
    { "jedrzejboczar/toggletasks.nvim",
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

    -- Misc Tools
    -- { "renerocksai/telekasten.nvim",
    --   dependencies = {'nvim-telescope/telescope.nvim'},
    --   config = function()
    --     require('telekasten').setup({
    --       home = vim.fn.expand("~/julwrites/wiki"),
    --     })
    --     nvim.set_keymap("n", "<C-p><C-w>", ":Telekasten panel<CR>", {})
    --     nvim.set_keymap("n", "<C-w><C-w>", ":Telekasten find_notes<CR>", {})
    --     nvim.set_keymap("n", "<C-w><C-f>", ":Telekasten follow_link<CR>", {})
    --     nvim.set_keymap("n", "<C-w><C-b>", ":Telekasten show_backlinks<CR>", {})

    --     vim.cmd("hi tkLink ctermfg=green cterm=bold,underline guifg=green gui=bold,underline")
    --     vim.cmd("hi tkBrackets ctermfg=gray guifg=gray")
    --     vim.cmd("hi tkTagSep ctermfg=gray guifg=gray")
    --     vim.cmd("hi tkTag ctermfg=175 guifg=#d3869B")
    --   end
    -- },
    { "vimwiki/vimwiki",
      init = function()
        nvim.g.vimwiki_list = {{
          path = "~/julwrites/wiki",
          syntax = "markdown",
          ext = ".md"
        }}
        nvim.g.vimwiki_global_ext = 0
        nvim.set_keymap("n", "<BS>", ":VimwikiGoBacklink<CR>", {})
        nvim.set_keymap("n", "<Leader>ww", ":VimwikiIndex<CR>", {})
        nvim.set_keymap("n", "<Leader>bb", ":VimwikiBacklinks<CR>", {})
        nvim.set_keymap("n", "<Leader>tt", ":VimwikiTable<CR>", {})
        nvim.set_keymap("n", "<Leader>lt", ":VimwikiToggleListItem<CR>", {})
        nvim.set_keymap("n", "<Leader>lr", ":VimwikiToggleRejectedListItem<CR>", {})
      end
    },
    "wannesm/wmgraphviz.vim", -- Graphviz
    "godlygeek/tabular", 
    -- "preservim/vim-markdown", -- Markdown

    { "sindrets/diffview.nvim",
      dependencies = { "nvim-lua/plenary.nvim" }
    }, -- Difftool

    "lervag/vimtex", -- LaTeX

    --------------------------------------------------------------------------------
    -- Software Development packages
    --------------------------------------------------------------------------------

    -- Git
    "tpope/vim-fugitive", -- Git manipulation
    "tpope/vim-surround", -- Use `S<?>` to surround a visual selection with `<?>`
    "tpope/vim-commentary", -- Manipulate comments

    -- LSP

    "neovim/nvim-lspconfig",
    { "hrsh7th/cmp-nvim-lsp",
      dependencies = {
        "neovim/nvim-lspconfig"
      }
    },

    { 'williamboman/mason.nvim',
      config = function()
        require("mason").setup()
      end,
      run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    { 'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim'
      },
      config = function()
        require("mason-lspconfig").setup {
          ensure_installed = {
            "lua_ls",
            "bashls",
            "pyright",
            "tsserver",
            "volar",
            "astro",
            "rust_analyzer",
            "ltex",
          }
        }
      end
    },

    -- Debug Adaptor Protocol
    { 'simrat39/rust-tools.nvim',
      config = function()
        local rt = require("rust-tools")
        rt.setup( {
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

    { "mfussenegger/nvim-dap",
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
    { "nvim-telescope/telescope-dap.nvim",
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
    { "rcarriga/nvim-dap-ui",
      dependencies = {
        "mfussenegger/nvim-dap"
      },
      config = function()
        nvim.set_keymap("n", "<C-p><C-d>", ":lua require'dapui'.toggle()<CR>", {})
      end
    },
    { "rcarriga/cmp-dap",
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

    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",

    -- Completion
    { "hrsh7th/nvim-cmp",
      dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline"
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

    { "Exafunction/codeium.vim",
      config = function ()
        nvim.g.codeium_enabled = 0
        vim.keymap.set("i", "<C-y>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
        vim.keymap.set("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
        vim.keymap.set("i", "<C-:>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
        vim.keymap.set("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
      end
    },
  }
  )
end

return { update = Update }
