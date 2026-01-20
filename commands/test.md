# Generic Test Runner

Run tests for the current project, regardless of stack.

## Phase 1: Detect Test Framework

Check these files in order to determine the test setup:

| File | Framework Detection |
|------|---------------------|
| `package.json` | Check `scripts.test`, devDependencies for jest/vitest/mocha/playwright |
| `vitest.config.*` | Vitest |
| `jest.config.*` | Jest |
| `wrangler.toml` + `vitest` | Cloudflare Workers with Vitest |
| `pyproject.toml` | Check for pytest in dependencies |
| `pytest.ini` or `conftest.py` | Pytest |
| `Package.swift` | Swift Testing / XCTest |
| `*.xcodeproj` | XCTest via xcodebuild |
| `Cargo.toml` | cargo test |
| `go.mod` | go test |

Report detected framework before running.

## Phase 2: Run Tests

Execute the appropriate command:

```bash
# JavaScript/TypeScript
npm test                    # or yarn test / pnpm test
npx vitest run              # if vitest detected
npx jest                    # if jest detected

# Python
pytest                      # with optional -v for verbose
python -m pytest            # if pytest not in PATH

# Swift
swift test                  # Swift Package Manager
xcodebuild test -scheme X   # Xcode projects

# Rust
cargo test

# Go
go test ./...
```

### Optional Arguments

$ARGUMENTS

Interpret arguments as:
- File path → run tests for that file only
- Pattern → filter tests by name
- `--watch` or `-w` → run in watch mode
- `--coverage` or `-c` → run with coverage
- `--verbose` or `-v` → verbose output

## Phase 3: Parse Results

Extract from output:
- Total tests run
- Passed count
- Failed count
- Skipped count
- Failure details (test name, error message, file location)

## Phase 4: Report

Present results as:

```
Tests: 42 passed, 2 failed, 1 skipped (45 total)

Failures:
1. UserService.test.ts > validateEmail > rejects invalid format
   Expected: false
   Received: true
   Location: src/services/__tests__/UserService.test.ts:47

2. auth.test.ts > login > handles timeout
   Error: Timeout after 5000ms
   Location: src/api/__tests__/auth.test.ts:123
```

If tests fail, offer to investigate and fix the failures.

## Phase 5: Follow-up

If failures exist, ask:
- "Want me to investigate these failures?"
- If yes, read the failing test files and implementation, then propose fixes
