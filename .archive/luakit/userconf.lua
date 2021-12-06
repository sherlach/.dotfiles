-- userconf.lua

local modes = require "modes"


modes.remap_binds("normal", {
  { "<Control-o>", "O", false},
}) 

modes.add_binds("normal", {
  { "<Control-C>", "Copy selected text.", function() 
    luakit.selection.clipboard = luakit.selection.primary
  end},

  { "O", "Open URL in new tab.", function(w) 
    w:enter_cmd(":tabopen ")
  end},
})
