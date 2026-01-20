# Planning Interview

Interview me about the planned work to ensure we have clear requirements before implementation.

## Context
$ARGUMENTS

## Interview Process

Read any existing plan files (plan.md, SPRINT.md, or referenced documents) first.

Then ask detailed questions using AskUserQuestion about:

### Technical Implementation
- How should this integrate with existing code?
- Are there performance constraints?
- What error scenarios need handling?
- Are there security considerations?

### UI/UX (if applicable)
- What should the user experience be?
- How should errors be presented?
- Are there loading/transition states to consider?

### Edge Cases
- What happens when [X] fails?
- How should [boundary condition] be handled?
- What if the user does [unexpected thing]?

### Trade-offs
- Is speed or correctness more important here?
- Build quickly now vs. build for scale?
- Any technical debt we're willing to accept?

### Dependencies
- Does this block or depend on other work?
- Are there external services/APIs involved?
- Who else needs to know about this?

## Question Guidelines

- Ask non-obvious questions—skip things clearly answered in existing docs
- Group related questions together
- Prioritize questions that would change the implementation approach
- Stop when you have enough to proceed confidently

## Output

After the interview, create or update a plan document with:
1. Clear requirements from the interview
2. Proposed implementation approach
3. Key decisions made
4. Open questions (if any remain)

Save to `plan.md` or the appropriate planning document for this project.
