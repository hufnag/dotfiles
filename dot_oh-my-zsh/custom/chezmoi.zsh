czp() {
  local amend=false
  local msg

  if [[ "$1" == "--amend" || "$1" == "-a" ]]; then
    amend=true
    shift
  fi

  chezmoi re-add

  if chezmoi git -- --no-pager diff --quiet && chezmoi git -- --no-pager diff --cached --quiet; then
    echo "No changes to commit."
    return 0
  fi

  echo
  echo "Changed files:"
  chezmoi git -- --no-pager status --short

  echo
  echo "Diff:"
  chezmoi git -- --no-pager diff

  echo

  if [[ $# -gt 0 ]]; then
    msg="$*"
  elif [[ "$amend" == false ]]; then
    echo "Commit message:"
    read -r msg
  fi

  if [[ "$amend" == false && -z "$msg" ]]; then
    echo "Aborted: empty commit message."
    return 1
  fi

  chezmoi git -- add .

  if [[ "$amend" == true ]]; then
    if [[ -n "$msg" ]]; then
      chezmoi git -- commit --amend -m "$msg"
    else
      chezmoi git -- commit --amend --no-edit
    fi
  else
    chezmoi git -- commit -m "$msg"
  fi

  chezmoi git -- push
}
