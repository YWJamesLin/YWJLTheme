#!/bin/zsh
# 2014/12/03 Created by YWJamesLin
# 
# Set which to show
mod_time=1
mod_git=1

# Show return Status
retStatus="%(?:${FG[014]}^_^${FX[reset]} ${FG[010]}%B➜ %b${FX[reset]} :${FG[013]}Q_Q${FX[reset]} ${FG[009]}%B➜ %b${FX[reset]} )"

# Check whether we're in a git repository. And if we are, show the status of this repo.
function gitStatus()
{
  if [ "$(git_prompt_info)" ]; then
    echo " ${FG[015]}-${FX[reset]} ${FG[012]}%B<%b${FX[reset]} ${FG[208]}$(git_prompt_info)${FX[reset]} ${FG[012]}%B>%b${FX[reset]}"
  fi
}

# Prompting
#   FG
#     009: Light Red            010: Light Green
#     011: Light Yellow         012: Light Blue
#     013: Light Magenta        014: Light Cyan
#     015: Light White
#
#   FX[reset]: reset
PROMPT=$'${FG[012]}%B[%b${FX[reset]} ${FG[010]}%n${FX[reset]} @ ${FG[014]}%m${FX[reset]} ${FG[012]}%B]%b${FX[reset]} ${FG[015]}-${FX[reset]} ${FG[012]}%B[%b${FX[reset]} ${FG[015]}%~${FX[reset]} ${FG[012]}%B]%b${FX[reset]}'

if [ "${mod_time}" = "1" ]; then
  date="%D{%Y}年%D{%m}月%D{%d}日 週%D{%a} %D{%H:%M}"
  PROMPT+=$' ${FG[015]}-${FX[reset]} ${FG[012]}%B[%b${FX[reset]} ${FG[011]}${date}${FX[reset]} ${FG[012]}%B]%b${FX[reset]}'
fi

if [ "${mod_git}" = "1" ]; then
  PROMPT+='$(gitStatus)'
fi

PROMPT+=$'\n${retStatus}'

PS2=$'${FG[014]}%B>%b${FX[reset]} '
