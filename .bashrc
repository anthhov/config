# Colored output
export CLICOLOR=1

# Custom shell prompt
export PS1="\[\e[35m\]\$\[\e[0m\] "

# Aliases
alias g='git'

# fzf -> vim
f() (
  file=$(
    fzf --preview 'bat --style=numbers,changes --wrap never --color always {} || cat {} || tree -C {}' \
        --bind='ctrl-u:preview-page-up' \
        --bind='ctrl-d:preview-page-down'
  )
  if [ -n "$file" ]; then
    vim "$file"
  fi
)

# ripgrep + fzf -> vim
# Inspired by: https://junegunn.github.io/fzf/tips/ripgrep-integration/
rf() (
  RELOAD='reload:rg --column --color=always --smart-case {q} || :'
  OPENER='if [[ $FZF_SELECT_COUNT -eq 0 ]]; then
            vim {1} +{2}     # No selection. Open the current line in Vim.
          else
            vim +cw -q {+f}  # Build quickfix list for the selected items.
          fi'
  fzf --disabled --ansi --multi \
      --bind "start:$RELOAD" --bind "change:$RELOAD" \
      --bind "enter:become:$OPENER" \
      --bind "ctrl-o:execute:$OPENER" \
      --bind 'alt-a:select-all,alt-d:deselect-all,ctrl-/:toggle-preview' \
      --delimiter : \
      --preview 'bat --style=full --color=always --highlight-line {2} {1}' \
      --preview-window '~4,+{2}+4/3,up' \
      --query "$*"
)
