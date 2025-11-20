---
name: python
description: Python language rules and patterns
globs:
  - "**/*.py"
alwaysApply: false
tags: [python]
---

# Python Rules

## Environment
- **Python**: 3.11+ minimum (3.12+ preferred)
- **Type checking**: mypy --strict mandatory in CI
- **Async**: Use async/await for all I/O operations
- **Virtual environment**: Always use venv/virtualenv

## Type Hints (Required)
- Full type hints on all function signatures
- Use `X | Y` not `Union[X, Y]` (Python 3.10+)
- Enable strict mode in mypy configuration

## Async Patterns
- **Use async for**: HTTP, database, file I/O, external APIs
- **Never async for**: CPU-bound tasks (use ProcessPoolExecutor)
- **Never**: `asyncio.run()` inside running event loop
- **Never**: `time.sleep()` in async code (use `asyncio.sleep()`)
- Use async context managers for resources

## Error Handling
- Create custom exception classes inheriting from built-ins
- Include context in error messages (IDs, values)
- Use `raise NewError() from e` to preserve stack traces
- Always use context managers for resources
- Log with structured context, use `logger.exception()` for stack traces

## Code Organization
- Import order: stdlib, third-party, local (blank line separated)
- Module-level constants in SCREAMING_SNAKE_CASE
- Use early returns to reduce nesting
- Prefix private members with underscore

## Data Structures
- `dataclasses` for simple DTOs without validation
- Pydantic models for validation, API schemas, configuration
- `typing.NamedTuple` for immutable records
- `typing.TypedDict` for structured dicts
- Never pass `dict[str, Any]` - create proper types

## Dependency Injection
- Pass dependencies to `__init__`, never use globals
- Use protocols for dependency interfaces
- Make dependencies explicit in signatures
- Keep dependency graphs shallow (3 levels max)

## Testing
- Use pytest with fixtures for setup
- Mark async tests with `@pytest.mark.asyncio`
- Co-locate tests: `test_module.py` next to `module.py`
- Use Arrange-Act-Assert pattern
- Mock at boundaries (APIs, databases), not internals

## Async Web Frameworks (if applicable)
- Prefer typed models and validation at boundaries
- Group routes by feature; centralize error handling
- Use dependency injection mechanisms where available

## Critical Anti-Patterns

### Never Do This
- Mutable default arguments (`def func(items: list = [])`)
- Bare except clauses (`except:` catches KeyboardInterrupt)
- String concatenation in loops (use `join()`)
- Using `os.path` instead of `pathlib`
- Wildcard imports (`from module import *`)
- Ignoring type errors with `# type: ignore`

### Common Mistakes
- Missing dependencies in function that references external variable
- Creating classes with only `__init__` and one method (use function)
- Not using context managers for file/connection handling
- Mixing `Optional[T]` with `= None` redundantly (just use `T | None = None`)

## Tooling
- **Ruff**: Primary linter (replaces flake8, isort)
- **Black** or **Ruff format**: Code formatting
- **mypy**: Type checking with strict mode
- Run in pre-commit hooks and CI

## Configuration
Use `pyproject.toml` for centralized tool configuration:
- ruff: line-length, select rules
- mypy: strict mode, python version
- pytest: asyncio mode, test paths

## Security (see base)
- Use settings management for config; never commit secrets
- Parameterize SQL; avoid string concatenation

## Performance (see base)
- Prefer comprehensions/generators; avoid quadratic loops
- Cache pure functions with clear invalidation; avoid blocking the event loop

## When in Doubt
1. Check Python docs and PEPs
2. Run mypy strict - it catches most mistakes
3. Follow PEP 8 for style
4. Optimize for readability over cleverness