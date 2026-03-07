# 🗺️ MASTER_INSTRUCTIONS.md — v2.0.0
> **Single entry point for full-stack projects using multiple Vibe Coder skills.**
> Drop this file in the root of any project. The AI reads it first, every session, no exceptions.
> It tells the AI which skill governs which layer, what rules apply everywhere, and how to behave across the whole stack.

---

## 🧠 How the AI Must Use This File

1. **Read this file first** — before reading any skill file, before writing any code
2. **Identify the task layer** — use the Skill Routing Table below to pick the right skill(s)
3. **Read the skill's INSTRUCTIONS.md** — load the rules for the relevant layer only
4. **Apply cross-skill rules** — the rules in this file override all individual skill rules
5. **Stay in one lane** — do not switch skills mid-response; finish one layer at a time
6. **Update SESSION_LOG.md** — at the end of every session, no matter which skill was active

---

## 📦 Skills in This Collection

| # | Skill | Folder | Framework | Language |
|---|-------|--------|-----------|----------|
| 1 | Flutter | `flutter-vibe-coder/` | Flutter 3.x | Dart |
| 2 | FastAPI | `fastapi-vibe-coder/` | FastAPI + Pydantic v2 | Python 3.11+ |
| 3 | Node.js Backend | `nodejs-backend-vibe-coder/` | Express + Zod | TypeScript / Node.js 20+ |
| 4 | .NET MAUI | `dotnet-maui-vibe-coder/` | .NET MAUI + CommunityToolkit | C# 12 / .NET 8+ |
| 5 | Tauri | `tauri-vibe-coder/` | Tauri v2 + Vite | Rust + TypeScript |
| 6 | React Native | `react-native-vibe-coder/` | React Native 0.73+ + Expo | TypeScript |
| 7 | Electron | `electron-vibe-coder/` | Electron 30+ + Vite | TypeScript |
| 8 | Kotlin Multiplatform | `kotlin-multiplatform-vibe-coder/` | KMP + Compose Multiplatform | Kotlin 2.x |
| 9 | Next.js | `nextjs-vibe-coder/` | Next.js 14+ App Router | TypeScript |
| 10 | SvelteKit | `sveltekit-vibe-coder/` | SvelteKit 2 + Svelte 5 | TypeScript |
| 11 | Vue + Nuxt | `vue-nuxt-vibe-coder/` | Nuxt 3 + Vue 3 | TypeScript |
| 12 | Django REST | `django-rest-vibe-coder/` | Django 5.x + DRF | Python 3.12+ |
| 13 | NestJS | `nestjs-vibe-coder/` | NestJS 10+ | TypeScript |
| 14 | Go + Gin | `go-gin-vibe-coder/` | Gin Web Framework | Go 1.22+ |
| 15 | Spring Boot | `spring-boot-vibe-coder/` | Spring Boot 3.x | Java 21 / Kotlin |
| 16 | LangChain | `langchain-vibe-coder/` | LangChain 0.2+ / LangGraph | Python 3.11+ |
| 17 | Streamlit | `streamlit-vibe-coder/` | Streamlit 1.35+ | Python 3.11+ |
| 18 | dbt | `dbt-vibe-coder/` | dbt Core / dbt Cloud | SQL / Jinja |
| 19 | Terraform | `terraform-vibe-coder/` | Terraform 1.x | HCL |
| 20 | Docker + Compose | `docker-compose-vibe-coder/` | Docker 25+ / Compose v2 | Dockerfile / YAML |
| 21 | Context7 | `context7-vibe-coder/` | Context7 MCP | Always active |
| 22 | JavaScript | `javascript-vibe-coder/` | Vanilla JS / TypeScript ES2024+ | JavaScript / TypeScript |

---

## 🚦 Skill Routing Table
> The AI uses this to decide which INSTRUCTIONS.md to read based on what you're working on.
> When in doubt, ask — never assume and apply the wrong skill's rules.

