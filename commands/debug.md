# Systematic Debugging

Debug the issue using a methodical approach. Don't jump to conclusions.

## The Problem
$ARGUMENTS

## Debugging Process

### Step 1: Hypotheses
List ALL possible causes for what's wrong. Consider:
- Recent changes that could have caused this
- Dependencies or external services
- Environment differences (dev vs prod)
- Edge cases in the data
- Timing/race conditions
- Configuration issues

Don't filter yet—list everything plausible.

### Step 2: Gather Evidence
Before changing any code:
- Read the relevant code thoroughly
- Check error messages and stack traces
- Look at recent commits that touched related files
- Check logs if available

### Step 3: Strategic Logging
Add targeted console.log/print statements to:
- Confirm execution reaches expected points
- Verify variable values at key moments
- Track the actual flow vs expected flow

### Step 4: Test Hypotheses
Work through hypotheses systematically:
1. Start with the most likely cause
2. Gather evidence for or against
3. Eliminate possibilities
4. Move to the next hypothesis

## The Rule of Three
If you try the same approach 3 times without progress, STOP and:
- Revert changes and start fresh
- Try a fundamentally different angle
- Create a minimal reproduction
- Step back and question assumptions

## Escalation Path
If stuck after systematic investigation:
1. Document what was tried and ruled out
2. Identify the specific point where understanding breaks down
3. Propose: revert and take a different approach, OR ask for help with specific questions

## Output
- Explain your reasoning as you go
- When you find the root cause, explain WHY it caused the issue
- Propose a fix and explain why it addresses the root cause
