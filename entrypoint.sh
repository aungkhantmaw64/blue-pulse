#!/bin/bash
echo "export BP_PROJ_PATH=/app" >>~/.bashrc
echo "export BP_TOOL_PATH=/app/tools" >>~/.bashrc
echo "export PATH="$PATH:/app/tools"" >>~/.bashrc
source ~/.bashrc
echo "bptool.py is ready!"
exec "$@"
