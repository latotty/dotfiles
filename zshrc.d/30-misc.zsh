#!/bin.zsh

setopt multios              # enable redirect to multiple streams: echo >file1 >file2
setopt long_list_jobs       # show long list format job notifications
setopt interactivecomments  # recognize comments

# define pager depending on what is available (less or more)
if (( ${+commands[less]} )); then
  export PAGER=less
  export LESS=-R
elif (( ${+commands[more]} )); then
  export PAGER=more
fi