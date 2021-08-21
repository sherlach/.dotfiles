set nocompatible
filetype off
syntax on

" let Vundle do its plugin management thing
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugins go here

"Plugin 'christoomey/vim-tmux-navigator'
"Plugin 'tmux-plugins/vim-tmux-focus-events'
"Plugin 'tmux-plugins/vim-tmux'

Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/goyo.vim'
Plugin 'anekos/runes-vim'
Plugin 'axvr/org.vim' " quick editing of org files
Plugin 'jremmen/vim-ripgrep'
call vundle#end()
filetype plugin indent on

" :PluginList	:PluginInstall	:PluginSearch foo	:PluginClean	:h
" END VUNDLE SECTION


" some settings I like
set number relativenumber
set foldmethod=syntax
set ic
set expandtab 
set tabstop=2 shiftwidth=2

set wildmode=longest,list,full

" LEADER BINDINGS
let mapleader = " " " space is a far nicer leader
set timeoutlen=750 " shorten that timeout

" goyo command is <leader>g
" g for goyo
map <leader>g :Goyo \| set linebreak<CR>

" spellcheck is <leader>s
" s for spellcheck
map <leader>s :setlocal spell! <CR> 
"spelllang*en<CR>

" toggle paste setting with <leader>v
" v because alt-v is terminal paste
"set pastetoggle=<leader>v

" faster save with <leader>w
" w for :w
map <leader>w :w!<CR>

" cursor crosshair highlighting
" c for crosshair
:hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
:hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" splits open at bottom and right
set splitbelow splitright


" convenient brace remappings
inoremap 	{	{}<Left>
inoremap 	{<CR>	{<CR>}<Esc>O
inoremap 	{{	{
inoremap 	{}	{}

" convenient bracket remappings
inoremap 	(	()<Left>
inoremap <expr>	)	strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>": ")"

" replicate thus mappings for square braces
inoremap	[	[]<Left>
inoremap <expr>	]	strpart(getline('.'), col('.')-1, 1) == "]" ? "\<Right>" : "]"

let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

" finally, this very sneaky little function to automatically turn on paste
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
