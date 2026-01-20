# Transfer Context

Prepare a handoff document for continuing this work in a fresh conversation.

## Generate Handoff

Create a structured summary with these sections:

### 1. Summary
What was accomplished in this session (not just attempted—actual results).

### 2. Key Decisions
Important choices made and their reasoning. Include:
- Architecture decisions
- Trade-offs considered
- Why alternatives were rejected

### 3. Important Context
Things a fresh Claude session needs to know:
- Gotchas discovered
- Patterns established
- Failed approaches (so they're not repeated)
- Assumptions made

### 4. Relevant Files
Files touched or important for context, with brief explanations:
```
src/auth/middleware.ts - Added session validation
src/types/user.ts - New User type definition
```

### 5. Current State
- What's working
- What's broken or incomplete
- What was planned but not started

### 6. Ready-to-Use Prompt

Generate a complete prompt that can be pasted into a fresh chat:

```
I'm continuing work on [project]. Here's the context:

[Condensed version of above sections]

Current task: [what to work on next]

Key files to review first:
- [file 1]
- [file 2]
```

## Output Format

Present the handoff document in a code block so it's easy to copy. Keep it concise but complete—a fresh Claude should be able to continue without asking clarifying questions about what was already done.

$ARGUMENTS
