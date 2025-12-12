# ESLint Setup with Auto-Fix

This project now has ESLint configured with automatic fixing for code style issues and a Git pre-push hook to ensure code quality.

## Available Scripts

### `npm run lint`
- Runs ESLint and shows all issues (warnings and errors)
- Does not modify any files

### `npm run lint:fix`
- **Automatically fixes** many code style issues including:
  - Missing semicolons
  - Quote style (converts to single quotes)
  - Spacing around objects, arrays, functions
  - Multiple empty lines
  - End-of-file newlines
  - `var` to `const`/`let` conversion
  - **TypeScript-specific fixes:**
    - Removes unnecessary type annotations (`let x: string = 'hello'` → `let x = 'hello'`)
    - Converts type assertions to `as const` where applicable
    - Removes unnecessary type assertions
    - Fixes function spacing and arrow function formatting

### `npm run lint:fix-ts`
- **TypeScript-focused auto-fix** for specific TypeScript issues
- Targets TypeScript-specific rules for better code quality

### `npm run lint:fix-unused`
- Runs `lint:fix` and provides guidance for unused variables
- Shows helpful message about prefixing unused variables with underscore (`_`)

### `npm run lint:check`
- Runs ESLint with zero tolerance for warnings
- Used in the Git pre-push hook
- Will fail the build if any warnings remain

## Git Pre-Push Hook

The Git pre-push hook automatically:

1. **Runs auto-fix** (`npm run lint:fix`)
   - Fixes formatting issues automatically
   - Commits the changes if any were made

2. **Checks for remaining issues** (`npm run lint:check`)
   - Ensures no warnings or errors remain
   - Blocks the push if issues are found

3. **Provides guidance**
   - Shows helpful messages about what to fix manually

## How to Handle Unused Variables

If you have unused variables that ESLint warns about, you have several options:

### Option 1: Prefix with underscore (recommended for intentionally unused)
```typescript
// Before
const response = await api.call();
const data = response.data; // unused

// After  
const response = await api.call();
const _data = response.data; // ESLint ignores variables starting with _
```

### Option 2: Remove if truly not needed
```typescript
// Before
import { Given, When, Then } from '@cucumber/cucumber'; // not all used

// After
import { Given } from '@cucumber/cucumber'; // only import what you use
```

### Option 3: Use for error handling
```typescript
// Before
} catch (e) { // unused parameter

// After
} catch (_e) { // or just catch without parameter: } catch {
```

## Configuration

- **ESLint Config**: `eslint.config.js` 
- **Git Hook**: `.husky/pre-push`
- **Package Scripts**: `package.json`

## Benefits

- **Consistent code style** across the project
- **Automatic formatting** before every Git push
- **Catches potential issues** before they reach the repository
- **Improved code quality** and readability
- **Reduced manual formatting** work

## Troubleshooting

If the pre-push hook fails:

1. Run `npm run lint:fix` to auto-fix issues
2. Manually fix remaining warnings (usually unused variables)
3. Commit your changes
4. Try pushing again

To temporarily skip the hook (not recommended):
```bash
git push --no-verify
```