#!/bin/zsh
# YWJLTheme, an oh_my_zsh theme
# 2014/12/03 Created by YWJamesLin

#   Set which to show
mod_time=1
mod_git=1

#   Show Return Status
retStatus="%(?:${FG[014]}^_^${FX[reset]} ${FG[010]}%B➜ %b${FX[reset]} :${FG[013]}Q_Q${FX[reset]} ${FG[009]}%B➜ %b${FX[reset]} )"

#   Check whether we're in a git repository. And if we are, show the status of this repo.
function gitStatus()
{
  if [ "$(git_prompt_info)" ]; then
    echo " ${FG[015]}-${FX[reset]} ${FG[012]}%B<%b${FX[reset]} ${FG[208]}$(git_prompt_info)${FX[reset]} ${FG[012]}%B>%b${FX[reset]}"
  fi
}

#   Prompting
PROMPT=$'${FG[012]}%B[%b${FX[reset]} ${FG[010]}%n${FX[reset]} @ ${FG[014]}%m${FX[reset]} ${FG[012]}%B]%b${FX[reset]} ${FG[015]}-${FX[reset]} ${FG[012]}%B[%b${FX[reset]} ${FG[015]}%~${FX[reset]} ${FG[012]}%B]%b${FX[reset]}'

#   Option of Time
if [ "${mod_time}" = "1" ]; then
  date="%D{%Y}年%D{%m}月%D{%d}日　星期%D{%a}　%D{%H:%M}"
  PROMPT+=$' ${FG[015]}-${FX[reset]} ${FG[012]}%B[%b${FX[reset]} ${FG[011]}${date}${FX[reset]} ${FG[012]}%B]%b${FX[reset]}'
fi

#   Option of Git
if [ "${mod_git}" = "1" ]; then
  PROMPT+='$(gitStatus)'
fi

#   Tail of Prompting
PROMPT+=$'\n${retStatus}'

#   PS2
PS2=$'${FG[014]}%B>%b${FX[reset]} '
