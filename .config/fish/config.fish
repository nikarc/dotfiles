status --is-interactive
rbenv init - fish | source

if status is-interactive
  # Commands to run in interactive sessions can go here
  alias 'lg'='lazygit'
  alias 'cat'='bat'

  switch (uname)
    case Linux
      # All Linux specific commands
    alias pbcopy "xclip -selection clipboard"
    alias pbpaste "xclip -selection clipboard -o"

    set -Ux MOZ_ENABLE_WAYLAND 1

    case Darwin
      # All macOS specific commands
  end

  # Abbreviations
  function last_history_item
    echo $history[1]
  end
  abbr -a !! --position anywhere --function last_history_item

  # ENV Vars
  # This will run every new terminal instance
  # envsource ~/.env
  set -Ux NODE_OPTIONS '--max-old-space-size=8192'
  set -Ux N_PREFIX '/Users/nickarcuri'
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/nick/anaconda3/bin/conda
    eval /Users/nick/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
