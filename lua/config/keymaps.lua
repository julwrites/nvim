function Config() 
  local nvim = require "nvim" 

  -- Neovim config
  nvim.set_keymap("n", "<C-\\><C-v><C-e>", ":e $MYVIMRC<CR>", {}) -- Timestamp
  nvim.set_keymap("n", "<C-\\><C-v><C-s>", ":source $MYVIMRC<CR>", {}) -- Timestamp

  nvim.set_keymap("i", "<C-t><C-s>", "<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><Esc>", {}) -- Timestamp

end

return { config = Config }
