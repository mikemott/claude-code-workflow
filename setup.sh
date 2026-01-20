#!/bin/bash

# Claude Code Workflow Setup
# Installs global CLAUDE.md and custom commands

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"

echo "Setting up Claude Code workflow..."

# Create directories
mkdir -p "$CLAUDE_DIR"
mkdir -p "$COMMANDS_DIR"

# Backup existing CLAUDE.md if present
if [ -f "$CLAUDE_DIR/CLAUDE.md" ]; then
    BACKUP="$CLAUDE_DIR/CLAUDE.md.backup.$(date +%Y%m%d-%H%M%S)"
    echo "Backing up existing CLAUDE.md to $BACKUP"
    cp "$CLAUDE_DIR/CLAUDE.md" "$BACKUP"
fi

# Copy global CLAUDE.md
echo "Installing global CLAUDE.md..."
cp "$SCRIPT_DIR/CLAUDE.global.md" "$CLAUDE_DIR/CLAUDE.md"

# Copy commands
echo "Installing custom commands..."
cp "$SCRIPT_DIR/commands/"*.md "$COMMANDS_DIR/"

# List what was installed
echo ""
echo "Installed:"
echo "  ~/.claude/CLAUDE.md"
for cmd in "$COMMANDS_DIR"/*.md; do
    name=$(basename "$cmd" .md)
    echo "  /$name command"
done

echo ""
echo "Done. Available commands:"
echo "  /init                - Initialize a new project"
echo "  /sprint [ISSUE-ID]   - Plan work session with Linear"
echo "  /debug [problem]     - Systematic debugging"
echo "  /interview-plan      - Planning interview"
echo "  /transfer-context    - Prepare context handoff"
echo "  /test [file|pattern] - Run tests (auto-detects framework)"
echo "  /test-generate [file]- Generate tests for code"
