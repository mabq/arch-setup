#!/bin/sh

#
# AUTHOR: mabq
# DATE: Sep 23, 2024
# MODIFIED: Sep 23, 2024
#
# DESCRIPTION
# Easier use of the tgpt command
#
# USAGE
# This scripts is fired with a window manager keybinding
#

# blackboxai is slow
# ollama can only be run locally
# openai requires a key (use it through duckduckgo layer)
selected_provider=$(echo "phind,duckduckgo" | tr "," "\n" | fzf)
provider="--provider $selected_provider"

model=""
if [ "$selected_provider" = "duckduckgo" ]; then
  selected_model=$(echo "gpt-4o-mini,meta-llama/Meta-Llama-3.1-70B-Instruct-Turbo,mistralai/Mixtral-8x7B-Instruct-v0.1,claude-3-haiku-20240307" | tr "," "\n" | fzf)
  model="--model $selected_model"
fi

eval "tgpt -i $provider $model"
