set -U EDITOR vise
set -U --erase fish_greeting

set -agx PATH "$HOME/go/bin"

fish_vi_key_bindings



thefuck --alias | source
