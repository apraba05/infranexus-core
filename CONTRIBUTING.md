# Contributing to InfraNexus

First off, thank you for considering contributing to InfraNexus! It's people like you that make InfraNexus such a great tool.

## Development Setup

1. Fork and clone the repo.
2. Run the `bash scripts/setup.sh` to initialize environment variables.
3. Install dependencies:
   ```bash
   cd frontend && npm install
   cd ../backend && npm install
   ```
4. Start development components:
   - Database via Docker: `docker-compose up -d db`
   - Express server: `npm run dev` in `backend/`
   - Next.js server: `npm run dev` in `frontend/`

## Branching Strategy

- `main` is the primary branch. All PRs should be targeted towards `main`.
- Create feature branches: `git checkout -b feature/your-feature-name`.
- Create bugfix branches: `git checkout -b fix/your-bug-fix`.

## Pull Request Guidelines

- Ensure any new code is formatted properly and runs through lint checks.
- Add tests for any new behavior.
- Document any changed functionality in `README.md` or the `docs/` folder.
- Before opening a PR, ensure you have squashed your commits into a legible history or at least have a very descriptive PR title.
- PRs that contain sensitive information, API keys, or production `.env` files will be rejected immediately.

## Code Style

- Use `camelCase` for variables and files in TypeScript/JavaScript except where framework conventions dictate otherwise.
- Use explicit types in TypeScript files; avoid `any`.
- Lint with `eslint` using the existing `.eslintrc` rules.

Thank you for contributing!
