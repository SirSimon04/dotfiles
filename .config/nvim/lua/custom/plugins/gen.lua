return {
  'David-Kunz/gen.nvim',
  opts = {
    model = 'qwen2.5-code', -- The default model to use.
    quit_map = 'q', -- set keymap to close the response window
    display_mode = 'split',
    show_prompt = true, -- Shows the prompt submitted to Ollama.
    show_model = true, -- Displays which model you are using at the beginning of your chat session.
  },
}
