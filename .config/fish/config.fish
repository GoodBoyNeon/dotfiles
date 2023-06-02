if status is-interactive
    neofetch
    starship init fish | source
end

set fish_greeting
fish_vi_key_bindings

# Aliases
# alias ls "exa -l -a --icons --color always -x -F"
alias ls "exa -la --icons --color always"
# alias ll "exa -la --icons --color always"
alias lt "exa --tree --level=2 --long --icons --git"
alias logout "pkill -u neon"
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'

alias q 'exit'
alias :q 'exit'

# Environment variables
set -gx EDITOR "/usr/bin/nvim"
export GCM_CREDENTIAL_STORE=cache

bind --mode insert --sets-mode default jk repaint
bind --mode insert --sets-mode default kj repaint

function mkcd -d "Create a directory and set CWD"
  command mkdir $argv
  if test $status = 0
    switch $argv[(count $argv)]
      case '-*'
      case '*'
        cd $argv[(count $argv)]
        return
    end
  end
end

function wf
  tmux
  nvim $argv
end
