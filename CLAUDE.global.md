# Global Claude Conventions

Personal development standards that apply across all projects.

## Interaction Preferences

**Act, then report.** Make reasonable implementation choices autonomously and explain what was done after. Don't ask for permission on routine decisions.

**Prompt for approval, not manual action.** When confirmation is needed, ask within the conversation—don't instruct me to open a terminal or manually edit files. Keep the workflow in Claude.

**Explain changes at completion.** Summarize what was modified at the end of each task.

## Core Rules

### Git Workflow
- **NEVER commit directly to `main` or `master`** - always use feature branches
- Branch naming: `{issue-prefix}-{number}-short-description` (e.g., `qui-123-add-auth`)
- Include issue reference in PR body: `Closes QUI-XXX` or `Fixes LIN-XXX`
- Wait for PR-Agent review before requesting human review

### Commit Style
Follow Conventional Commits with issue references:
```
feat(LIN-123): add user authentication endpoint
fix(QUI-456): resolve memory leak in camera service
docs: update API documentation
refactor: extract validation logic to separate module
```
First line: 72 chars max. Include issue ID when applicable.

### Token Optimization
- Use `limit: 10` for Linear/API queries unless more needed
- Run `/compact` when responses slow down
- Start fresh conversations for unrelated tasks
- Use `/transfer-context` before context degrades completely

## Tech Stack

| Layer | Technologies |
|-------|--------------|
| Frontend | React, TypeScript |
| Backend | Cloudflare Workers, Fly.io |
| Database | Cloudflare D1 |
| Project Mgmt | Linear, GitHub |

## Code Standards

### Style
- **Minimal comments** - code should be self-documenting
- Comments only for non-obvious logic or important context
- Check existing patterns in the codebase before creating new ones

### Error Handling (Mixed Approach)
- **Expected failures** (validation, not found): Use Result-style discriminated unions
  ```typescript
  type Result<T> = { success: true; data: T } | { success: false; error: string }
  ```
- **Unexpected errors** (bugs, system failures): Let exceptions throw and catch at boundaries
- Include structured context: user ID, request ID, breadcrumbs

### Testing
- **Run `/test` after implementing changes** - verify before committing
- **Generate tests with `/test-generate`** when adding new functionality
- Run linting/build to ensure code compiles
- Maintain coverage above 80% for critical paths
- If tests fail, investigate and fix before proceeding

## Always Do

Before completing any task:
- Run tests and linting/build
- Check for existing patterns before creating new ones
- Explain what changed in a summary

## Never Do (Without Explicit Permission)

- Commit to main branch
- Force push or rewrite git history
- Make architectural changes (restructure folders, add dependencies, change patterns)
- Delete files

## Workflow

### Before Starting Work
1. Check for existing issues in Linear (or use `/sprint`)
2. Create branch from latest main
3. Understand the blast radius (how many files will change?)
4. For complex features, use `/interview-plan` first

### During Development
- Commit frequently with clear messages
- Use Context7 for documentation lookups
- **Run `/test` after each significant change**
- **Use `/test-generate` when adding new functions/modules**

### Before Committing
1. Run `/test` - all tests must pass
2. Run linting/build
3. Review changes make sense together

### Before Merging
- Ensure all CI checks pass
- Address PR-Agent feedback
- Update Linear issue status

## Tool Reference

| Tool | Purpose |
|------|---------|
| **Linear** | Issue tracking - use issue IDs in commits/branches |
| **GitHub** | PRs, code review, CI/CD |
| **PR-Agent** | Automated code review on PRs |
| **Context7** | Documentation and codebase search |
| **Sentry** | Error tracking and performance monitoring |
| **Cloudflare** | Pages (frontend), Workers (serverless), D1 (database) |
| **Fly.io** | Container deployment |

## Custom Commands

| Command | Purpose |
|---------|---------|
| `/init` | Initialize new project - auto-detect stack, generate CLAUDE.md |
| `/sprint [ISSUE-ID]` | Plan work session with Linear integration |
| `/test [file\|pattern]` | Run tests (auto-detects framework) |
| `/test-generate [file]` | Generate test scaffolding for code |
| `/debug [problem]` | Systematic debugging with Rule of Three |
| `/interview-plan` | Deep planning interview before implementation |
| `/transfer-context` | Prepare handoff for fresh conversation |

## Built-in Commands

| Command | Purpose |
|---------|---------|
| `/compact` | Compress conversation context |
| `/commit` | Create git commit |
| `gh pr create --fill` | Create PR with auto-generated content |
