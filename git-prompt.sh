#!/bin/bash

__git_ps1()
{
  # Get current context
  B=$(git branch 2>/dev/null | sed -e "/^ /d" -e "s/* \(.*\)/\1/")

  if [ -n "$B" ]; then 
    S="git";
  elif [ -e .bzr ]; then 
    S=bzr;
  elif [ -e .hg ]; then 
    S="hg";
    B="$(hg branch)"; 
  elif [ -e .svn ]; then 
    S="svn";
  else 
    S=""; 
  fi;

  if [ -n "$S" ]; then 
    if [ -n "$B" ]; then 
      M=$S:$B; 
    else 
      M=$S;
    fi;
  fi

  if [[ -n "$M" ]]; then
    echo -n -e "\e[33;40m($M)\e[01;32m\e[00m"
  fi
}
