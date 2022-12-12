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
  ["arshlib.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/arshlib.nvim",
    url = "https://github.com/arsham/arshlib.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-terminal"] = {
    config = { "\27LJ\2\n¯\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\0016\0\0\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\1K\0\1\0+:lua NTGlobal['terminal']:toggle()<CR>\n<C-t>\6n\15set_keymap\nsetup\18nvim-terminal\frequire\vhidden\6o\tnvim\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-terminal",
    url = "https://github.com/s1n7ax/nvim-terminal"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
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
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÎ\4\0\0\6\0\19\00096\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\5\0'\4\6\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0\28:Telescope oldfiles<CR>\15<C-p><C-m>\27:Telescope buffers<CR>\15<C-p><C-b>\19:Telescope<CR>\n<C-p>(:Telescope find_files theme=ivy<CR>\15<C-p><C-f>+:Telescope commands theme=dropdown<CR>\15<C-p><C-p>':Telescope live_grep theme=ivy<CR>\15<C-f><C-g>(:Telescope treesitter theme=ivy<CR>\15<C-f><C-f>7:Telescope current_buffer_fuzzy_find theme=ivy<CR>\n<C-f>\6n\15set_keymap\tnvim\0" },
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/Users/julian/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
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
    config = { "\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\3\bext\b.md\vsyntax\rmarkdown\tpath\29~/julwrites/wiki/vimwiki\17vimwiki_list\6g\tnvim\0" },
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
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\tload\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: vimwiki
time([[Config for vimwiki]], true)
try_loadstring("\27LJ\2\np\0\0\3\0\4\0\a6\0\0\0009\0\1\0004\1\3\0005\2\3\0>\2\1\1=\1\2\0K\0\1\0\1\0\3\bext\b.md\vsyntax\rmarkdown\tpath\29~/julwrites/wiki/vimwiki\17vimwiki_list\6g\tnvim\0", "config", "vimwiki")
time([[Config for vimwiki]], false)
-- Config for: nvim-terminal
time([[Config for nvim-terminal]], true)
try_loadstring("\27LJ\2\n¯\1\0\0\6\0\n\0\0176\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0B\0\1\0016\0\0\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0004\5\0\0B\0\5\1K\0\1\0+:lua NTGlobal['terminal']:toggle()<CR>\n<C-t>\6n\15set_keymap\nsetup\18nvim-terminal\frequire\vhidden\6o\tnvim\0", "config", "nvim-terminal")
time([[Config for nvim-terminal]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÎ\4\0\0\6\0\19\00096\0\0\0009\0\1\0'\2\2\0'\3\3\0'\4\4\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\5\0'\4\6\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\a\0'\4\b\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\t\0'\4\n\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\v\0'\4\f\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\r\0'\4\14\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\15\0'\4\16\0004\5\0\0B\0\5\0016\0\0\0009\0\1\0'\2\2\0'\3\17\0'\4\18\0004\5\0\0B\0\5\1K\0\1\0\28:Telescope oldfiles<CR>\15<C-p><C-m>\27:Telescope buffers<CR>\15<C-p><C-b>\19:Telescope<CR>\n<C-p>(:Telescope find_files theme=ivy<CR>\15<C-p><C-f>+:Telescope commands theme=dropdown<CR>\15<C-p><C-p>':Telescope live_grep theme=ivy<CR>\15<C-f><C-g>(:Telescope treesitter theme=ivy<CR>\15<C-f><C-f>7:Telescope current_buffer_fuzzy_find theme=ivy<CR>\n<C-f>\6n\15set_keymap\tnvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)

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
