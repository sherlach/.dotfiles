-- created by sherlach (https://github.com/sherlach)

local lexers = vis.lexers

local colors = {
  ['base00']  = '#657b83',
  ['base01']  = '#000000',
  ['base02']  = '#073642',
  ['base03']  = '#ffff33',
  ['base04']  = '#cb4b16',
  ['base05']  = '#ff1111',
  ['base06']  = '#6c71c4',
  ['base07']  = '#a6d0f2',
  ['base08']  = '#2aa198',
  ['base09']  = '#00cc00',
}

lexers.colors = colors

local fg = ',fore:'..colors.base06..','
local bg = ',back:'..colors.base01..','

lexers.STYLE_DEFAULT = bg..fg
lexers.STYLE_NOTHING = bg
lexers.STYLE_CLASS = 'fore:base03'
lexers.STYLE_COMMENT = 'fore:'..colors.base05
lexers.STYLE_CONSTANT = 'fore:'..colors.base08
lexers.STYLE_DEFINITION = 'fore:'..colors.base07
lexers.STYLE_ERROR = 'fore:'..colors.base05..',italics'
lexers.STYLE_FUNCTION = 'fore:'..colors.base07
lexers.STYLE_KEYWORD = 'fore:'..colors.base03
lexers.STYLE_LABEL = 'fore:'..colors.base03
lexers.STYLE_NUMBER = 'fore:'..colors.base08
lexers.STYLE_OPERATOR = 'fore:'..colors.base03
lexers.STYLE_REGEX = 'fore:base09'
lexers.STYLE_STRING = 'fore:'..colors.base08
lexers.STYLE_PREPROCESSOR = 'fore:'..colors.base04
lexers.STYLE_TAG = 'fore:'..colors.base05
lexers.STYLE_TYPE = 'fore:'..colors.base03
lexers.STYLE_VARIABLE = 'fore:'..colors.base07
lexers.STYLE_WHITESPACE = ''
lexers.STYLE_EMBEDDED = 'back:base07'
lexers.STYLE_IDENTIFIER = fg

lexers.STYLE_LINENUMBER = 'fore:'..colors.base00..',back:'..colors.base02
lexers.STYLE_LINENUMBER_CURSOR = 'back:'..colors.base00..',fore:'..colors.base02
lexers.STYLE_CURSOR = 'fore:'..colors.base01..',back:white'
lexers.STYLE_CURSOR_PRIMARY = lexers.STYLE_CURSOR..',back:base03'
lexers.STYLE_CURSOR_LINE = 'back:'..colors.base02
lexers.STYLE_COLOR_COLUMN = 'back:'..colors.base02
lexers.STYLE_SELECTION = 'back:white'
lexers.STYLE_STATUS = 'back:'..colors.base00..',fore:'..colors.base02
lexers.STYLE_STATUS_FOCUSED = ''
lexers.STYLE_SEPARATOR = lexers.STYLE_DEFAULT
lexers.STYLE_INFO = 'fore:default,back:default,bold'
lexers.STYLE_EOF = ''
