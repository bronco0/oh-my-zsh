# Fork Michele Bologna's theme
#
# This a theme for oh-my-zsh. Features a colored prompt with:
# * username@host: [jobs] [git] workdir % 
# * hostname color is based on hostname characters. When using as root, the 
# prompt shows only the hostname in red color.
# * [jobs], if applicable, counts the number of suspended jobs tty
# * [git], if applicable, represents the status of your git repo (more on that
# later)
# * '%' prompt will be green if last command return value is 0, yellow otherwise.
# 
# git prompt is inspired by official git contrib prompt: 
# https://github.com/git/git/tree/master/contrib/completion/git-prompt.sh
# and it adds:
# * the current branch
# * '%' if there are untracked files
# * '$' if there are stashed changes
# * '*' if there are modified files
# * '+' if there are added files
# * '<' if local repo is behind remote repo
# * '>' if local repo is ahead remote repo
# * '=' if local repo is equal to remote repo (in sync)
# * '<>' if local repo is diverged

local green="%{$fg[green]%}"
local green_b="%{$fg_bold[green]%}"
local red="%{$fg[red]%}"
local red_b="%{$fg_bold[red]%}"
local cyan="%{$fg[cyan]%}"
local cyan_b="%{$fg_bold[cyan]%}"
local yellow="%{$fg[yellow]%}"
local yellow_b="%{$fg_bold[yellow]%}"
local blue="%{$fg[blue]%}"
local blue_b="%{$fg_bold[blue]%}"
local magenta="%{$fg[magenta]%}"
local magenta_b="%{$fg_bold[magenta]%}"
local white="%{$fg[white]%}"
local white_b="%{$fg_bold[white]%}"
local reset="%{$reset_color%}"

local color_array=($green $red $cyan $yellow $blue $magenta $white)

local username_normal_color=$white
local username_root_color=$red

local current_dir_color=$cyan
local username_command="%n"
local current_dir="%~"
local time="%*"

local username_output="%(!..$username_normal_color$username_command$reset)"
local current_dir_output="$current_dir_color$current_dir$reset"
local jobs_bg="${red}fg: %j$reset"
local last_command_output="%(?.%(!.$red.$green).$yellow)"
local time_output="[$yellow$time$reset]"

ZSH_THEME_GIT_PROMPT_PREFIX="$magenta_b\uE0A0$reset "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_UNTRACKED="$blue_b%%"
ZSH_THEME_GIT_PROMPT_MODIFIED="$red_b*"
ZSH_THEME_GIT_PROMPT_ADDED="$green_b+"
ZSH_THEME_GIT_PROMPT_STASHED="$blue_b$"
ZSH_THEME_GIT_PROMPT_EQUAL_REMOTE="$green_b="
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=">"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="<"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE="$red_b<>"

PROMPT='$time_output$username_output:$current_dir_output%1(j. [$jobs_bg].)'
GIT_PROMPT='$(out=$(git_prompt_info)$(git_prompt_status)$(git_remote_status);if [[ -n $out ]]; then printf %s " $white($green$out$white)$reset";fi)'
PROMPT+="$GIT_PROMPT"
PROMPT+=" $last_command_output%#$reset "
RPROMPT=''
