-- IDEAS + TODO

-- workaround lack of native code folding support by having a keybinding that
-- opens up a window/buffer with (Lua parsed?) functions and variables in it
-- selection a function/variable skips you there in the original buffer. like
-- a navigateable "mini map"

-- crosshair?

-- fix autopaste

-- better (tab) autocompletion

-- better git integration (consider use of pipe function)

-- how does info bar even work

-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
  -- plugin manager
  local plug = require('plugins/vis-plug')

  plug.set_path('~/.config/vis')

  -- configure plugins in an array of tables
  local plugins = {
  --{ url = 'kiwec/vis-citron', theme = true },
  { url = 'erf/vis-cursors' },
  }
  -- require and optionally install plugins on init
  plug.init(plugins, true)

  -- emulate my vim leaderkey functions
  -- quick write
  vis:command('map! normal " w" ":w<Enter>"')

  -- yank to system clipboard
  vis:command('map! visual <Space>y \"+y')

  vis:command('map! normal " <Enter>" ":set show-newlines!<Enter>"')
  vis:command('map! normal "  " ":set show-space!<Enter>"')
  vis:command('map! normal " <Tab>" ":set show-tabs!<Enter>"')


  -- attempt to emulate paste mode (set ai off when pasting,
  -- turn it back on after paste done)
  vis:command('map! insert "<Esc>[200~" ":set ai on<Enter>"')
  vis:command('map! insert "<Esc>[201~" ":set ai off<Enter>"')
end)
  

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  vis:command('set theme kin')

  -- Nice Line Numbering (TM)
  vis:command('set number')
  vis:command('set relativenumber')

  -- Better Tabbing
  vis:command('set autoindent on')
  vis:command('set tabwidth 2')
  vis:command('set expandtab')
  vis:command('set show-tabs on')

  -- Consider colorcolumn at the "longest line width" eg. 60
end)

vis.events.subscribe(vis.events.FILE_SAVE_POST, function()
  vis:info("Saved " .. vis.win.file.name .. " (" .. vis.win.file.size .. " B)")
end)

vis:command_register("W", function()
    -- Based on: https://gist.github.com/abaez/191397143c72ab7622e1812f6d887336
    local file = vis.win.file
    vis:command((", > sudo tee %s"):format(file.name))

    vis.events.emit(vis.events.FILE_SAVE_PRE, function(...)
        return true
    end)
    vis.events.emit(vis.events.FILE_SAVE_POST, function(...)
        file.modified = false
    end)
end, "Write file with sudo tee")
