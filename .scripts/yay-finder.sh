#! /bin/bash
# Credits to limitlesstrolling on DIscord for the Script.
read -N 1 -p "$(printf 'What would you like to do?\n[I]nstall packages, [U]pdate packages, [R]emove pacakges, [C]lear cache\n> ')" action &&
  case "$action" in
  u) yay -Syu ;;
  i) yay -qlS | fzf --multi --preview "yay -Sii {1}" --preview-window=right:75% | xargs -ro -I input sh -c 'echo ": input"; yay -S input' ;;
  r) yay -qQ | fzf --multi --preview "yay -Sii {1}" --preview-window=right:75% | xargs -ro -I input sh -c 'echo ": input"; yay -R input' ;;
  c) yay -Scc ;;
  esac