| If the task involves... | Read this skill |
|------------------------|----------------|
| React/Next.js pages, RSC, Server Actions, layouts | `nextjs-vibe-coder/INSTRUCTIONS.md` |
| SvelteKit pages, load functions, form actions | `sveltekit-vibe-coder/INSTRUCTIONS.md` |
| Vue components, Nuxt pages, composables | `vue-nuxt-vibe-coder/INSTRUCTIONS.md` |
| Flutter widgets, Dart, mobile/web UI | `flutter-vibe-coder/INSTRUCTIONS.md` |
| React Native screens, Expo, mobile UI | `react-native-vibe-coder/INSTRUCTIONS.md` |
| .NET MAUI pages, ViewModels, XAML | `dotnet-maui-vibe-coder/INSTRUCTIONS.md` |
| Electron main/renderer/preload, IPC | `electron-vibe-coder/INSTRUCTIONS.md` |
| Tauri commands, Rust backend, desktop | `tauri-vibe-coder/INSTRUCTIONS.md` |
| Kotlin shared modules, Android + iOS | `kotlin-multiplatform-vibe-coder/INSTRUCTIONS.md` |
| FastAPI routes, Pydantic schemas, Python API | `fastapi-vibe-coder/INSTRUCTIONS.md` |
| Express routes, Node.js services, TypeScript API | `nodejs-backend-vibe-coder/INSTRUCTIONS.md` |
| Django views, DRF serializers, ORM | `django-rest-vibe-coder/INSTRUCTIONS.md` |
| NestJS modules, controllers, DI | `nestjs-vibe-coder/INSTRUCTIONS.md` |
| Go handlers, Gin routes, services | `go-gin-vibe-coder/INSTRUCTIONS.md` |
| Spring Boot controllers, JPA, Java/Kotlin | `spring-boot-vibe-coder/INSTRUCTIONS.md` |
| LLM chains, RAG, agents, LangGraph | `langchain-vibe-coder/INSTRUCTIONS.md` |
| Streamlit pages, widgets, data apps | `streamlit-vibe-coder/INSTRUCTIONS.md` |
| dbt models, sources, tests, YAML | `dbt-vibe-coder/INSTRUCTIONS.md` |
| Terraform modules, resources, HCL | `terraform-vibe-coder/INSTRUCTIONS.md` |
| Dockerfile, docker-compose.yml, containers | `docker-compose-vibe-coder/INSTRUCTIONS.md` |
| Vanilla JS, TypeScript, browser APIs, DOM, Vite, Web Workers | `javascript-vibe-coder/INSTRUCTIONS.md` |
| Any library API, any version-sensitive code | `context7-vibe-coder/INSTRUCTIONS.md` ← **always** |

---

## ⚡ Session Start Ritual (Every Session, No Exceptions)

```
1. Read MASTER_INSTRUCTIONS.md  ← this file
2. Read PROJECT_CONTEXT.md      ← current project state, task, known issues
3. Identify task layer           ← use Skill Routing Table above
4. Read skill INSTRUCTIONS.md   ← load rules for the active layer
5. Read STACK_VERSIONS.md       ← get pinned versions
6. Resolve Context7              ← use context7 → resolve-library-id for active libs
7. Ask ONE clarifying question   ← only if task is genuinely ambiguous
8. Start work
```

> If PROJECT_CONTEXT.md has not been filled in, stop and ask the developer to fill it in first.
> A session without context is a session that produces the wrong output.

---

## 🔗 Cross-Skill Rules (Override All Individual Skill Rules)

These rules apply across every layer, every file, every session.
No individual skill can contradict these.

### Context & Documentation
- **Context7 is always on** — resolve library docs before writing any library-specific code, in any language, in any layer
- **STACK_VERSIONS.md is the source of truth** — use its versions when resolving Context7 docs, not latest
- **PROJECT_CONTEXT.md must be read first** — never start work without knowing the current task and known issues

### Code Quality
- **One thing at a time** — never refactor one layer while building a feature in another
- **No cross-layer refactoring** — if you spot a backend issue while working on frontend, note it in SESSION_LOG.md and move on
- **Minimum viable change** — make the smallest change that accomplishes the task; no bonus improvements
- **Never rewrite working code** across any layer without explicit permission

### API Contracts
- **Consistent error shape across all services:**
  ```json
  { "error": { "code": "ERROR_CODE", "message": "Human readable message" } }
  ```
- **Consistent success shape for list endpoints:**
  ```json
  { "data": [...], "meta": { "total": 0, "page": 1, "pageSize": 20 } }
  ```
- **Never break an existing API contract** without updating all consumers and noting in DECISIONS.md

### Security (All Layers)
- Never hardcode secrets, API keys, tokens, or credentials in any file in any layer
- Never log sensitive data (passwords, tokens, PII, payment info) in any layer
- Validate all user input at the layer that receives it — never trust upstream validation alone
- Use HTTPS/TLS everywhere — no plain HTTP in any production service

