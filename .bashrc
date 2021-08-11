PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source /usr/local/git/contrib/completion/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[34m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
# export RAILS_PATH='~/.rvm/gems/ruby-1.9.3-p125@rails3tutorial2ndEd/'
# export SVN_EDITOR='vi'

alias v='vim'
alias g='git'

alias b='bundle'
alias be='bundle exec'
alias bi='bundle install'
alias ls='ls -G'
alias ll='ls -la'
alias la='ls -a'
alias screen='screen -U -D -RR'

stty start undef
stty stop undef
