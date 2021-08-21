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

" consider let mapleader = " "
set wildmode=longest,list,full

" LEADER BINDINGS

" set better leaderkey
let mapleader = " " 

" goyo command is <leader>g
" g for goyo
map <leader>g :Goyo \| set linebreak<CR>

" spellcheck is <leader>s
" s for spellcheck
map <leader>s :setlocal spell! <CR> 
"spelllang*en<CR>

" toggle paste setting with <leader>v
" v because alt-v is terminal paste
set pastetoggle=<leader>v

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
