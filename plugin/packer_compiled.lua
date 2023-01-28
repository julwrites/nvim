-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = true
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/julian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/julian/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/julian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/julian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/julian/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["arshlib.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/arshlib.nvim",
    url = "https://github.com/arsham/arshlib.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-dap"] = {
    config = { "\27LJ\2\nò\1\0\0\4\0\b\0\0186\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\2\a\0\4\0X\0\bÄ6\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\2X\1\3Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\18is_dap_buffer\fcmp_dap\frequire\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim¿\1\1\0\6\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\6\0005\2\a\0005\3\t\0004\4\3\0005\5\b\0>\5\1\4=\4\n\3B\0\3\1K\0\1\0\fsources\1\0\0\1\0\1\tname\bdap\1\4\0\0\rdap-repl\18dapui_watches\16dapui_hover\rfiletype\fenabled\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/cmp-dap",
    url = "https://github.com/rcarriga/cmp-dap"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nç\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\15extensions\1\4\0\0\rfugitive\bfzf\15toggleterm\1\0\1\ntheme\rcodedark\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÓ\6\1\0\n\0/\0t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\0\0=\4\b\0039\4\t\0009\4\n\0049\4\v\0045\6\r\0009\a\t\0009\a\f\a)\t¸ˇB\a\2\2=\a\14\0069\a\t\0009\a\f\a)\t\4\0B\a\2\2=\a\15\0069\a\t\0009\a\16\aB\a\1\2=\a\17\0069\a\t\0009\a\18\aB\a\1\2=\a\19\0069\a\t\0009\a\20\a5\t\21\0B\a\2\2=\a\22\6B\4\2\2=\4\t\0039\4\23\0009\4\24\0044\6\3\0005\a\25\0>\a\1\0065\a\26\0>\a\2\0064\a\3\0005\b\27\0>\b\1\aB\4\3\2=\4\24\3B\1\2\0019\1\2\0009\1\28\1'\3\29\0005\4 \0009\5\23\0009\5\24\0054\a\3\0005\b\30\0>\b\1\a4\b\3\0005\t\31\0>\t\1\bB\5\3\2=\5\24\4B\1\3\0019\1\2\0009\1!\0015\3\"\0005\4#\0009\5\t\0009\5\n\0059\5!\5B\5\1\2=\5\t\0044\5\3\0005\6$\0>\6\1\5=\5\24\4B\1\3\0019\1\2\0009\1!\1'\3%\0005\4&\0009\5\t\0009\5\n\0059\5!\5B\5\1\2=\5\t\0049\5\23\0009\5\24\0054\a\3\0005\b'\0>\b\1\a4\b\3\0005\t(\0>\t\1\bB\5\3\2=\5\24\4B\1\3\0016\1\0\0'\3)\0B\1\2\0029\1*\1B\1\1\0026\2\0\0'\4+\0B\2\2\0029\2,\0029\2\2\0025\4-\0=\1.\4B\2\2\1K\0\1\0\17capabilities\1\0\0\16sumneko_lua\14lspconfig\25default_capabilities\17cmp_nvim_lsp\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-dap"] = {
    config = { "\27LJ\2\nù\4\0\0\6\0\18\00006\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\5\0'\4\6\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\15\0'\2\16\0B\0\2\0029\1\17\0B\1\1\1K\0\1\0\17load_configs\17config.debug\frequire%:lua require'dap'.step_out()<CR>\f<C-F11>&:lua require'dap'.step_into()<CR>\n<F11>&:lua require'dap'.step_over()<CR>\n<F10>Q:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>\v<C-F9>.:lua require'dap'.toggle_breakpoint()<CR>\t<F9>%:lua require'dap'.continue()<CR>\t<F5>\6n\15set_keymap\tnvim\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\ne\0\0\6\0\5\0\b6\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\1K\0\1\0%:lua require'dapui'.toggle()<CR>\15<C-p><C-d>\6n\15set_keymap\tnvim\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim.lua"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim.lua",
    url = "https://github.com/norcalli/nvim.lua"
  },
  ["onedark.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tload\fonedark\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nŒ\3\0\0\6\0\17\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\15\0'\4\16\0004\5\0\0B\0\5\1K\0\1\0\30:Telescope dap frames<CR>\20<C-p><C-d><C-f>!:Telescope dap variables<CR>\20<C-p><C-d><C-v>(:Telescope dap list_breakpoints<CR>\20<C-p><C-d><C-b>%:Telescope dap configuration<CR>\20<C-p><C-d><C-c> :Telescope dap commands<CR>\20<C-p><C-d><C-d>\6n\15set_keymap\tnvim\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nå\5\0\0\6\0\21\0@6\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\5\0'\4\6\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\17\0'\4\18\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\19\0'\4\20\0004\5\0\0B\0\5\1K\0\1\0\27:Telescope keymaps<CR>\15<C-p><C-k>\28:Telescope oldfiles<CR>\15<C-p><C-m>\27:Telescope buffers<CR>\15<C-p><C-b>\19:Telescope<CR>\n<C-p>(:Telescope find_files theme=ivy<CR>\15<C-p><C-f>+:Telescope commands theme=dropdown<CR>\15<C-p><C-p>':Telescope live_grep theme=ivy<CR>\15<C-f><C-g>(:Telescope treesitter theme=ivy<CR>\15<C-f><C-f>7:Telescope current_buffer_fuzzy_find theme=ivy<CR>\n<C-f>\6n\15set_keymap\tnvim\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggletasks.nvim"] = {
    config = { "\27LJ\2\n‘\2\0\0\6\0\14\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\0016\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\0016\0\5\0009\0\6\0'\2\a\0'\3\n\0'\4\v\0004\5\0\0B\0\5\0016\0\5\0009\0\6\0'\2\a\0'\3\f\0'\4\r\0004\5\0\0B\0\5\1K\0\1\0$:Telescope toggletasks edit<CR>\15<C-t><C-e>%:Telescope toggletasks spawn<CR>\15<C-t><C-s>&:Telescope toggletasks select<CR>\15<C-t><C-t>\6n\15set_keymap\tnvim\19load_extension\14telescope\nsetup\16toggletasks\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/toggletasks.nvim",
    url = "https://github.com/jedrzejboczar/toggletasks.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\ní\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\20insert_mappings\2\17open_mapping\n<C-t>\20start_in_insert\2\14autochdir\2\22terminal_mappings\2\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  vimwiki = {
    config = { "\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\3\bext\b.md\tpath\29~/julwrites/wiki/vimwiki\vsyntax\rmarkdown\17vimwiki_list\6g\tnvim\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/vimwiki",
    url = "https://github.com/vimwiki/vimwiki"
  },
  ["wmgraphviz.vim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/wmgraphviz.vim",
    url = "https://github.com/wannesm/wmgraphviz.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\3\bext\b.md\tpath\29~/julwrites/wiki/vimwiki\vsyntax\rmarkdown\17vimwiki_list\6g\tnvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nç\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\15extensions\1\4\0\0\rfugitive\bfzf\15toggleterm\1\0\1\ntheme\rcodedark\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
try_loadstring("\27LJ\2\nŒ\3\0\0\6\0\17\0*6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\4\0009\0\5\0'\2\6\0'\3\15\0'\4\16\0004\5\0\0B\0\5\1K\0\1\0\30:Telescope dap frames<CR>\20<C-p><C-d><C-f>!:Telescope dap variables<CR>\20<C-p><C-d><C-v>(:Telescope dap list_breakpoints<CR>\20<C-p><C-d><C-b>%:Telescope dap configuration<CR>\20<C-p><C-d><C-c> :Telescope dap commands<CR>\20<C-p><C-d><C-d>\6n\15set_keymap\tnvim\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time([[Config for telescope-dap.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\ní\1\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\5\20insert_mappings\2\17open_mapping\n<C-t>\20start_in_insert\2\14autochdir\2\22terminal_mappings\2\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tload\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: cmp-dap
time([[Config for cmp-dap]], true)
try_loadstring("\27LJ\2\nò\1\0\0\4\0\b\0\0186\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0B\0\3\2\a\0\4\0X\0\bÄ6\0\5\0'\2\6\0B\0\2\0029\0\a\0B\0\1\2X\1\3Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\18is_dap_buffer\fcmp_dap\frequire\vprompt\fbuftype\24nvim_buf_get_option\bapi\bvim¿\1\1\0\6\0\v\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0009\0\6\0005\2\a\0005\3\t\0004\4\3\0005\5\b\0>\5\1\4=\4\n\3B\0\3\1K\0\1\0\fsources\1\0\0\1\0\1\tname\bdap\1\4\0\0\rdap-repl\18dapui_watches\16dapui_hover\rfiletype\fenabled\1\0\0\0\nsetup\bcmp\frequire\0", "config", "cmp-dap")
time([[Config for cmp-dap]], false)
-- Config for: nvim-dap-ui
time([[Config for nvim-dap-ui]], true)
try_loadstring("\27LJ\2\ne\0\0\6\0\5\0\b6\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\1K\0\1\0%:lua require'dapui'.toggle()<CR>\15<C-p><C-d>\6n\15set_keymap\tnvim\0", "config", "nvim-dap-ui")
time([[Config for nvim-dap-ui]], false)
-- Config for: toggletasks.nvim
time([[Config for toggletasks.nvim]], true)
try_loadstring("\27LJ\2\n‘\2\0\0\6\0\14\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\1\0B\0\2\0016\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\0016\0\5\0009\0\6\0'\2\a\0'\3\n\0'\4\v\0004\5\0\0B\0\5\0016\0\5\0009\0\6\0'\2\a\0'\3\f\0'\4\r\0004\5\0\0B\0\5\1K\0\1\0$:Telescope toggletasks edit<CR>\15<C-t><C-e>%:Telescope toggletasks spawn<CR>\15<C-t><C-s>&:Telescope toggletasks select<CR>\15<C-t><C-t>\6n\15set_keymap\tnvim\19load_extension\14telescope\nsetup\16toggletasks\frequire\0", "config", "toggletasks.nvim")
time([[Config for toggletasks.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nå\5\0\0\6\0\21\0@6\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\5\0'\4\6\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\17\0'\4\18\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\19\0'\4\20\0004\5\0\0B\0\5\1K\0\1\0\27:Telescope keymaps<CR>\15<C-p><C-k>\28:Telescope oldfiles<CR>\15<C-p><C-m>\27:Telescope buffers<CR>\15<C-p><C-b>\19:Telescope<CR>\n<C-p>(:Telescope find_files theme=ivy<CR>\15<C-p><C-f>+:Telescope commands theme=dropdown<CR>\15<C-p><C-p>':Telescope live_grep theme=ivy<CR>\15<C-f><C-g>(:Telescope treesitter theme=ivy<CR>\15<C-f><C-f>7:Telescope current_buffer_fuzzy_find theme=ivy<CR>\n<C-f>\6n\15set_keymap\tnvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-dap
time([[Config for nvim-dap]], true)
try_loadstring("\27LJ\2\nù\4\0\0\6\0\18\00006\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\5\0'\4\6\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\15\0'\2\16\0B\0\2\0029\1\17\0B\1\1\1K\0\1\0\17load_configs\17config.debug\frequire%:lua require'dap'.step_out()<CR>\f<C-F11>&:lua require'dap'.step_into()<CR>\n<F11>&:lua require'dap'.step_over()<CR>\n<F10>Q:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>\v<C-F9>.:lua require'dap'.toggle_breakpoint()<CR>\t<F9>%:lua require'dap'.continue()<CR>\t<F5>\6n\15set_keymap\tnvim\0", "config", "nvim-dap")
time([[Config for nvim-dap]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireÓ\6\1\0\n\0/\0t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\6\0005\4\4\0003\5\3\0=\5\5\4=\4\a\0034\4\0\0=\4\b\0039\4\t\0009\4\n\0049\4\v\0045\6\r\0009\a\t\0009\a\f\a)\t¸ˇB\a\2\2=\a\14\0069\a\t\0009\a\f\a)\t\4\0B\a\2\2=\a\15\0069\a\t\0009\a\16\aB\a\1\2=\a\17\0069\a\t\0009\a\18\aB\a\1\2=\a\19\0069\a\t\0009\a\20\a5\t\21\0B\a\2\2=\a\22\6B\4\2\2=\4\t\0039\4\23\0009\4\24\0044\6\3\0005\a\25\0>\a\1\0065\a\26\0>\a\2\0064\a\3\0005\b\27\0>\b\1\aB\4\3\2=\4\24\3B\1\2\0019\1\2\0009\1\28\1'\3\29\0005\4 \0009\5\23\0009\5\24\0054\a\3\0005\b\30\0>\b\1\a4\b\3\0005\t\31\0>\t\1\bB\5\3\2=\5\24\4B\1\3\0019\1\2\0009\1!\0015\3\"\0005\4#\0009\5\t\0009\5\n\0059\5!\5B\5\1\2=\5\t\0044\5\3\0005\6$\0>\6\1\5=\5\24\4B\1\3\0019\1\2\0009\1!\1'\3%\0005\4&\0009\5\t\0009\5\n\0059\5!\5B\5\1\2=\5\t\0049\5\23\0009\5\24\0054\a\3\0005\b'\0>\b\1\a4\b\3\0005\t(\0>\t\1\bB\5\3\2=\5\24\4B\1\3\0016\1\0\0'\3)\0B\1\2\0029\1*\1B\1\1\0026\2\0\0'\4+\0B\2\2\0029\2,\0029\2\2\0025\4-\0=\1.\4B\2\2\1K\0\1\0\17capabilities\1\0\0\16sumneko_lua\14lspconfig\25default_capabilities\17cmp_nvim_lsp\1\0\1\tname\fcmdline\1\0\1\tname\tpath\1\0\0\6:\1\0\1\tname\vbuffer\1\0\0\1\3\0\0\6/\6?\fcmdline\1\0\0\1\0\1\tname\vbuffer\1\0\1\tname\fcmp_git\14gitcommit\rfiletype\1\0\1\tname\vbuffer\1\0\1\tname\fluasnip\1\0\1\tname\rnvim_lsp\fsources\vconfig\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\vwindow\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\bcmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
