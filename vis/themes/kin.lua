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
  navy    = '#000080',
  teal    = '#2aa198',
  cyan    = '#33ffff',
  green   = '#00cc00',

  -- from https://coolors.co/21295c-1b3b6f-065a82-1c7293-9eb3c2
  space_cadet = '#21295c',
  dark_cornflour_blue = '#1b3b6f',
  blue_sapphire = '#065a82',
  cg_blue = '#1c7293',
  cadet_grey = '#9eb3c2',

  -- https://coolors.co/7f8999-bacbe8-03368f-7790ba-628bd1
  roman_silver = '#7f8999',
  light_steel_blue = '#bacbe8',
  shadow_blue = '#7790ba',
  un_blue = '#628bd1'

}

lexers.colors = colors
lexers.STYLE_DEFAULT = 'fore:'..colors.cadet_grey..',back:'..colors.black
lexers.STYLE_NOTHING = 'back:'..colors.black
lexers.STYLE_CLASS = 'fore:'..colors.light_steel_blue
lexers.STYLE_COMMENT = 'fore:'..colors.cg_blue
lexers.STYLE_CONSTANT = 'fore:'..colors.teal
lexers.STYLE_DEFINITION = 'fore:'..colors.blue
lexers.STYLE_ERROR = 'fore:'..colors.red..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.blue
lexers.STYLE_KEYWORD = 'fore:'..colors.roman_silver -- change this colour i think
lexers.STYLE_LABEL = 'fore:'..colors.un_blue
lexers.STYLE_NUMBER = 'fore:'..colors.orange
lexers.STYLE_OPERATOR = 'fore:'..colors.space_cadet
lexers.STYLE_REGEX = 'fore:'..colors.green
lexers.STYLE_STRING = 'fore:'..colors.shadow_blue
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.violet
lexers.STYLE_TAG = 'fore:'..colors.red
lexers.STYLE_TYPE = 'fore:'..colors.yellow
lexers.STYLE_VARIABLE = 'fore:'..colors.blue
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = 'back:'..colors.blue
lexers.STYLE_IDENTIFIER = 'fore:'..colors.cadet_grey

lexers.STYLE_LINENUMBER = 'fore:'..colors.base00..',back:'..colors.base02
lexers.STYLE_LINENUMBER_CURSOR = lexers.STYLE_LINENUMBER..',reverse'
lexers.STYLE_CURSOR = 'fore:'..colors.black..',back:white'
lexers.STYLE_CURSOR_PRIMARY = 'fore:'..colors.black..',back:'..colors.yellow
lexers.STYLE_CURSOR_LINE = 'fore:'..colors.black..',back:'..colors.red
lexers.STYLE_COLOR_COLUMN = lexers.STYLE_CURSOR_LINE
lexers.STYLE_SELECTION = 'back:white'
lexers.STYLE_STATUS = 'back:'..colors.base00..',fore:'..colors.base02
lexers.STYLE_STATUS_FOCUSED = ''
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = lexers.STYLE_DEFAULT..',bold' --'fore:default,back:default,bold'
lexers.STYLE_EOF = 'fore:'..colors.navy