# Claude Code Workflow

Personal Claude Code configuration with custom commands for streamlined development workflows.

## Quick Setup

```bash
git clone https://github.com/YOUR_USERNAME/claude-code-workflow.git
cd claude-code-workflow
./setup.sh
```

## What's Included

### Global Configuration
- `CLAUDE.global.md` - Personal conventions, code standards, workflow preferences

### Custom Commands

| Command | Purpose |
|---------|---------|
| `/init` | Initialize new project - auto-detect stack, generate CLAUDE.md |
| `/sprint [ISSUE-ID]` | Plan work session with Linear integration |
| `/test [file\|pattern]` | Run tests (auto-detects framework) |
| `/test-generate [file]` | Generate test scaffolding for code |
| `/debug [problem]` | Systematic debugging with Rule of Three |
| `/interview-plan` | Deep planning interview before implementation |
| `/transfer-context` | Prepare handoff for fresh conversation |

## Customization

After running `setup.sh`, edit `~/.claude/CLAUDE.md` to adjust:
- Tech stack preferences
- Code style conventions
- Always do / Never do rules
- Tool integrations

## Structure

```
├── setup.sh              # Run on new machine
├── CLAUDE.global.md      # Global conventions → ~/.claude/CLAUDE.md
└── commands/
    ├── init.md
    ├── sprint.md
    ├── test.md
    ├── test-generate.md
    ├── debug.md
    ├── interview-plan.md
    └── transfer-context.md
```
