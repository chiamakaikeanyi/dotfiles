# NOTE: Commands with space at the end expects a parameter

# For fun
alias greet="say Hi everyone"
alias thank="say Thank you"
alias wish="say Happy birthday"


# Create and delete directories
alias mkcd='directory(){ mkdir -p "$1"; cd "$1" }; directory '
alias deld='directory(){ rm -rf "$1" }; directory '


## Restart the current shell
alias shr="exec -l $SHELL"


# Display files with line numbers
alias line='nl -s". " '


# NPM
alias nis='f() { npm install --save "$@" };f'


# Git
alias gi="git init && gac 'Initial commit'"
alias gcob="git checkout -b "
alias gco="git checkout "
alias gbr="git branch"
alias gs="git status"
alias ga="git add . "
alias gc="git commit "
alias gcm="git commit -m "
alias gac="ga && gcm"
alias gp="git push"
alias gpl="git pull"
alias gpom="git push origin master"
alias gpo="git push origin"
alias gplom="git pull origin master"
alias gplo="git pull origin"


# Docker
alias dps="docker ps"
alias dgp='f() { docker ps | grep "$@"};f'
# Get latest container ID
alias dl="docker ps -l -q"
alias di="docker images"
alias dip="docker image prune"
alias dri="docker rmi "
alias drc="docker container rm "
alias dcp="docker container prune"
alias ds="docker stop "
alias dex='f() { docker exec -it "$@" bash};f'
alias dexsh='f() { docker exec -it "$@" sh};f'
alias ds='f() { docker stop "$@"};f'
# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Removes unused images
drin() { docker rmi -f $(docker images --filter "dangling=true" -q); }

# Kubernetes
alias gc.auth="gcloud auth login"
alias kbd='f() { kubectl describe pod "$@" };f'
alias kex='f() { podName=$1; shift; kubectl exec -it "$podName" "$@" };f'
alias kgp='f() { kubectl get pods "$@" };f'
alias kgs='f() { kubectl get svc "$@" };f'
alias kgp='f() { kubectl get pods | grep "$@"};f'
alias kwp="kubectl get pods -w | grep "
alias klogs='f() { kubectl logs "$@" };f'


# Gatsby
alias gdev="gatsby develop"
alias gbuild="gatsby build"


# Generate the alias for the last command typed in the terminal
addAlias() {
  last_command=$(echo `history |tail -n1` | sed 's/[0-9]* //')
  echo alias $1="'""$last_command""'" >> ~/.bash_profile
  . ~/.bash_profile
}


# To check the manual - man figlet
figlet -k Aliases
echo -e "\e[32m Avoiding shell hell: Aliases to the rescue"
echo -e "\e[35m forloop Lagos Summit 2019 | Chiamaka Ikeanyi"

