if status is-interactive
  # Commands to run in interactive sessions can go here
  alias 'lg'='lazygit'
  alias 'cat'='bat'

  # Abbreviations
  function last_history_item
    echo $history[1]
  end
  abbr -a !! --position anywhere --function last_history_item

  # ENV Vars
  envsource ~/.env
  set -Ux NODE_OPTIONS '--max-old-space-size=8192'
  fish_add_path $HOME/.npm-global/bin
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/nick/anaconda3/bin/conda
    eval /Users/nick/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