### Logging & Observability
- Structured JSON logging in all backend services — never plain text console output in production
- Consistent log fields across services: `{ "level", "timestamp", "service", "message", "traceId" }`
- Every API request gets a `traceId` — propagated via headers between services

### Session Hygiene
- **SESSION_LOG.md updated at end of every session** — what changed, what was decided, next step
- **DECISIONS.md updated** when any non-obvious architectural choice is made
- **CHANGELOG.md updated** for every user-facing or API-facing change
- **Never end a session without ➡️ Next step**

---

## 🏗️ Full-Stack Project Templates
> Copy the relevant template into your own project's MASTER_INSTRUCTIONS.md.
> Delete skills you don't use. Add your project-specific cross-skill rules below.

### Template A — Next.js SaaS (Frontend + Backend + Infra)
```
Active Skills:
  Frontend  → nextjs-vibe-coder/INSTRUCTIONS.md
  Backend   → fastapi-vibe-coder/INSTRUCTIONS.md   (or nodejs-backend-vibe-coder)
  Infra     → docker-compose-vibe-coder/INSTRUCTIONS.md
  Cloud     → terraform-vibe-coder/INSTRUCTIONS.md
  Always    → context7-vibe-coder/INSTRUCTIONS.md

Project-Specific Cross-Skill Rules:
  - API base URL: all frontend fetches go to /api/v1/
  - Auth token: stored in httpOnly cookie, passed as Bearer in API calls
  - All mutations go through Server Actions — no client-side POST to /api
```

### Template B — Mobile App (React Native + Node.js API)
```
Active Skills:
  Mobile    → react-native-vibe-coder/INSTRUCTIONS.md
  Backend   → nodejs-backend-vibe-coder/INSTRUCTIONS.md
  Infra     → docker-compose-vibe-coder/INSTRUCTIONS.md
  Always    → context7-vibe-coder/INSTRUCTIONS.md

Project-Specific Cross-Skill Rules:
  - API versioning: /api/v1/ for all routes
  - Auth: JWT stored in expo-secure-store on mobile, validated in Node middleware
  - Push notifications: Expo push tokens stored in users table
```

### Template C — Desktop App (Tauri + FastAPI)
```
Active Skills:
  Desktop   → tauri-vibe-coder/INSTRUCTIONS.md
  Backend   → fastapi-vibe-coder/INSTRUCTIONS.md
  Always    → context7-vibe-coder/INSTRUCTIONS.md

Project-Specific Cross-Skill Rules:
  - Local API runs on localhost:8000, started by Tauri sidecar
  - IPC for OS-level features (file system, tray), HTTP for business logic
  - All sensitive config in Tauri keychain — never in FastAPI config files
```

### Template D — Data Platform (dbt + Streamlit + LangChain)
```
Active Skills:
  Transform → dbt-vibe-coder/INSTRUCTIONS.md
  Dashboard → streamlit-vibe-coder/INSTRUCTIONS.md
  AI Layer  → langchain-vibe-coder/INSTRUCTIONS.md
  Infra     → docker-compose-vibe-coder/INSTRUCTIONS.md
  Always    → context7-vibe-coder/INSTRUCTIONS.md

Project-Specific Cross-Skill Rules:
  - dbt marts are the single source of truth — Streamlit reads from marts only
  - LangChain retrieves from vector store built on dbt mart data
  - All Streamlit secrets via .streamlit/secrets.toml
```

### Template E — Enterprise Monorepo (Spring Boot + Next.js + Terraform)
```
Active Skills:
  Frontend  → nextjs-vibe-coder/INSTRUCTIONS.md
  Backend   → spring-boot-vibe-coder/INSTRUCTIONS.md
  Cloud     → terraform-vibe-coder/INSTRUCTIONS.md
  Infra     → docker-compose-vibe-coder/INSTRUCTIONS.md
  Always    → context7-vibe-coder/INSTRUCTIONS.md

Project-Specific Cross-Skill Rules:
  - Spring Security OAuth2 resource server — Next.js passes Bearer token on every API call
  - DTOs only in REST responses — never JPA entities
  - Terraform manages all AWS resources — no manual console changes
```

### Template F — Flutter Mobile + NestJS API
```
Active Skills:
  Mobile    → flutter-vibe-coder/INSTRUCTIONS.md
  Backend   → nestjs-vibe-coder/INSTRUCTIONS.md
  Infra     → docker-compose-vibe-coder/INSTRUCTIONS.md
  Always    → context7-vibe-coder/INSTRUCTIONS.md

Project-Specific Cross-Skill Rules:
  - Dio for all HTTP in Flutter — typed response models from shared contract
  - NestJS returns camelCase JSON — Flutter deserializes with json_serializable
  - Auth: JWT in flutter_secure_storage, refreshed via NestJS /auth/refresh
```

