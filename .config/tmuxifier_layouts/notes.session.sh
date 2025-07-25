# Set a custom session root path. Default is $HOME.
# Must be called before `initialize_session`.
session_root "~/Documents/Obsidian/obsidian-main"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "notes"; then

  new_window "vim"
  run_cmd "nvim"

  new_window "git"
  run_cmd "watch -n 900 'git commit -m \"Automatic vault update\" || true && git push'"

  select_window 1

fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
