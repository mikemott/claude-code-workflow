# Project Initialization

Initialize this project for Claude Code development. Auto-detect what you can, then interview for gaps.

## Phase 0: Check Existing Setup

First, check if this project already has Claude configuration:

### If CLAUDE.md exists:

Read the existing file and use AskUserQuestion to ask:

"This project already has a CLAUDE.md. How should I proceed?"

| Option | Behavior |
|--------|----------|
| **Update/Audit** | Keep existing content, identify gaps, suggest additions. Non-destructive. |
| **Backup & Replace** | Save existing as `CLAUDE.md.backup.{timestamp}`, create fresh. |
| **Abort** | Stop initialization, leave everything as-is. |

If "Update/Audit" selected:
- Read existing CLAUDE.md thoroughly
- Run auto-detection (Phase 1)
- Compare what's documented vs. what's detected
- Report: "Your CLAUDE.md covers X, Y, Z. Missing: A, B. Outdated: C."
- Offer specific additions/updates rather than full replacement
- Skip to Phase 5 with update summary

If "Backup & Replace" selected:
- Create backup with timestamp
- Continue to Phase 1 as normal

If "Abort" selected:
- Report "Initialization cancelled. Existing CLAUDE.md preserved."
- Stop

### If no CLAUDE.md exists:

Continue to Phase 1.

## Phase 1: Auto-Detection

Scan the project root and detect:

### Package/Config Files (check in order)
- `package.json` → Node/TypeScript project, extract name, dependencies, scripts
- `Cargo.toml` → Rust project
- `pyproject.toml` or `requirements.txt` → Python project
- `go.mod` → Go project
- `Package.swift` or `*.xcodeproj` → Swift/iOS project
- `wrangler.toml` or `wrangler.jsonc` → Cloudflare Workers project

### Structure Detection
- Look for `src/`, `app/`, `lib/`, `tests/`, `spec/` directories
- Check for `.github/workflows/` (CI/CD)
- Check for `Dockerfile` or `fly.toml` (deployment)
- Check for existing `.claude/` directory
- Check for Linear/GitHub integration files

### Framework Detection
- React: `react` in dependencies
- Next.js: `next` in dependencies
- Vue: `vue` in dependencies
- Express/Hono/etc: check dependencies
- Database: look for prisma, drizzle, D1 bindings, Core Data

Report findings in a summary table before proceeding.

## Phase 2: Interview for Gaps

Use AskUserQuestion to gather what couldn't be auto-detected:

1. **Project purpose** (1-2 sentence description)
2. **Issue tracker prefix** (e.g., `QUI`, `LIN`, or none)
3. **Key architectural decisions** not obvious from code
4. **Any gotchas or constraints** future Claude sessions should know
5. **Primary entry points** if not obvious

Keep questions focused—skip anything already detected.

## Phase 3: Generate CLAUDE.md

Create `CLAUDE.md` in the project root with this structure:

```markdown
# {Project Name}

{One-line description from interview}

**Stack:** {detected stack} | **Issues:** {prefix}-XXX

## Key Rules

- {Any project-specific constraints from interview}
- Follow branch naming: `{prefix}-XXX-description`
- {Include critical rules from detection, e.g., "Camera requires physical device" for iOS}

## Architecture

{Brief architecture based on detection + interview}

## Key Files

| Area | Files |
|------|-------|
| Entry | {detected entry points} |
| {Other areas} | {key files} |

## Commands

```bash
# Development
{detected dev command from package.json scripts or similar}

# Testing
{detected test command}

# Build
{detected build command}
```

## Gotchas

- {Any gotchas from interview}
- {Detected constraints, e.g., environment variables needed}
```

## Phase 4: Setup Project Structure

1. Create `.claude/` directory if it doesn't exist
2. Create `.claude/settings.json` with project-specific settings if needed
3. Offer to create/update `.gitignore` to include `.claude/settings.json` if it contains sensitive paths

## Phase 5: Summary

Report what was created:
- CLAUDE.md location and size
- Any directories created
- Suggested next steps (e.g., "Run `/commit` to commit the initialization")

$ARGUMENTS
