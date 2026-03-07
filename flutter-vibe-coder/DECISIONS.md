# 🏛️ DECISIONS.md — Flutter Architecture Decision Records
> Every non-obvious technical decision gets a one-liner entry here.
> Future you (and the AI) will thank present you.

## Format
```
| Date       | Decision | Why | Alternatives | Decided By |
```

## Active Decisions

| Date | Decision | Why | Alternatives Considered | Decided By |
|------|----------|-----|------------------------|------------|
| [YYYY-MM-DD] | Use Flutter 3.x | [reason] | [other options] | [team/person] |
| [YYYY-MM-DD] | [N/A (use local packages like Hive/Isar if needed) for persistence] | [reason] | [alternatives] | [team/person] |
| [YYYY-MM-DD] | [firebase_auth or jwt via HTTP for auth] | [reason] | [alternatives] | [team/person] |
| 2026-03-08 | Use Supabase read-only queries without auth for bill lookup | Product requires no login and read-only access | Add auth flow, custom backend proxy | Copilot |
| 2026-03-08 | Keep bill search model keyed to `connection_number`, `mobile_number`, and `name` | Matches required lookup UX and Supabase query plan | Single free-text search only | Copilot |
| 2026-03-08 | Source Supabase URL/anon key from `.env` via `flutter_dotenv` | Avoid hardcoded credentials in codebase | Hardcoded constants, compile-time defines only | Copilot |

## Superseded Decisions

| Date | Original Decision | Superseded By | Reason for Change |
|------|-----------------|--------------|--------------------|
| [YYYY-MM-DD] | [old decision] | [new decision] | [why it changed] |

## Pending Decisions (Under Discussion)

| Topic | Options | Deadline | Owner |
|-------|---------|----------|-------|
| [e.g., caching strategy] | [Redis vs in-memory vs CDN] | [date] | [person] |

---
*Keep entries brief — this is a log, not an essay.*
*If a decision needs more explanation, link to a doc or PR.*
