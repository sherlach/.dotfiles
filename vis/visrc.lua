-- IDEAS + TODO

-- # crosshair:
-- when toggled ON: 
--  subscribe to "INPUT" <- won't work bc input doesn't work in normal mode
--  turn on cursorline
-- when toggled OFF:
--  unsubscribe from "INPUT"
--  turn off cursorline

-- ^ input subscription:
-- find cursor position (column)
-- turn on cc at the cursor column position

-- # better (tab) autocompletion
-- 

-- # better git integration (consider use of pipe function)

-- # how does info bar even work

-- #blinking cursor being more cool

-- # can we make TODO and XXX auto-highlight and blink, universally??

-- workaround lack of native code folding support by having a keybinding that
-- opens up a window/buffer with (Lua parsed?) functions and variables in it
-- selection a function/variable skips you there in the original buffer. like
-- a navigateable "mini map"

require('vis')

-- {{{ redundant?
local vis = vis
local io = io
--}}}

--allows for getting rid of the vis and instead just calling stuff without . . : (deleting
--until I understand how it works
-- from https://github.com/martanne/vis/pull/872
--local _ENV = setmetatable({}, {__index = function(t,k) return _ENV[k] or vis.events[k] or vis.modes[k] or function(...) return vis[k](vis, ...) end end })

vis.events.subscribe(vis.events.INIT, function()
  require('plugins/vis-cursors')

  -- emulate my vim leaderkey functions
  -- quick write
  vis:command('map! normal " w" ":w<Enter>"')

  -- yank to system clipboard
  vis:command('map! visual <Space>y \"+y')

  vis:command('map! normal " <Enter>" ":set show-newlines!<Enter>"')
  vis:command('map! normal "  " ":set show-space!<Enter>"')
  vis:command('map! normal " <Tab>" ":set show-tabs!<Enter>"')

end)
  
-- enable/disable bracketed paste
vis.events.subscribe(vis.events.START, function() io.stdout:write("\x1b[?2004h"); io.stdout:flush() end)
vis.events.subscribe(vis.events.QUIT, function() io.stdout:write("\x1b[?2004l"); io.stdout:flush() end)

-- processing of bracketed pastes
vis.events.subscribe(vis.events.TERM_CSI, function(cmd, arg)
  if (cmd == 126) then
    if (arg == 200) then
      vis:command('set ai off')
      --vis:command 'set expandtab off'
      vis.mode = vis.modes.INSERT
    elseif (arg == 201) then
      vis:command('set ai')
      --vis:command 'set expandtab'
    end
  end
end)


vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  vis:command('set theme kin')

  -- Nice Line Numbering
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

--vis:option_register("crosshair", "bool", function() 
--end, "Creates crosshair highlight around primary cursor position")

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


