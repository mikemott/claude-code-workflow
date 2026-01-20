# Sprint Planning with Linear

Query Linear for current work and set up a focused implementation session.

## Phase 1: Fetch Current Work

Query Linear to get:
1. Issues assigned to me in the current sprint/cycle
2. Issues in "In Progress" status
3. High-priority unassigned issues in the backlog (limit: 5)

Present as a summary table:
```
| ID | Title | Status | Priority |
|----|-------|--------|----------|
| QUI-123 | Add user auth | In Progress | High |
| QUI-124 | Fix camera bug | Todo | Urgent |
```

## Phase 2: Select Focus

Use AskUserQuestion to ask:
- Which issue to work on this session (from the list above, or enter a different ID)
- If the issue is large, ask: "Want to focus on a specific part of this?"

## Phase 3: Understand the Issue

For the selected issue:
1. Fetch full details from Linear (description, comments, linked issues)
2. Check if there's an existing branch for this issue
3. Look for related code based on the issue description

Summarize:
- What needs to be done (from Linear description)
- Current state (any existing branch/PR?)
- Relevant files to review

## Phase 4: Break Down into Tasks

Create implementation steps using TodoWrite. Steps should be:
- Concrete and actionable
- Completable in one focused effort
- Ordered by dependency

Example breakdown for "Add user authentication":
```
1. Review existing auth patterns in codebase
2. Create auth middleware in src/middleware/
3. Add session validation logic
4. Create login/logout API endpoints
5. Write tests for auth flow
6. Update CLAUDE.md if new patterns introduced
```

## Phase 5: Start Work

1. Create feature branch if one doesn't exist: `{issue-prefix}-{number}-{short-description}`
2. Mark first task as in_progress
3. Begin implementation

## During the Session

- Mark tasks complete as you finish them
- If scope changes, update the todo list
- When all tasks complete, prompt to create PR with `Closes {ISSUE-ID}` in the body

## Arguments

$ARGUMENTS

If an issue ID is provided (e.g., `/sprint QUI-123`), skip Phase 1-2 and go directly to that issue.
