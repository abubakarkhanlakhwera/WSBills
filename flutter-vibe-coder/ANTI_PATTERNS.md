# 🚫 ANTI_PATTERNS.md — Flutter Rejected Patterns
> These patterns were tried and rejected in this project.
> The AI must NEVER suggest these, even if they seem reasonable.
> Add entries after a post-mortem or code review finding.

## Rejected Patterns
- setState for anything beyond local ephemeral UI state
- BuildContext stored across async gaps
- Deeply nested widget trees instead of extracted widgets
- Platform-specific code inline — always use platform channels or packages

## Rejected Libraries
| Library | Why Rejected | Preferred Alternative |
|---------|-------------|----------------------|
| [library] | [reason — e.g., caused memory leaks in prod] | [what to use instead] |

## Rejected Architectural Decisions
| Decision | Why Rejected | What We Do Instead |
|----------|-------------|-------------------|
| [e.g., ORM for raw reporting queries] | Too slow, N+1 | Raw SQL via sqlc/Dapper |

## War Stories (Learn From These)
> Brief incident summaries that justify the anti-patterns above.

### [Date] — [Incident Title]
**What happened:** [1–2 sentences]
**Root cause:** [1 sentence]
**Pattern banned:** [what we banned as a result]

---
*Add new entries at the top with date and context.*
