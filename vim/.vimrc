set nocompatible
filetype off

" let Vundle do its plugin management thing
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" plugins go here

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tmux-plugins/vim-tmux'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
call vundle#end()
filetype plugin indent on

" :PluginList	:PluginInstall	:PluginSearch foo	:PluginClean	:h
" END VUNDLE SECTION


" some setting I like
set relativenumber
set foldmethod=syntax

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
