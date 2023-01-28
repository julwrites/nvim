nvim = require "nvim" 

function config() 

  -- Neovim config
  nvim.set_keymap("n", "<C-\\><C-v><C-e>", ":e $MYVIMRC<CR>", {}) -- Timestamp
  nvim.set_keymap("n", "<C-\\><C-v><C-s>", ":source $MYVIMRC<CR>", {}) -- Timestamp

  nvim.set_keymap("n", "<C-t><C-s>", "a<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><Esc>", {}) -- Timestamp

end

return { config = config }
