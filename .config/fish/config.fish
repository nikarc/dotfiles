status --is-interactive
rbenv init - fish | source

dotenv ~/.env

if status is-interactive
  # Commands to run in interactive sessions can go here
  alias 'lg'='lazygit'
  alias 'cat'='bat'
  alias 'pshell'='pipenv shell'
  alias 'pserv'='pipenv run uvicorn application.main:app --reload'
  alias 'a'='pipenv run alembic'
  alias 'ahist'='pipenv run alembic history'
  alias 'auh'='pipenv run alembic upgrade head'
  alias 'adg'='pipenv run alembic downgrade'
  alias 'arev'='pipenv run alembic revision -m'
  alias 'astamp'='pipenv run alembic stamp'
  alias 'pvpn-port'='bash -c \'while true ; do date ; natpmpc -a 1 0 udp 60 -g 10.2.0.1 && natpmpc -a 1 0 tcp 60 -g 10.2.0.1 || { echo -e "ERROR with natpmpc command \\a" ; break ; } ; sleep 45 ; done\''

  switch (uname)
    case Linux
      # All Linux specific commands
      alias pbcopy "xclip -selection clipboard"
      alias pbpaste "xclip -selection clipboard -o"

      set -Ux MOZ_ENABLE_WAYLAND 1
      set -Ux N_PREFIX '/home/nick/node_versions'
      set -Ux PIPEWIRE_LATENCY '64/48000'

    case Darwin
      # All macOS specific commands
      set -Ux N_PREFIX '/Users/nickarcuri'
  end

  # Abbreviations
  function last_history_item
    echo $history[1]
  end
  abbr -a !! --position anywhere --function last_history_item
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/nick/anaconda3/bin/conda
    eval /Users/nick/anaconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<
