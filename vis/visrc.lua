-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  -- Nice Line Numbering (TM)
	vis:command('set number')
  vis:command('set relativenumber')

  -- Better Tabbing
  vis:command('set autoindent on')
  vis:command('set tabwidth 2')
  vis:command('set expandtab')

end)
