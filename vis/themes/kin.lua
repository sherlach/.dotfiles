-- based on solarized color codes Copyright (c) 2011 Ethan Schoonover
-- changed by sherlach 

local lexers = vis.lexers

local colors = {
  base02  = '#073642',
  base00  = '#657b83',
  black   = '#000000',
  yellow  = '#ffff33',
  orange  = '#cb4b16',
  red     = '#ff1111',
  magenta = '#d33682',
  purple  = '#6c71c4',
  violet  = '#b297f2',
  blue    = '#a6d0f2',
  teal    = '#2aa198',
  cyan    = '#33ffff',
  green   = '#00cc00',

  -- from https://coolors.co/21295c-1b3b6f-065a82-1c7293-9eb3c2
  space_cadet = '#21295c',
  dark_cornflour_blue = '#1b3b6f',
  blue_sapphire = '#065a82',
  cg_blue = '#1c7293',
  cadet_grey = '#9eb3c2',
}

lexers.colors = colors

local fg = ',fore:'..colors.purple..','
local bg = ',back:'..colors.black..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = 'fore:yellow'
lexers.STYLE_COMMENT = 'fore:'..colors.red
lexers.STYLE_CONSTANT = 'fore:'..colors.teal
lexers.STYLE_DEFINITION = 'fore:'..colors.blue
lexers.STYLE_ERROR = 'fore:'..colors.red..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.blue
lexers.STYLE_KEYWORD = 'fore:'..colors.yellow
lexers.STYLE_LABEL = 'fore:'..colors.yellow
lexers.STYLE_NUMBER = 'fore:'..colors.teal
lexers.STYLE_OPERATOR = 'fore:'..colors.yellow
lexers.STYLE_REGEX = 'fore:green'
lexers.STYLE_STRING = 'fore:'..colors.teal
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.orange
lexers.STYLE_TAG = 'fore:'..colors.red
lexers.STYLE_TYPE = 'fore:'..colors.yellow
lexers.STYLE_VARIABLE = 'fore:'..colors.blue
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = 'back:blue'
lexers.STYLE_IDENTIFIER = fg

lexers.STYLE_LINENUMBER = 'fore:'..colors.base00..',back:'..colors.base02
lexers.STYLE_LINENUMBER_CURSOR = 'back:'..colors.base00..',fore:'..colors.base02
lexers.STYLE_CURSOR = 'fore:'..colors.black..',back:'..colors.black
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',back:yellow'
lexers.STYLE_CURSOR_LINE = 'back:'..colors.base02
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base02
lexers.STYLE_SELECTION = 'back:white'
lexers.STYLE_STATUS = 'back:'..colors.base00..',fore:'..colors.base02
lexers.STYLE_STATUS_FOCUSED = ''
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''
