# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/config"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "config"; then

  new_window "nvim"
  run_cmd "cd ./.config/nvim"
  run_cmd "nvim"

  new_window "tmux"
  select_window 2
  run_cmd "nvim ~/.tmux.conf"

  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
