if status is-interactive
    neofetch
    starship init fish | source
end

set fish_greeting
fish_vi_key_bindings

# Aliases
alias ls "exa -l --icons --git -a"
alias lt "exa --tree --level=2 --long --icons --git"
alias logout "pkill -u neon"
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME/'
alias code 'code --disable-gpu'

alias q 'exit'
alias :q 'exit'
alias g 'git'

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

function pa -d "(A)ttach to a (P)roject (tmuxinator)"
  command tmuxinator start $argv
end


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# deno
set --export DENO_INSTALL "$HOME/.deno"
set --export PATH $DENO_INSTALL/bin $PATH

fish_add_path /home/neon/.spicetify
thefuck --alias | source
# eval $(fzf_key_bindings)
zoxide init fish | source
