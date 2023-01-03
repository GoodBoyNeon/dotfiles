if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
    starship init fish | source
end

set fish_greeting

set EDITOR "/usr/bin/nvim"

# Aliases
alias ll "exa -l -a --icons --color always -x -F"
alias ls "exa -l -a --icons --color always -x -F"
alias logout "pkill -u neon"
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'

# alias clear "clear && colorscript -r"

alias q 'exit'
alias :q 'exit'

set -gx DENO_INSTALL "/home/neon/.deno/"
set -gx PATH "$DENO_INSTALL/bin:$PATH"

function fish_user_key_bindings
  fish_vi_key_bindings
end
