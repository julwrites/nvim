nvim = require "nvim" 

function update() 

  nvim.set_keymap("n", "<C-t><C-s>", "a<C-R>=strftime('%Y-%m-%d %a %I:%M %p')<CR><Esc>", {}) -- Timestamp

end

return { update = update }