### Template G — Electron Desktop + Go API
```
Active Skills:
  Desktop   → electron-vibe-coder/INSTRUCTIONS.md
  Backend   → go-gin-vibe-coder/INSTRUCTIONS.md
  Always    → context7-vibe-coder/INSTRUCTIONS.md

Project-Specific Cross-Skill Rules:
  - Go API runs as a local sidecar process managed by Electron main process
  - IPC for system features, HTTP to localhost for all business logic
  - Credentials stored via keytar in Electron — never passed to Go process directly
```

---

## 💬 Prompt Patterns for Multi-Skill Sessions

### Start a session
```
Read MASTER_INSTRUCTIONS.md and PROJECT_CONTEXT.md.
My task: [describe task].
Active skills: [skill-1], [skill-2], context7.
```

### Switch layers mid-session
```
Switching to [backend / frontend / infra].
Read [skill-folder]/INSTRUCTIONS.md for this part.
```

### Full-stack feature (end to end)
```
Read MASTER_INSTRUCTIONS.md.
Build [feature] end-to-end: [frontend layer] + [backend layer].
Follow each layer's INSTRUCTIONS.md. Do frontend first, then backend.
```

### Debug a cross-layer issue
```
Read MASTER_INSTRUCTIONS.md.
I have a bug that crosses [frontend] and [backend].
Read both skills' INSTRUCTIONS.md before diagnosing.
Use the debugging protocol from each skill's INSTRUCTIONS.md.
```

### Architecture decision
```
Read MASTER_INSTRUCTIONS.md and DECISIONS.md.
I need to decide [decision topic].
Consider the cross-skill rules and existing decisions before recommending.
Log the decision in DECISIONS.md when done.
```

### End-of-session wrap-up
```
Session complete. Update SESSION_LOG.md with:
- what was changed (files + summary)
- decisions made (log in DECISIONS.md too if architectural)
- any new anti-patterns discovered (add to ANTI_PATTERNS.md)
- next step
```

---

## 🚫 Hard Rules — Never Break Across Any Skill

- ❌ Never apply skill A's rules to skill B's code
- ❌ Never start work without reading PROJECT_CONTEXT.md
- ❌ Never skip Context7 for library-specific code in any layer
- ❌ Never break the cross-skill error shape contract
- ❌ Never end a session without updating SESSION_LOG.md
- ❌ Never make changes in two layers simultaneously in one response
- ❌ Never suggest a cross-layer architectural change without logging it in DECISIONS.md
- ❌ Never hardcode credentials or secrets in any file in any layer

---

## 📋 New Project Setup Checklist

When starting a new project with multiple skills:

- [ ] Copy this file to project root as `MASTER_INSTRUCTIONS.md`
- [ ] Choose a template from "Full-Stack Project Templates" above and paste it at the bottom
- [ ] Delete unused skills from the routing table
- [ ] Fill in `PROJECT_CONTEXT.md` in each active skill folder
- [ ] Fill in `STACK_VERSIONS.md` with actual pinned versions
- [ ] Fill in `PERSONA.md` with preferred AI communication style
- [ ] Add project-specific cross-skill rules in the section below
- [ ] Commit everything — first AI session starts only after this checklist is done

---

## 🔧 YOUR Project-Specific Cross-Skill Rules
> Replace this section with rules specific to your project.
> These override everything above.

```yaml
Project Name      : [your project name]
Active Skills     : [list only the skills this project uses]
API Base URL      : [e.g. https://api.yourproject.com/v1]
Auth Mechanism    : [JWT / OAuth2 / Session cookie / API key]
Monorepo Layout   : [e.g. apps/web, apps/api, packages/shared]
Shared Types Path : [path to shared type definitions if any]
Feature Flags     : [how feature flags work in this project]
Release Process   : [how releases are cut and deployed]
Special Rules     :
  - [rule 1 specific to this project]
  - [rule 2 specific to this project]
```

---

## 🔢 Version

```
MASTER_INSTRUCTIONS.md : v2.0.0
Skills collection      : v1.0.0
Last updated           : [YYYY-MM-DD]
Updated by             : [name or "AI"]
Change reason          : [why this file was updated]
```

> When you update this file, bump the version and log in `SKILL_CHANGELOG.md`.
