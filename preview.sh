#!/usr/bin/env bash
# Preview the docs site on your own computer.
#
# Usage:  ./preview.sh
#
# The first run sets up a Python environment in venv/ (takes a minute).
# After that it starts right away. The site opens in your browser and
# reloads whenever you save a file under docs/. Press Ctrl+C to stop.

set -euo pipefail

# Run from the repo root, wherever the script was called from.
cd "$(dirname "$0")"

if ! command -v python3 >/dev/null 2>&1; then
    echo "Python 3 is not installed. Install it from https://www.python.org/downloads/ and try again."
    exit 1
fi

if [ ! -x venv/bin/python ]; then
    echo "Setting up a Python environment in venv/ (first run only)..."
    python3 -m venv venv
fi

# Reinstall dependencies only when requirements.txt has changed.
stamp=venv/.requirements-installed
if [ ! -f "$stamp" ] || [ requirements.txt -nt "$stamp" ]; then
    echo "Installing dependencies..."
    venv/bin/python -m pip install --quiet --upgrade pip
    venv/bin/python -m pip install --quiet -r requirements.txt
    touch "$stamp"
fi

# Use a different port with e.g.  PORT=8001 ./preview.sh
port="${PORT:-8000}"

if ! venv/bin/python -c "import socket; socket.socket().bind(('127.0.0.1', $port))" 2>/dev/null; then
    echo "Port $port is already in use, probably by another preview that's still running."
    echo "Stop that one with Ctrl+C in its terminal window, or run:  PORT=8001 ./preview.sh"
    exit 1
fi

echo
echo "Starting preview at http://127.0.0.1:$port/educelab-docs/"
echo "Press Ctrl+C to stop."
echo
exec venv/bin/python -m mkdocs serve --open --dev-addr "127.0.0.1:$port"
