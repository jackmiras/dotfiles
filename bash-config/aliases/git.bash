alias ga="git add"
alias gaa="git add ."
alias gaam="git add $(git status | grep -i 'modified:' | awk '{print $2}')"

alias gd="git diff"

alias gl="git pull"

alias gp="git push"
alias gpf="git push --force"

alias gc="git commit"
alias gcmsg='git commit --message'

alias grb="git rebase"

alias gst="git status"

alias gco="git checkout"
alias gcoa="git checkout ."
