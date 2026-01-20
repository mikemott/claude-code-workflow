# Test Generator

Generate test scaffolding for code, following project conventions.

## Input

$ARGUMENTS

Interpret as:
- File path → generate tests for that file
- Function/class name → generate tests for that symbol
- No args → generate tests for recently changed files

## Phase 1: Understand Project Test Conventions

Before generating, scan existing tests to learn:

### Structure
- Where do tests live? (`__tests__/`, `*.test.ts`, `*.spec.ts`, `tests/`, `test_*.py`)
- Co-located with source or separate directory?
- Naming convention: `ComponentName.test.tsx` vs `test_component.py`

### Patterns
- Test framework idioms (describe/it, test(), pytest fixtures)
- Common setup/teardown patterns used
- Mocking approach (jest.mock, vitest mock, pytest monkeypatch)
- Assertion style (expect, assert, chai)

### Examples
Read 2-3 existing test files to understand:
- Import patterns
- How similar code is tested
- Level of detail (unit vs integration style)

Report: "Found [X] existing tests using [framework]. Tests are located in [pattern]. Following that convention."

## Phase 2: Analyze Target Code

For the file/function to test:

1. **Identify testable units**
   - Exported functions/classes
   - Public methods
   - Key behaviors and state changes

2. **Identify test cases**
   - Happy path (normal operation)
   - Edge cases (empty input, boundaries)
   - Error cases (invalid input, failures)
   - For async code: success, failure, timeout

3. **Identify dependencies to mock**
   - External API calls
   - Database operations
   - File system access
   - Other services

## Phase 3: Generate Tests

Create test file following project conventions:

```typescript
// Example structure for TypeScript/Jest
import { functionUnderTest } from '../path/to/module'

describe('functionUnderTest', () => {
  describe('happy path', () => {
    it('returns expected result for valid input', () => {
      // Arrange
      const input = { /* realistic test data */ }

      // Act
      const result = functionUnderTest(input)

      // Assert
      expect(result).toEqual(/* expected */)
    })
  })

  describe('edge cases', () => {
    it('handles empty input', () => {
      // ...
    })
  })

  describe('error handling', () => {
    it('throws on invalid input', () => {
      // ...
    })
  })
})
```

### Guidelines
- Use realistic test data, not `foo`/`bar`
- Test behavior, not implementation details
- One assertion per test when possible
- Descriptive test names that explain the scenario
- Include setup comments for complex arrangements

## Phase 4: Write and Verify

1. Write the test file to the appropriate location
2. Run the new tests with `/test [new-test-file]`
3. Report results:
   - If tests pass: "Generated X tests, all passing. Review for completeness."
   - If tests fail: "Generated X tests, Y failing. This likely means the implementation has bugs or my test assumptions were wrong."

## Phase 5: Refinement

Ask:
- "Want me to add more edge cases?"
- "Any specific scenarios I should cover?"
- "Should I adjust the test style?"
