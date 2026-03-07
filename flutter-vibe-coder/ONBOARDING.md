# 🚀 ONBOARDING.md — Flutter New Developer Guide
> Read this on your first day working in this project.
> Generated from the active skill rules — reflects actual project standards.

## What This Project Is
[1–2 sentences describing what this project does and who it's for]

## Tech Stack
| Layer | Technology | Version | Why We Chose It |
|-------|-----------|---------|----------------|
| Language | Dart | 3.22.x | [reason] |
| Framework | Flutter 3.x | — | [reason] |
| Database | N/A (use local packages like Hive/Isar if needed) | — | [reason] |
| Auth | firebase_auth or jwt via HTTP | — | [reason] |
| Deploy | iOS App Store / Google Play / Web | — | [reason] |

## First-Time Setup
```bash
# 1. Clone the repo
git clone [repo-url]
cd [project-name]

# 2. Install dependencies
[install command for this stack]

# 3. Copy environment config
cp .env.example .env
# Edit .env with your local values

# 4. Set up database
[db setup command]

# 5. Run the project
[run command]
```

## How We Work

### Branching Strategy
- `main` — production-ready code only
- `develop` — integration branch
- `feature/TICKET-description` — feature branches off develop
- PRs require 1 review and passing CI before merge

### Code Standards
See SKILL.md and INSTRUCTIONS.md for the full AI-enforced standards.
The key rules:
- Use Riverpod for all state — no setState in business logic
- One feature = one folder under lib/features/
- Widgets receive data via constructor — never reach up to context for business data

### Things We Never Do
- setState for anything beyond local ephemeral UI state
- BuildContext stored across async gaps
- Deeply nested widget trees instead of extracted widgets

## Key Files to Read First
1. `INSTRUCTIONS.md` — condensed coding standards
2. `PATTERNS.md` — approved patterns for this project
3. `ANTI_PATTERNS.md` — what not to do and why
4. `DECISIONS.md` — why key decisions were made
5. `PROJECT_CONTEXT.md` — current project state

## Getting Help
- Check `SESSION_LOG.md` for recent context
- Check `DECISIONS.md` before asking "why do we do X this way?"
- Ask in [team Slack channel / Discord / email]
