set -g EDITOR vim
set -g MANPAGER "/bin/sh -c \"col -b | vim -c 'Goyo | set ft=man ts=8 nomod nolist nonu noma linebreak' -\""
#set -gx SBCL_HOME /usr/lib64/sbcl
#set -gx SBCL_SOURCE_ROOT /usr/lib64/sbcl/src

#set -U fish_greeting "🐟"
set -U fish_greeting ""

set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

#set -g __fish_git_prompt_color_branch magenta bold
set -g __fish_git_prompt_color_branch magenta 
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_char_stagedstate "●"
#set -g __fish_git_prompt_char_dirtystate "✚"
set -g __fish_git_prompt_char_dirtystate "+"
set -g __fish_git_prompt_char_untrackedfiles "…"
#set -g __fish_git_prompt_char_conflictedstate "✖"
set -g __fish_git_prompt_char_conflictedstate "x"
set -g __fish_git_prompt_char_cleanstate "✔"

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
#set -g __fish_git_prompt_color_cleanstate green bold
set -g __fish_git_prompt_color_cleanstate green

set -pgx PATH "$HOME/.cargo/bin"
set -agx PATH "$HOME/go/bin"
set -agx PATH "$HOME/.yarn/bin"

fish_vi_key_bindings

#alias firefox firefox-bin
#alias cat bat

#thefuck --alias | source
