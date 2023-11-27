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
  set -Ux NODE_OPTIONS '--max-old-space-size=8192'
end
