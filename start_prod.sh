#!/usr/bin/env bash
tmux kill-session -t lunar-api-docs
tmux new-session -d -s lunar-api-docs
tmux send-keys -t lunar-api-docs './update.sh && ./slate.sh build && ./slate.sh serve' Enter