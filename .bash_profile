# NOTE: Commands with space at the end expects a parameter

# Git
alias gi="git init && gac 'Initial commit'"
alias gcob="git checkout -b "
alias gco="git checkout "
alias gbr="git branch"
alias gs="git status"
alias ga="git add -A"
alias gc="git commit -m "
alias gac="ga && gc"
alias gp="git push"
alias gpl="git pull"
alias gpom="git push origin master"
alias gpo="git push origin "
alias gplom="git pull origin master"
alias gplo="git pull origin "


# Docker
alias dps="docker ps"
alias dgp="docker ps | grep "
# Get latest container ID
alias dl="docker ps -l -q"
alias di="docker images"
alias dex="docker exec -it "
alias dip="docker image prune"
alias dri="docker rmi "
alias drc="docker container rm "
alias dcp="docker container prune"
alias ds="docker stop "

# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }

# Removes unused images
drin() { docker rmi -f $(docker images --filter "dangling=true" -q); }

# Remove all images
dri() { docker rmi $(docker images -q); }

# Remove all <none> images
drin() { docker rmi -f $(docker images --filter "dangling=true" -q); }

# Dockerfile build, e.g., $dbu tcnksm/test
dbu() { docker build -t=$1 .; }


# Kubernetes
alias klogs="kubectl logs "
alias kgp="kubectl get pods | grep "
alias kwp="kubectl get pods -w | grep "


# Gatsby
alias gdev="gatsby develop"
alias gbuild="gatsby build"


# The next line generates the alias for the last command typed in the terminal before it is invoked
add-alias() {
  local last_command=$(echo `history |tail -n1 |head -n1` | sed 's/[0-9]* //')
  echo alias $1="'""$last_command""'" >> ~/.bash_profile
  . ~/.bash_profile
}
