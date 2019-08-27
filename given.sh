#!/bin/sh
echo "Running Given shell at $(pwd)"

inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ ! "$inside_git_repo" ]; then
  echo "You are not inside a git repo."
  read -p "Would you like to init one in $(pwd)? [yn] " -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    git init
  else
    echo "OK. Exiting..."
    exit
  fi
fi

while true; do
  echo "---------"
  git status --short
  read -p "Your action? [caosthplq!] " -n 1 -r
  echo
  case $REPLY in
    c)
      echo "Commit current changes."
      read -p "Commit message? "
      git commit -m "$REPLY"
      ;;
    a)
      echo "Add a file to commit."
      read -p "What to add? "
      git add "$REPLY"
      ;;
    o)
      echo "Add all files to commit. Omniadd."
      git add .
      ;;
    t)
      git status
      ;;
    s)
      echo "Show diff between last two commits."
      git show
      ;;
    p)
      echo "Push commits."
      git push
      ;;
    l)
      echo "Log commits."
      git log --oneline
      ;;
    h)
      echo "c	git commit -m <>"
      echo "a	git add <>"
      echo "o	git add ."
      echo "t	git status"
      echo "s	git show"
      echo "p	git push"
      echo "l	git log --oneline"
      echo "!	git <>"
      echo "q	quit"
      ;;
    q)
      exit
      ;;
    '!')
      echo "Run git command."
      read -p "Which one? "
      git $REPLY
      ;;
  esac
done

