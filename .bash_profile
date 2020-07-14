# NOTE: Commands with space at the end expects a parameter

# For fun
alias greet="say Hi everyone"
alias thank="say Thank you"
alias wish="say Happy birthday"

# Open my blog on my default web browser
alias blog="open https://chiamakaikeanyi.dev"

# Create and delete directories
alias mkcd='directory(){ mkdir -p "$1"; cd "$1" }; directory '
alias deld='directory(){ rm -rf "$1" }; directory '

# copy the last command to the clipboard "fix command" (fc) to get you the last command, remove both leading and trailing whitespace for nicer #formatting with awk and then copy it into your Mac's pasteboard with pbcopy
alias copyLastCmd="fc -ln -1 | awk '{\$1=\$1}1' | pbcopy"

# Display hidden files 
alias ll="ls -la"
alias py=python3

# Display files with line numbers
alias line='nl -s". " '

# Restart the current shell
alias shr="exec -l $SHELL"

# Press CMD + C to undo this
alias wake='caffeinate -t 3600'

# Shutdown my laptop
alias rest='sudo /sbin/shutdown -h now'

# NPM
alias nis='f() { npm install --save "$@" };f'

# Git
alias github="open https://github.com/chiamakaikeanyi"
alias personal="git config user.name 'Firstname Lastname' && git config user.email 'email@gmail.com'"
alias workspace="git config user.name 'Firstname Lastname' && git config user.email 'email@work.com'"
alias gi="git init && gac 'Initial commit'"
alias gcl='f() {git clone "$@"};f'
alias gcob="git checkout -b "
alias gco="git checkout "
alias gbr="git branch"
alias gs="git status"
alias grn="git branch -m "
alias ga="git add . "
alias gcm="git commit -m "
alias gac="ga && gcm"
alias gp="git push"
alias gpl="git pull"
alias gdiff="git diff "
alias gplom="git pull origin master"
alias gplo="git pull origin "
alias gpom="git push origin master"
alias gpo="git push origin "
alias gr="git reset --hard origin/master"
alias gdel="git branch -d "
alias gcp='f() {git cherry-pick "$@"};f'
alias grb='f() {git rebase "$@"};f'
alias gm='f() {git merge "$@"};f'
alias gk="gitk"
alias gui="git gui"
alias gstats="git shortlog -sn --all --no-merges"
alias gitoverview="git log --all --oneline --no-merges"
alias gchange='f() {git log --oneline --no-merges "$@"..HEAD};f'
alias gitrecap='f() {git log --all --oneline --no-merges --author="$@"};f'
alias gittoday='f() {git log --since=00:00:00 --all --oneline --no-merges --author="$@"};f'
alias gitrecent='git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(refname:short)"'
alias gitweeks="git log --all --since='2 weeks' --oneline --no-merges"
alias gstatd="git shortlog -sn --since='10 weeks' --until='2 weeks'"

# Gatsby
alias gdev="gatsby develop"
alias gbuild="gatsby build"

# Docker
alias dps="docker ps"
alias dgp='f() { docker ps | grep "$@"};f'
# Get latest container ID
alias dl="docker ps -l -q"
alias di="docker images"
alias dip="docker image prune"
alias dri="docker rmi "
alias drc="docker container rm "
alias drcf="docker container rm -f "
alias dcp="docker container prune"
alias ds="docker stop "
alias dex='f() { docker exec -it "$@" bash};f'
alias dexsh='f() { docker exec -it "$@" sh};f'
alias ds='f() { docker stop "$@"};f'
# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/" | sed "s/['|\']//g" | sort; }
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

# Generate the alias for the last command typed in the terminal
addAlias() {
  last_command=$(echo $(history | tail -n1) | sed 's/[0-9]* //')
  echo alias $1="'""$last_command""'" >>~/.bash_profile
  . ~/.bash_profile
}


# Customizing your terminal

# To check the manual - man figlet
# echo "\e[32mDark Green"
# echo "\e[33mGold"
# echo "\e[35mPurple"
# echo "\e[37mLight gray"
# echo "\e[92mLight Green"

# echo "\e[1mBold"
# echo "\e[4mUnderline"

# The -e parameter is used for the interpretation of backslash
# For a clearer output, you can use the -k flag to add a little space between the printed characters

figlet -k Aliases   # The -k flag to add a little space between the printed characters yielding a clearer output
echo -e "\e[32m Avoiding shell hell: Aliases to the rescue\e[0m"
echo -e "\e[35m forloop Lagos Summit 2019 | Chiamaka Ikeanyi\e[0m"

figlet -k '{ } is poetry'
echo -e "\e[32m Learn, \e[1;4;33mUnlearn,\e[0m \e[32mRelearn. \e[1mJust keep moving...\e[0m"

echo "\e[32m"                     # Invoke a color
figlet -f slant "{ } is poetry"   # Slant text
echo "\e[0m"                      # Reset the color
echo -e "Learn, \e[1;4;33mUnlearn\e[0m, Relearn. \e[1mJust keep moving...\e[0m" # Combine attributes. The attributes must be separated by a semicolon
