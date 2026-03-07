# 🚀 FLUTTER_PROJECT_PLAN.md — v2.0.0
> **Universal Flutter App Planning Template — Enhanced Edition**
> Integrated with: `flutter-vibe-coder` skill kit · `MASTER_INSTRUCTIONS.md` · GitHub Spec Kit
>
> ──────────────────────────────────────────────────────────────────
> **FOR THE VIBE CODER — HOW TO USE THIS FILE:**
> 1. Copy this file into the root of every new Flutter project
> 2. Fill in every `[placeholder]` — write "not needed" if truly not needed
> 3. Drop it next to your `flutter-vibe-coder/` skill folder
> 4. Paste the whole file to your agent as your FIRST message
> 5. Say: *"Read this entire plan + all skill files in the Boot Sequence. Build A to Z."*
> ──────────────────────────────────────────────────────────────────

---

# 🤖 AGENT BOOT SEQUENCE
> You are a senior Flutter engineer. Do these steps IN ORDER before writing a single line of code.
> Skipping any step = wrong output = rework for the developer.

```
STEP 1  → Read THIS file completely (FLUTTER_PROJECT_PLAN.md)
STEP 2  → Read MASTER_INSTRUCTIONS.md              ← cross-skill rules that override everything
STEP 3  → Read flutter-vibe-coder/SKILL.md         ← your core Flutter mindset & hard rules
STEP 4  → Read flutter-vibe-coder/INSTRUCTIONS.md  ← condensed coding standards, always active
STEP 5  → Read flutter-vibe-coder/PATTERNS.md      ← approved patterns, always prefer these
STEP 6  → Read flutter-vibe-coder/ANTI_PATTERNS.md ← banned patterns, never do these
STEP 7  → Read flutter-vibe-coder/SECURITY.md      ← security rules, every item non-negotiable
STEP 8  → Read flutter-vibe-coder/PERFORMANCE.md   ← performance rules, check before any data code
STEP 9  → Read flutter-vibe-coder/STACK_VERSIONS.md ← pinned versions, update after install
STEP 10 → Read flutter-vibe-coder/PROJECT_CONTEXT.md ← current task, known issues, sprint goal
STEP 11 → Read flutter-vibe-coder/SNIPPETS.md      ← use approved snippets before generating fresh
STEP 12 → Use Context7 to resolve docs for every active library (see Section 14)
STEP 13 → Confirm you read everything. List what you'll build in order. Then start.
```

> ⛔ If `PROJECT_CONTEXT.md` is not filled in → STOP and ask the developer to fill it in first.
> A session without context produces the wrong output.

---

# ❓ AGENT PROBLEM PROTOCOL — When You Hit a Blocker

> **MANDATORY RULE**: If at any point during this project you encounter a problem, ambiguity,
> conflict, or a decision point where multiple valid paths exist — **STOP IMMEDIATELY**.
> Do NOT silently choose one path. Do NOT guess and continue. Do NOT bury a question at
> the end of a code block. Use this exact format and wait for the developer's answer.

```
🚧 BLOCKER — I need your input before I can continue

What I was doing   : [one sentence — the exact task you were working on]
What the problem is: [one sentence — be specific: name the file, widget, or concept]

Here are your options:

Option A: [Short descriptive label — e.g., "Use Riverpod AsyncNotifier"]
  What it does    : [1–2 sentences explaining this approach]
  Pros            : • [specific pro 1]  • [specific pro 2]
  Cons            : • [specific con 1]
  Best when       : [one line — when is this the right call for a Flutter project]
  Recommendation  : ⭐ RECOMMENDED  /  ✅ GOOD  /  ⚠️ LAST RESORT

Option B: [Short descriptive label]
  What it does    : [1–2 sentences]
  Pros            : • [pro 1]  • [pro 2]
  Cons            : • [con 1]
  Best when       : [one line]
  Recommendation  : ⭐ RECOMMENDED  /  ✅ GOOD  /  ⚠️ LAST RESORT

Option C: [Short descriptive label]
  What it does    : [1–2 sentences]
  Pros            : • [pro 1]
  Cons            : • [con 1]  • [con 2]
  Best when       : [one line]
  Recommendation  : ⭐ RECOMMENDED  /  ✅ GOOD  /  ⚠️ LAST RESORT

Option D: Ask me to clarify the requirement
  What it does    : You give me more context; I redesign the approach based on your answer.
  Best when       : The problem exists because the requirement was unclear or has changed.
  Recommendation  : Always valid — never wrong to ask first.

➡️ Your call: Reply A, B, C, or D — or describe a custom approach.
   I will NOT write any more code until you answer.
```

## When This Protocol MUST Activate

| Situation | Flutter Example |
|-----------|----------------|
| Architecture decision | "Should this state live in Riverpod or be local with setState?" |
| Package conflict | "Package X requires Flutter 3.19 but we're on 3.22 — 3 alternatives" |
| Missing requirement | "Section 5 lists this screen but Section 6 has no spec for it" |
| Ambiguous business rule | "Should deleting a category also delete its products?" |
| Security trade-off | "Storing this in SharedPreferences is easier but insecure" |
| Performance trade-off | "Fetching all records is simpler but will break for large datasets" |
| Multiple valid patterns | "I can implement this 3 ways — each fits your architecture differently" |
| Scope creep detected | "To add X I'd also need to refactor Y and Z — is that in scope?" |
| Platform inconsistency | "This works on Android but the iOS behavior is different — which wins?" |
| Offline conflict | "The sync strategy wasn't defined for this edge case — what should win?" |

## What the Agent Must NEVER Do
- ❌ Silently pick an option and continue building without asking
- ❌ Say "I chose Riverpod because..." after already generating 200 lines of code
- ❌ Present only one option when multiple valid Flutter approaches exist
- ❌ Stack multiple blocker questions — resolve one blocker completely, then continue
- ❌ Ask the question in a comment inside a code block — stop the response and ask clearly

---

# 1️⃣ PROJECT IDENTITY

```yaml
App Name        : [e.g., POS System / ShopTrack / MyApp]
One-Line Desc   : [e.g., A multi-platform point-of-sale app for general stores]
Version         : 1.0.0
Environment     : development          # development | staging | production
Language        : Dart
Framework       : Flutter 3.22.x
```

## Full Description
[Write 3–5 sentences. What does the app do? Who is it for? What problem does it solve?]
[Example: "A complete POS system for small shop owners. Handles products, sales, inventory,
customers, and reports. Works on Android, iOS, and Web simultaneously. Syncs data when online
and works fully offline when there is no internet."]

## Who Uses This App
| Role | What They Can Do | Screen Access | Notes |
|------|-----------------|---------------|-------|
| [e.g., Admin] | [Full access — settings, users, reports, everything] | All screens | Can create/delete users |
| [e.g., Cashier] | [POS screen and billing only] | POS, Customers (view) | Cannot see reports |
| [e.g., Manager] | [Products, inventory, reports — no user management] | Most except Users | View-only for some |

> ⚠️ Every role must appear in the Role-Gated Screens table in Section 5.
> Every protected route must check role — authentication alone is not authorization.

## App Feel & Mood
```yaml
Style        : [Professional / Casual / Bold / Minimal]
Touch-First  : [Yes — large 48px+ buttons / No — keyboard-first web]
Dark Mode    : [Yes / No / Optional toggle in settings]
Primary Color: [hex — e.g., #1565C0]
Accent Color : [hex — e.g., #FF6D00]
Font         : [e.g., Inter / Roboto / default Material 3]
Icon Style   : [Material Icons / Phosphor / Lucide]
```

## Success Criteria (Definition of Done)
```yaml
# How do we know the app is complete and correct?
- [e.g., Admin can log in, add a product, create a sale, and view the sales report]
- [e.g., Cashier can complete a full sale flow in under 30 seconds]
- [e.g., App works fully offline and syncs correctly when reconnected]
- [e.g., All screens tested on Android, iOS, and Web]
```

---

# 2️⃣ ACTIVE SKILLS FOR THIS PROJECT
> Based on MASTER_INSTRUCTIONS.md. Delete rows you don't need. Add rows for extra layers.

| Layer | Skill File to Load | When to Activate |
|-------|--------------------|--------------------|
| Flutter UI / Mobile / Web | `flutter-vibe-coder/INSTRUCTIONS.md` | All Flutter/Dart code |
| Backend API | `[nodejs-backend / nestjs / fastapi]-vibe-coder/INSTRUCTIONS.md` | API, services, DB |
| Containers | `docker-compose-vibe-coder/INSTRUCTIONS.md` | Docker setup, deployment |
| Context7 | `context7-vibe-coder/INSTRUCTIONS.md` | **Always on** — every library call |

## Cross-Skill Contract for This Project
> These rules come from MASTER_INSTRUCTIONS.md and override individual skill rules.

```yaml
API Base URL   : https://[your-api-domain]/api/v1
Auth Mechanism : JWT — stored in flutter_secure_storage (NEVER SharedPreferences)

# All API responses MUST follow this shape — enforced by MASTER_INSTRUCTIONS.md
Success Single : { "data": { ...item }, "message": "ok" }
Success List   : { "data": [...], "meta": { "total": 100, "page": 1, "pageSize": 20 } }
Error Shape    : { "error": { "code": "ERROR_CODE", "message": "Human readable message" } }

# Logging — backend services (MASTER_INSTRUCTIONS.md rule)
Log Format     : structured JSON { level, timestamp, service, message, traceId }
TraceId        : every API request gets a traceId, propagated via x-trace-id header

# Layer discipline (MASTER_INSTRUCTIONS.md hard rule)
One layer at a time: never refactor backend while building Flutter UI
If you spot a backend issue while on Flutter — note in SESSION_LOG.md, move on
```

---

# 3️⃣ PLATFORMS

| Platform | Build? | Layout Style | Min Version | Notes |
|----------|--------|-------------|-------------|-------|
| Android | ✅ Yes | Bottom nav + stack | SDK 24 (Android 7) | Primary selling device |
| iOS | ✅ Yes | Bottom nav + stack | iOS 14 | |
| Web (Flutter Web) | ✅ Yes | Sidebar nav + 2-column | Any modern browser | Admin & reporting |
| Desktop (macOS/Win) | ❌ No | — | — | Change if needed |

> ⚠️ Agent: If a feature works differently between platforms, use the Problem Protocol.
> Never silently implement platform-specific behavior without developer approval.

---

# 4️⃣ TECH STACK & PINNED VERSIONS
> ⚠️ After `flutter pub get`, copy exact installed versions into `STACK_VERSIONS.md`.
> Then use Context7 to resolve docs at those exact versions — never trust training memory for APIs.

## Core Stack
```yaml
flutter   : 3.22.x
dart      : 3.5.x
```

## pubspec.yaml — Approved Libraries
> Pre-approved per `PATTERNS.md`. Do NOT add packages without asking the developer first.
> If a package not listed here is needed → use Agent Problem Protocol before adding it.

```yaml
dependencies:
  flutter:
    sdk: flutter

  # State Management — Riverpod (approved in PATTERNS.md, banned: setState for logic)
  flutter_riverpod: ^2.5.x
  riverpod_annotation: ^2.3.x

  # Navigation — GoRouter typed routes (approved in PATTERNS.md)
  go_router: ^14.x.x

  # HTTP Client — Dio with interceptors (approved in PATTERNS.md)
  dio: ^5.x.x

  # Token/Secret Storage — REQUIRED by SECURITY.md, never use SharedPreferences for secrets
  flutter_secure_storage: ^9.x.x

  # Environment Config — REQUIRED by SECURITY.md
  flutter_dotenv: ^5.x.x

  # Models — Freezed + json_serializable
  freezed_annotation: ^2.x.x
  json_annotation: ^4.x.x

  # Local DB for Offline — choose ONE, delete others
  # hive_flutter: ^1.x.x    ← fast key-value, simple, good for small datasets
  # isar: ^3.x.x            ← powerful, typed, Riverpod-friendly, better for complex data
  # sqflite: ^2.x.x         ← relational, best for complex queries and reporting

  # Connectivity
  connectivity_plus: ^6.x.x      ← offline detection

  # UI Helpers
  cached_network_image: ^3.x.x   ← all network images go through this — never raw Image.network
  intl: ^0.19.x                  ← date & currency formatting — never manual string formatting
  shimmer: ^3.x.x                ← loading skeleton for all list screens

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.x.x
  build_runner: ^2.x.x
  freezed: ^2.x.x
  json_serializable: ^6.x.x
  riverpod_generator: ^2.x.x
```

## Backend Stack
```yaml
Framework  : [Node.js + Express / NestJS / FastAPI / Django REST]
Language   : [TypeScript / Python]
Database   : [PostgreSQL / MySQL / MongoDB]
ORM        : [Prisma / TypeORM / SQLAlchemy]
Auth       : [JWT with bcrypt / Firebase Auth]
Deploy     : Docker + docker-compose
```

## Adding a Package Not in This List
> If you need a package not listed above, use the Agent Problem Protocol:
> - State what you need and why
> - List 2–3 alternative packages with trade-offs
> - Wait for developer approval before adding to pubspec.yaml

---

# 5️⃣ ALL SCREENS — COMPLETE LIST
> ⚠️ List every screen. Agents skip what you don't mention. "Not needed" is a valid answer.
> Every screen listed here MUST have a Feature Spec in Section 6.

## Auth Screens
- [ ] Splash Screen — check token validity, auto-redirect to Dashboard or Login
- [ ] Login Screen — email + password form
- [ ] Forgot Password Screen — [needed / not needed]
- [ ] Reset Password Screen — [needed / not needed] (deep link from email)
- [ ] Change Password Screen — accessible from Settings (requires current password)

## Main App Screens
- [ ] Dashboard / Home — [describe: e.g., daily summary cards, low stock alerts, quick actions]
- [ ] [Screen Name] — [one line: what it shows + what the user does]
- [ ] [Screen Name] — [one line description]
- [ ] [Screen Name] — [one line description]
- [ ] [Screen Name] — [one line description]
- [ ] Settings Screen — [what settings: store info, theme, currency, language, logout]
- [ ] Profile / Account Screen — name, email, avatar, change password button
- [ ] Notifications Screen — [needed / not needed]

## Dialogs & Modals (every one is required — no exceptions)
- [ ] Confirm Delete dialog — standard across ALL destructive actions
- [ ] Loading overlay — blocks interaction during critical async operations
- [ ] Error / Retry dialog — for network failures that block the screen from loading
- [ ] Session Expired dialog — shown when JWT expires mid-session
- [ ] [Feature-specific modal — e.g., Payment dialog / Barcode scanner sheet / Receipt preview]

## Empty States (every list screen needs one)
> Every screen with a list MUST have a designed empty state — not a blank white screen.

| Screen | Empty State Message | CTA Button |
|--------|-------------------|------------|
| [Screen 1] | "No [items] yet." | "Add your first [item]" |
| [Screen 2] | "Nothing found for '[search]'." | "Clear search" |

## Role-Gated Screens
> GoRouter `redirect` reads role from JWT claim and blocks access silently.
> Redirect to Dashboard with "Access denied" SnackBar — never crash or show raw error.

| Screen | Roles Allowed | Redirect Destination |
|--------|--------------|---------------------|
| [e.g., User Management] | admin only | Dashboard |
| [e.g., Reports] | admin, manager | Dashboard |
| [e.g., POS / Main Feature] | all roles | — |

---

# 6️⃣ FEATURES — DETAILED SPEC
> One block per feature. Fill all fields. Agents miss what you don't write.
> ⚠️ Build features one at a time — finish one completely before starting the next (SKILL.md rule).
> ⚠️ If a feature spec is missing a field → Agent must use Problem Protocol, not guess.

---

## 🔐 Feature: Authentication
**What it does:** Secure login with JWT and role-based access. Every protected screen checks role from token.

**User flow:**
```
App opens → check flutter_secure_storage for JWT token
  ↓ token valid + not expired → navigate to Dashboard (skip Login)
  ↓ token missing             → navigate to Login screen
  ↓ token expired             → POST /auth/refresh with refresh token
    ↓ refresh success → save new tokens → navigate to Dashboard
    ↓ refresh failed  → clear all storage → navigate to Login
Login screen:
  User enters email + password → POST /auth/login
  ↓ success → save access token + refresh token → navigate to Dashboard
  ↓ fail    → show error SnackBar with server message, stay on Login (never crash)
  ↓ no internet → show "No internet connection" message, login button disabled
```

**Security rules (from SECURITY.md):**
- Access token stored in `flutter_secure_storage` — NEVER `SharedPreferences`
- Refresh token stored in `flutter_secure_storage` — NEVER `SharedPreferences`
- JWT access token expiry: [e.g., 8 hours]
- Refresh token expiry: [e.g., 30 days]
- 401 response → Dio interceptor auto-calls refresh → retries original request once
- Refresh fails → clear ALL secure storage → navigate to Login → show "Session expired"
- Auto-logout after inactivity: [e.g., 30 min — or "not needed"]
- Logout: deletes BOTH tokens + all user data from storage → pops all routes → Login

**Dio Interceptor Behavior:**
```
Request → inject 'Authorization: Bearer [access_token]' header
Response 401 → POST /auth/refresh
  ↓ refresh 200 → save new tokens → retry original request
  ↓ refresh 401/403 → logout() → navigate to Login
```

**Edge cases:**
- Refresh token also expires → force Login: "Your session has expired. Please log in again."
- Server unreachable at login → "No internet connection. Check your connection and try again."
- Wrong credentials → "Incorrect email or password." (never say which field is wrong — security)
- Role mismatch on protected route → redirect to Dashboard with "You don't have access to this."
- Token tampered / invalid signature → treat as expired → force Login

---

## 📦 Feature: [Feature Name — e.g., Product Management]
**What it does:** [1–2 sentences. What is built, what the user accomplishes.]

**User flow:**
```
[Screen name] loads → [data loads from API / local DB]
User sees [list / form / detail]
User taps [action] → [what happens next — be specific]
[Step] → [Step] → [Final result and UI feedback]
```

**Screens involved:** [list exact screen names from Section 5]

**Data model:**
```
field_name      : Dart type   : required | optional  : validation / notes
id              : String      : required              : UUID from server, never editable by user
name            : String      : required              : max 100 chars, not empty, trimmed
[field]         : [type]      : [req/opt]             : [rules — min/max, format, allowed values]
[image_url]     : String?     : optional              : full URL, displayed via cached_network_image
is_active       : bool        : required              : soft delete flag — never hard delete
created_at      : DateTime    : required              : from server, display in local timezone
updated_at      : DateTime    : required              : from server
```

**Freezed model:**
```dart
@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String id,
    required String name,
    required bool isActive,
    required DateTime createdAt,
    // add your fields here
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);
}
```

**API calls (map to Section 8 endpoints):**
```
Load list   : GET  /[resource]?page=1&limit=20&search=&sort=createdAt&order=desc
Load single : GET  /[resource]/:id
Create      : POST /[resource]    body: { fields }
Update      : PUT  /[resource]/:id  body: { fields to update }
Delete      : DELETE /[resource]/:id  (soft delete — server sets is_active=false)
```

**Riverpod providers needed:**
```
[feature]ListProvider    : AsyncNotifierProvider — fetches paginated list
[feature]DetailProvider  : FutureProvider.family — fetches single item by id
[feature]FormProvider    : StateNotifierProvider — holds form state + validation
[feature]SearchProvider  : StateProvider<String> — search query (debounced)
```

**Business rules:**
- [e.g., Cannot delete — server uses soft delete: is_active = false, preserves history]
- [e.g., Barcode must be unique — server returns 409 Conflict if duplicate → show "Barcode already exists"]
- [e.g., Stock cannot go negative — validate before submit + server rejects → show exact error]
- [e.g., Name cannot be empty or whitespace-only → validate in form before API call]

**Edge cases (these cause rework if missed — implement all of them):**
- Empty list → show EmptyState widget: "[Item] icon + 'No [items] yet.' + 'Add your first [item]' button"
- Search returns nothing → show EmptyState: "'[query]' not found. Want to add it?" with button
- Delete has dependencies → show specific error from server: "Cannot delete — has [related records]"
- Image upload fails → save item without image + show warning SnackBar "Item saved without image"
- Poor network → show retry button + cached data while refreshing
- Pagination end → stop loading more, show "All [items] loaded" subtle indicator

---

## 💳 Feature: [Feature Name — e.g., Sales / POS Screen]
**What it does:** [1–2 sentences]

**User flow:**
```
[Step 1] → [Step 2] → [Step 3] → [Final result]
```

**Screens involved:** [list]

**Data model:**
```
field_name  : type    : req/opt  : notes
```

**API calls:** [list endpoints]

**Business rules:**
- [rule — be specific]
- [rule — be specific]

**Edge cases:**
- [case] → [exact UI response]
- [case] → [exact UI response]

---

> 🔁 Copy the feature block above for EVERY major feature in your app.
> Minimum required per feature: user flow, data model, API calls, business rules, edge cases.
> ⚠️ Agent: If a feature block is missing any of these → use Problem Protocol, don't guess.

---

# 7️⃣ DATABASE DESIGN
> Design all tables now. Schema changes mid-build = major rework.
> ⚠️ Agent: Index every FK column and every column used in WHERE, ORDER BY, or search.
> ⚠️ Agent: If a table relationship is ambiguous → use Problem Protocol before designing it.

## Tables

### users
```sql
id            UUID         PRIMARY KEY DEFAULT gen_random_uuid()
name          VARCHAR(100) NOT NULL
email         VARCHAR(255) NOT NULL UNIQUE
password_hash VARCHAR(255) NOT NULL         -- bcrypt hashed, never stored plain
role          VARCHAR(20)  NOT NULL DEFAULT 'cashier'  -- admin | manager | cashier
is_active     BOOLEAN      NOT NULL DEFAULT true
last_login_at TIMESTAMPTZ  NULL
created_at    TIMESTAMPTZ  NOT NULL DEFAULT now()
updated_at    TIMESTAMPTZ  NOT NULL DEFAULT now()

-- Indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);
```

### [table_name]
```sql
id          UUID         PRIMARY KEY DEFAULT gen_random_uuid()
[field]     [TYPE]       NOT NULL
[field]     UUID         REFERENCES [other_table](id) ON DELETE CASCADE
is_active   BOOLEAN      NOT NULL DEFAULT true   -- soft delete
created_at  TIMESTAMPTZ  NOT NULL DEFAULT now()
updated_at  TIMESTAMPTZ  NOT NULL DEFAULT now()

-- Indexes (add index for EVERY FK and every searched/sorted column)
CREATE INDEX idx_[table]_[fk_field] ON [table]([fk_field]);
CREATE INDEX idx_[table]_created_at ON [table](created_at DESC);
CREATE INDEX idx_[table]_is_active ON [table](is_active);
```

## Cascade & Delete Strategy
> Decide now — changing this mid-project requires migration + code changes.

| Parent Record Deleted | Child Records | Strategy |
|----------------------|---------------|----------|
| User deleted | Their sales | Keep sales — set user_id to NULL or soft-delete user |
| Category deleted | Products in it | Block delete if products exist / or cascade soft-delete |
| [Parent] | [Children] | [Block / Cascade / Nullify / Soft-delete parent] |

---

# 8️⃣ API DESIGN

## Base URL & Version
```
Development : http://localhost:3000/api/v1
Staging     : https://staging.[your-domain]/api/v1
Production  : https://[your-domain]/api/v1
```

## Response Shapes — MUST match MASTER_INSTRUCTIONS.md contract exactly
```json
Single item  : { "data": { ...item }, "message": "ok" }
List         : { "data": [...], "meta": { "total": 100, "page": 1, "pageSize": 20 } }
Error        : { "error": { "code": "VALIDATION_ERROR", "message": "Name is required" } }
Empty list   : { "data": [], "meta": { "total": 0, "page": 1, "pageSize": 20 } }
```

## Pagination — ALL list endpoints use this
```
GET /resource?page=1&limit=20&search=keyword&sort=created_at&order=desc&filter[field]=value
```

## All Endpoints

### Auth
```
POST   /auth/login             body: { email, password }
POST   /auth/logout            header: Authorization Bearer
POST   /auth/refresh           body: { refreshToken }
GET    /auth/me                returns: current user + role (use to validate stored token)
PUT    /auth/change-password   body: { currentPassword, newPassword }
POST   /auth/forgot-password   body: { email }  — sends reset email
POST   /auth/reset-password    body: { token, newPassword }
```

### [Resource 1 — e.g., Products]
```
GET    /products               paginated + ?search=&sort=&filter[category_id]=
GET    /products/:id
POST   /products               body: { name, price, barcode, category_id, ... }
PUT    /products/:id           body: { fields to update }
DELETE /products/:id           soft delete — sets is_active = false
```

### [Resource 2]
```
GET    /[resource]
GET    /[resource]/:id
POST   /[resource]
PUT    /[resource]/:id
DELETE /[resource]/:id
```

> 🔁 Add one endpoint group per resource.

## API Security Rules — Agent Must Enforce (from SECURITY.md + MASTER_INSTRUCTIONS.md)
- Every route except `/auth/login`, `/auth/forgot-password`, `/auth/reset-password` requires valid JWT
- Role middleware on every protected route — auth alone is never enough
- Rate limit `/auth/login`: max 5 attempts/min per IP — return `429 Too Many Requests`
- All request bodies validated with Zod/Pydantic — reject 400 with field-level errors on failure
- Parameterized queries ONLY — no string interpolation into SQL, ever
- Never log passwords, tokens, or PII
- Structured JSON logging with `traceId` (from `x-trace-id` header) on every request
- `x-trace-id` propagated from client → backend → database logs

---

# 9️⃣ OFFLINE SYNC

## Offline Strategy
- [ ] **Full offline** — all core features work 100% without internet
- [ ] **Partial offline** — some features work offline (list which below)
- [ ] **Online only** — skip this entire section, write "not needed"

## What Works Offline
- [e.g., Full sale flow on POS screen — products, cart, checkout]
- [e.g., View and search products list]
- [e.g., View recent sales history (local DB, last 30 days)]
- [e.g., View customer list]

## What Requires Internet
- [e.g., Full historical reports beyond local cache]
- [e.g., User management — admin only, always requires connection]
- [e.g., Syncing new data and schema updates from server]

## Connectivity Detection
```dart
// connectivity_plus watches network state
// Do NOT trust connectivity_plus alone — always also try a real network request
// Pattern: connectivity_plus for UI banner → try actual request → handle failure

final connectivityStream = Connectivity().onConnectivityChanged;
// OFFLINE banner shown when: ConnectivityResult.none
// ONLINE action triggered when: any other result → start sync
```

## Sync Flow
```
App launches
  ↓
connectivity_plus checks network state
  ↓ ONLINE  → flush sync_queue → pull latest from server → update local DB → show UI
  ↓ OFFLINE → use local DB only → queue all writes in sync_queue → show offline banner
  ↓
User performs action while OFFLINE
  → save to local DB immediately → enqueue in sync_queue → show success (optimistic UI)
  ↓
Network comes back → auto-trigger sync → flush sync_queue → pull latest → clear queue
  → show "Synced" SnackBar → update UI with any server changes
```

## Local DB Schema
Mirror all server tables needed for offline. Add these columns to every local table:
```
sync_status   TEXT  DEFAULT 'synced'  -- synced | pending | conflict | error
synced_at     TEXT  NULL              -- ISO 8601 UTC timestamp of last successful sync
local_only    INT   DEFAULT 0         -- 1 = created locally, not yet on server
```

Extra table for queuing offline writes:
```sql
sync_queue
  id          TEXT  PRIMARY KEY         -- UUID generated client-side
  operation   TEXT  NOT NULL            -- CREATE | UPDATE | DELETE
  table_name  TEXT  NOT NULL            -- which entity
  record_id   TEXT  NOT NULL            -- the UUID of the record
  payload     TEXT  NOT NULL            -- JSON string of the full record
  endpoint    TEXT  NOT NULL            -- the API endpoint to call
  http_method TEXT  NOT NULL            -- POST | PUT | DELETE
  created_at  TEXT  NOT NULL            -- when it was queued
  attempts    INT   DEFAULT 0           -- retry counter
  last_error  TEXT  NULL                -- last error message (for debugging)
```

## Conflict Resolution
Strategy: **[server wins / client wins / last-write-wins / ask user]**
Reason: [e.g., POS environment — cashier must always get latest prices from server]

**Conflict handling steps:**
```
1. On sync, compare server updated_at vs local synced_at
2. If server updated_at > local synced_at → server record wins → overwrite local
3. If local has pending changes (sync_status = 'pending') → push local first → then pull
4. If server rejects with 409 → log to SESSION_LOG.md + notify admin on Dashboard
```

---

# 🔟 FLUTTER ARCHITECTURE RULES
> From `SKILL.md`, `INSTRUCTIONS.md`, `PATTERNS.md`. Follow exactly — no exceptions.
> ⚠️ Agent: Never deviate from this folder structure without using Problem Protocol first.

## Required Folder Structure
```
lib/
├── main.dart                    ← ProviderScope + runApp ONLY. Nothing else here.
│
├── app/
│   ├── router.dart              ← ALL GoRouter routes + role redirect guards
│   ├── theme.dart               ← colors, text styles, component themes — zero hardcoded values in widgets
│   └── constants.dart           ← app-wide strings, sizes, durations, asset paths
│
├── features/                    ← ONE folder per feature (PATTERNS.md rule)
│   ├── auth/
│   │   ├── screens/             ← SplashScreen, LoginScreen, ForgotPasswordScreen
│   │   ├── widgets/             ← LoginForm, PasswordField — auth-specific only
│   │   ├── providers/           ← authProvider, currentUserProvider (Riverpod)
│   │   ├── models/              ← UserModel, AuthTokenModel (Freezed)
│   │   └── services/            ← AuthService — Dio calls to /auth/* endpoints only
│   │
│   ├── [feature_name]/          ← repeat for every feature
│   │   ├── screens/
│   │   ├── widgets/
│   │   ├── providers/
│   │   ├── models/
│   │   └── services/
│
├── shared/
│   ├── widgets/                 ← AppButton, AppTextField, LoadingOverlay, EmptyState, ErrorView,
│   │                               ConfirmDeleteDialog, AppSnackBar, AppShimmer
│   ├── models/                  ← ApiResponse<T>, PaginatedResponse<T>, AppError
│   └── services/
│       ├── api_client.dart      ← Dio singleton + interceptors (auth header, 401 refresh, traceId)
│       └── storage_service.dart ← flutter_secure_storage wrapper (read/write/delete/clear)
│
├── local_db/                    ← only if offline is needed (Section 9)
│   ├── database.dart            ← DB init, version, migration scripts
│   ├── sync_queue_dao.dart      ← enqueue, flush, retry, clear
│   └── [feature]_dao.dart       ← one DAO per local table
│
└── utils/
    ├── formatters.dart          ← currency, date, number (all use intl — never manual)
    ├── validators.dart          ← form field validators: email, phone, required, min/max
    └── extensions.dart          ← String, DateTime, num, List extension methods
```

## Architecture Rules

| Rule | Source | Detail |
|------|--------|--------|
| Riverpod for ALL state | PATTERNS.md | No `setState` for business logic — ever |
| `setState` only for local widget UI | ANTI_PATTERNS.md | e.g., show/hide password toggle only |
| GoRouter for ALL navigation | PATTERNS.md | No `Navigator.push` anywhere |
| Widgets receive data via constructor | PATTERNS.md | Never read providers inside deep widget tree |
| One feature = one folder | PATTERNS.md | Keeps code discoverable, isolated |
| `const` everywhere possible | PERFORMANCE.md | Prevents unnecessary widget rebuilds |
| `ListView.builder` for all lists | ANTI_PATTERNS.md | `ListView(children:[])` is BANNED |
| No expensive work in `build()` | PERFORMANCE.md | Use FutureProvider, AsyncNotifier, initState |
| No BuildContext across async gaps | ANTI_PATTERNS.md | Check `mounted` before using context after await |
| No deeply nested widget trees | ANTI_PATTERNS.md | Extract to named widget class at 3–4 nesting levels |
| Freezed for all data models | PATTERNS.md | No plain classes for API data — always Freezed |
| No `print()` in production | ANTI_PATTERNS.md | Use debugPrint() in dev, remove before release |

## Code Style
```
Classes / Widgets   : PascalCase    → ProductListScreen, AddProductForm
Variables / Methods : camelCase     → productList, handleSubmit
File names          : snake_case    → product_list_screen.dart
Constants           : SCREAMING_SNAKE → MAX_ITEMS_PER_PAGE, or camelCase in constants.dart
Private methods     : _prefix       → _buildHeader(), _validateForm()
Provider files      : [feature]_providers.dart (one file per feature)
```

---

# 1️⃣1️⃣ UI / UX RULES

## Design System
```yaml
Design Language   : Material 3
Primary Color     : [hex — e.g., #1565C0]
Secondary Color   : [hex]
Success Color     : #2E7D32
Warning Color     : #F57F17
Error Color       : #C62828
Surface Color     : [hex]
Border Radius     : [e.g., 8px cards, 12px inputs, 24px buttons]
Min Tap Target    : 48x48px     ← non-negotiable accessibility requirement
Min Font Size     : 14px        ← never go below this
Elevation         : Material 3 elevation tokens — no hardcoded shadow values
```

## Responsive Layout
| Screen Width | Navigation | Layout |
|-------------|-----------|--------|
| < 600px (Mobile) | Bottom NavigationBar | Single column |
| 600–840px (Tablet portrait) | NavigationRail (left side) | 2-column where useful |
| > 840px (Tablet landscape / Web) | Drawer / Sidebar | 2–3 column, data tables |

## What Every Screen MUST Have (no exceptions)

| State | Required UI Element |
|-------|---------------------|
| Loading | Shimmer skeleton (preferred) OR centered CircularProgressIndicator |
| Empty list | EmptyState widget: icon + message + CTA button |
| Error | ErrorView widget: icon + human message + "Retry" button that re-triggers provider |
| Success action | SnackBar: brief message (max 2 seconds for confirmations) |
| Destructive action | AlertDialog: "Cancel" + "Confirm Delete" (red button) — NEVER skip |
| Long async operation | LoadingOverlay: blocks full screen interaction |
| Form submitting | Disable submit button + show CircularProgressIndicator inside button |

## Form UX Rules
- All forms scroll — use `SingleChildScrollView` + `resizeToAvoidBottomInset: true`
- Inline errors via `TextFormField validator:` — no dialog pop-ups for field validation
- Auto-advance focus: hitting "Next" on keyboard moves to next field
- "Done" or "Submit" on last field triggers form validation + submit
- Required fields marked with `*` in label
- Dates use `showDatePicker` — never free-text date input
- Currency input uses formatted controller — no manual decimal handling

## Accessibility
- All tappable items: minimum 48×48px
- All images: `semanticsLabel` set
- All icons: `Tooltip` or `semanticLabel` set
- Color is never the only indicator of state (use icon + color)
- Text contrast ratio meets WCAG AA (4.5:1 minimum)

---

# 1️⃣2️⃣ SECURITY RULES
> From `flutter-vibe-coder/SECURITY.md` — non-negotiable, every item.
> ⚠️ Agent: Check this section before writing any auth, storage, or network code.

## Token & Storage
```
✅ flutter_secure_storage for ALL tokens and sensitive values
✅ Keychain on iOS, EncryptedSharedPreferences on Android (flutter_secure_storage handles automatically)
❌ SharedPreferences for sensitive data — BANNED (ANTI_PATTERNS.md)
❌ Hive/Isar/SQLite for tokens — BANNED for sensitive values
```

## Secrets & Config
```
✅ flutter_dotenv for all config values (API base URLs, feature flags)
✅ .env.example committed to repo with placeholder values for every key
✅ .env with real values → ALWAYS in .gitignore
✅ Use --dart-define for build-specific values (PROD vs DEV API URLs)
❌ NEVER hardcode API keys, base URLs, or tokens in any Dart source file
❌ NEVER log token values — even in debug mode
```

## Network
```
✅ HTTPS only in production — never plain HTTP
✅ Certificate pinning for high-security endpoints (banking, medical)
✅ Dio interceptor: inject auth header + handle 401 auto-refresh + add x-trace-id
✅ Timeout configured on Dio: connectTimeout 10s, receiveTimeout 30s, sendTimeout 30s
❌ Never log request body on auth endpoints — passwords appear in logs
```

## Release Builds (required before any store submission)
```bash
# Android
flutter build apk --release --obfuscate --split-debug-info=./debug-symbols/android
flutter build appbundle --release --obfuscate --split-debug-info=./debug-symbols/android

# iOS
flutter build ipa --obfuscate --split-debug-info=./debug-symbols/ios

# Web
flutter build web --release --dart-define=APP_ENV=production
```

## 🔒 Production Hardening Audit Prompt
Run this when the app is nearly complete:
```
I am in Production Hardening mode. Audit all existing Flutter code and implement:
1. Rate Limiting      — confirm backend limits are in place; Dio retries with backoff
2. Input Validation   — every form field has validator, every API response is parsed
3. Secret Handling    — zero hardcoded secrets, .env.example complete, secure storage only
4. Extra Hardening    — CORS confirmed on backend, HTTPS enforced, obfuscation on release
List what is missing. Fix each item one by one.
Reference flutter-vibe-coder/SECURITY.md for Flutter-specific implementation.
Do not skip anything for speed.
```

---

# 1️⃣3️⃣ PERFORMANCE RULES
> From `flutter-vibe-coder/PERFORMANCE.md`
> ⚠️ Agent: Apply these before generating any list, rendering, or data-fetching code.

## Performance Budget
```yaml
App Cold Start   : < 3 seconds  (from tap to interactive)
Screen Transition: < 300ms      (GoRouter push animation)
API Response P50 : < 300ms      (backend SLA)
API Response P99 : < 1000ms     (acceptable maximum)
Search           : < 300ms      (debounced 300ms — not every keystroke)
Report Load      : < 5 seconds  (complex queries — show skeleton immediately)
List Scroll      : 60fps        (never jank — use ListView.builder, const, avoid build() work)
Image Load       : < 1 second   (cached_network_image with placeholder)
```

## Flutter Performance Self-Checklist (agent runs before every session ends)
- [ ] `const` on every widget constructor that doesn't change
- [ ] `ListView.builder` on ALL lists — never `ListView(children:[...])`
- [ ] Search inputs debounced 300ms via `Timer` (cancel + restart on each keystroke)
- [ ] All list endpoints paginated (default 20 per page, load more on scroll)
- [ ] No expensive operations in `build()` — use FutureProvider / AsyncNotifier / initState
- [ ] All network images via `CachedNetworkImage` with placeholder and error widget
- [ ] Profile with Flutter DevTools Performance tab before claiming "it's fast"
- [ ] `RepaintBoundary` around complex widgets that should not repaint with parent

---

# 1️⃣4️⃣ CONTEXT7 — ALWAYS ON
> From `flutter-vibe-coder/SKILL.md` — never rely on training memory for library APIs.
> ⚠️ Agent: Resolve docs BEFORE writing any code that uses a library.

## How to Use
```
Step 1 → use context7 → resolve-library-id: "[library name]"
Step 2 → get-library-docs: "[resolved-id]" topic: "[specific feature]" tokens: 5000
Step 3 → write code based ONLY on fetched docs
Rule   : if Context7 docs conflict with training memory → docs win, always
```

## Always Resolve Before Touching These
```
riverpod / flutter_riverpod → before ANY provider, notifier, ref, consumer, or generator code
go_router                  → before ANY route, redirect, guard, or Shell navigation code
dio                        → before ANY HTTP call, interceptor, or response model code
flutter_secure_storage     → before ANY read / write / delete / clear call
hive / isar / sqflite      → before ANY local DB schema, query, or migration code
freezed                    → before ANY model with @freezed annotation or code generation
intl                       → before ANY date format or currency format code
cached_network_image       → before ANY network image widget
connectivity_plus          → before ANY connectivity check or stream usage
flutter_dotenv             → before ANY .env read or initialization
```

---

# 1️⃣5️⃣ ERROR HANDLING — EVERY SCENARIO

> No white screens. No unhandled exceptions. Every error has a visible, human user response.
> ⚠️ Agent: If an error scenario is not listed here and you're unsure → use Problem Protocol.

| Situation | What the App Does |
|-----------|-----------------|
| No internet on launch | Show offline banner; load with local data if offline mode enabled |
| No internet on action | Disable action button; show "No connection" SnackBar |
| API error (400) | Parse error shape → show specific SnackBar with `error.message` |
| API error (401) | Dio interceptor: auto-refresh → retry; if refresh fails → force logout |
| API error (403) | Show "You don't have permission for this" — don't crash, navigate back |
| API error (404) | Show "Not found" page with back button and clear message |
| API error (409) | Show specific conflict message (e.g., "Barcode already exists") |
| API error (422) | Parse validation errors → show per-field inline errors if possible |
| API error (429) | Show "Too many attempts. Please wait [n] seconds." with countdown |
| API error (5xx) | Show "Something went wrong. Please try again." + Retry button |
| Request timeout | Show "Request timed out. Check your connection." + Retry button |
| Form validation fail | Inline field errors via `validator:` — no dialog pop-ups |
| Search returns empty | EmptyState: "[Item] not found. Want to add it?" with CTA |
| Session expires mid-use | SessionExpiredDialog: "Your session has expired. Please log in again." |
| Image upload fails | Save item without image + SnackBar warning "Saved without image" |
| Barcode scan returns nothing | Toast: "No barcode detected. Please try again." |
| Sync conflict on reconnect | Keep server version, log conflict to SESSION_LOG.md |
| Print / export fails | "[Action] failed. Save as PDF instead?" dialog with options |
| BuildContext disposed | Check `mounted` before any `context.go()` or SnackBar after await |

---

# 1️⃣6️⃣ TESTING PLAN
> From `REVIEW_CHECKLIST.md` — tests must exist before a feature is called "done".
> ⚠️ Agent: Do not mark a feature complete unless its tests are written.

## Flutter Tests
```
Unit tests        → all Freezed models (JSON parse/serialize), all validators, all formatters
Widget tests      → LoginScreen, main feature screen, shared widgets (AppButton, EmptyState, ErrorView)
Provider tests    → key AsyncNotifiers with mocked services (verify loading/data/error states)
Integration test  → most critical user flow end-to-end (e.g., login → complete sale → see result)
```

## Backend Tests
```
Unit tests        → each controller/handler, each service function
Integration tests → API routes with real test DB (Supertest / pytest httpx)
Auth tests        → valid JWT, expired JWT, missing JWT, wrong role, rate limit
```

## Manual Test Matrix (run before EVERY release — no exceptions)

| Test | Android | iOS | Web |
|------|---------|-----|-----|
| Login as each role | ☐ | ☐ | ☐ |
| Complete primary user flow A to Z | ☐ | ☐ | ☐ |
| Disable internet mid-flow | ☐ | ☐ | ☐ |
| Reconnect internet → verify sync | ☐ | ☐ | ☐ |
| Submit empty form → field errors | ☐ | ☐ | ☐ |
| Submit with invalid data | ☐ | ☐ | ☐ |
| Duplicate entry (same barcode/email) | ☐ | ☐ | ☐ |
| Delete with dependents | ☐ | ☐ | ☐ |
| Logout → reopen → must log in | ☐ | ☐ | ☐ |
| Smallest screen (SE 375px / fold) | ☐ | ☐ | ☐ |
| Landscape orientation | ☐ | ☐ | — |
| System dark mode | ☐ | ☐ | ☐ |
| Low-end device (2GB RAM, old CPU) | ☐ | — | — |

---

# 1️⃣7️⃣ DEPLOYMENT PLAN

## Backend
```yaml
Platform      : [Railway / Render / DigitalOcean / AWS EC2 / Hetzner VPS]
Containerized : Docker + docker-compose
Process Mgr   : Docker restart: always (or PM2 in cluster mode)
Reverse Proxy : Nginx with SSL termination
SSL           : Let's Encrypt (certbot auto-renew)
Healthcheck   : GET /health endpoint → 200 OK
```

## Database
```yaml
DB       : PostgreSQL 16.x
Hosting  : [Managed DB: Railway / Supabase / same VPS]
Backups  : Daily automated dump, 7-day retention minimum
Restore  : Document and test restore procedure before go-live
```

## Flutter Web
```bash
flutter build web --release --dart-define=APP_ENV=production
# Deploy to: Netlify / Vercel / Nginx static folder
# CDN: Cloudflare for asset caching (set Cache-Control headers)
# PWA: configure manifest.json + service worker for offline web support
```

## Mobile Releases
```bash
# Android — release build
flutter build appbundle --release \
  --obfuscate \
  --split-debug-info=./debug-symbols/android \
  --dart-define=APP_ENV=production
# → Upload to Google Play internal track → test 7 days → promote to production

# iOS — release build
flutter build ipa \
  --obfuscate \
  --split-debug-info=./debug-symbols/ios \
  --dart-define=APP_ENV=production
# → Upload via Transporter → TestFlight internal (7 days) → App Store review
```

## All Environment Variables

### Backend (.env)
```bash
DATABASE_URL=              # postgresql://user:pass@host:5432/dbname
JWT_SECRET=                # min 32 chars, random, never reuse across envs
JWT_REFRESH_SECRET=        # different from JWT_SECRET
JWT_EXPIRY=8h
JWT_REFRESH_EXPIRY=30d
PORT=3000
CORS_ORIGIN=https://[your-web-app-domain]
LOG_LEVEL=info
```

### Flutter (flutter_dotenv .env)
```bash
API_BASE_URL=              # https://[your-api-domain]/api/v1
APP_ENV=production         # development | staging | production
```

---

# 1️⃣8️⃣ INTEGRATIONS

| Integration | Priority | Package / Method | Notes |
|-------------|----------|-----------------|-------|
| Camera barcode scan | [Must have / Nice to have] | `mobile_scanner` | Mobile only |
| USB barcode scanner | [Nice to have] | Keyboard input HID mode | Web — reads as keyboard events |
| Thermal receipt printer | [Must have] | `esc_pos_bluetooth` | BT on mobile, USB on web |
| PDF generation | [Must have] | `pdf` + `printing` | Receipts and reports |
| CSV export | [Must have] | `csv` package | Reports and product lists |
| Image upload | [needed?] | `image_picker` + multipart Dio | Product images |
| Push notifications | [needed?] | `firebase_messaging` | Low stock, alerts |
| SMS / WhatsApp receipt | [Optional] | Backend-side Twilio | Never from Flutter directly |
| Currency formatting | Must have | `intl` — already in pubspec | Locale-based, always 2 decimal |
| Analytics | [needed?] | `firebase_analytics` | User flows, screen views |
| Crash reporting | [needed?] | `firebase_crashlytics` | Production error tracking |

---

# 1️⃣9️⃣ GITHUB SPEC KIT
> Generate these files BEFORE writing any code.
> Show developer TASKS.md FIRST — wait for approval before starting Phase 1.

```
SPEC.md                ← Full feature specification (expanded from this plan)
TASKS.md               ← Checkboxes per screen/feature — SHOW THIS FIRST for approval
ARCHITECTURE.md        ← System design, data flow, key technology decisions
IMPLEMENTATION_PLAN.md ← Ordered phases with dependencies clearly listed
API_SPEC.md            ← Full endpoint docs with request/response examples
DB_SCHEMA.md           ← All tables with types, constraints, indexes, cascade rules
```

> Say to agent: *"Generate GitHub Spec Kit files first. Show me TASKS.md for approval before coding."*
> Agent must wait for explicit developer approval of TASKS.md before writing any Dart/Flutter code.

---

# 2️⃣0️⃣ BUILD ORDER — FOLLOW THIS EXACTLY

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PHASE 1 — FOUNDATION (never skip, never reorder)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ 1.1  Read ALL skill files (Boot Sequence above) — confirm in writing before continuing
□ 1.2  Generate GitHub Spec Kit (SPEC, TASKS, ARCHITECTURE, API_SPEC, DB_SCHEMA)
□ 1.3  Wait for developer to APPROVE TASKS.md — do not write code until approved
□ 1.4  Set up Flutter project structure (exact folder layout from Section 10)
□ 1.5  Configure pubspec.yaml with approved libraries ONLY
□ 1.6  Set up app/theme.dart (colors, text styles — no hardcoded values anywhere)
□ 1.7  Set up app/constants.dart (all magic values, strings, sizes, durations)
□ 1.8  Set up app/router.dart (GoRouter skeleton — routes defined, guards stubbed)
□ 1.9  Set up shared/services/api_client.dart (Dio singleton + interceptors)
□ 1.10 Set up shared/services/storage_service.dart (flutter_secure_storage wrapper)
□ 1.11 Set up .env + .env.example + flutter_dotenv init in main.dart
□ 1.12 Run flutter pub get → update STACK_VERSIONS.md with exact installed versions
□ 1.13 Resolve Context7 for all active libraries — confirm versions match

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PHASE 2 — BACKEND (build API before Flutter — contract must exist first)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ 2.1  Set up backend project structure + Dockerfile + docker-compose.yml
□ 2.2  Set up DB connection + run initial migration (all tables from Section 7)
□ 2.3  Build auth routes (/login, /logout, /refresh, /me, /change-password)
□ 2.4  Build resource routes — one feature at a time (finish one before next)
□ 2.5  Add role middleware to every protected route
□ 2.6  Add input validation schema to every route
□ 2.7  Add structured JSON logging with traceId propagation
□ 2.8  Test all endpoints — unit + integration tests pass
□ 2.9  Confirm API responses match Section 8 shapes exactly
□ 2.10 Update SESSION_LOG.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PHASE 3 — FLUTTER AUTH (always first Flutter feature)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ 3.1  SplashScreen — token check → auto-redirect logic (with loading state)
□ 3.2  LoginScreen + LoginForm widget (email + password + validation)
□ 3.3  AuthService (Dio calls to /auth endpoints, typed responses)
□ 3.4  authProvider (Riverpod AsyncNotifier — stores UserModel, role, token state)
□ 3.5  GoRouter role-based redirect guards on ALL protected routes
□ 3.6  Token read/write/clear via storage_service.dart (never raw flutter_secure_storage)
□ 3.7  Dio interceptor: inject Bearer token + handle 401 → refresh → retry
□ 3.8  Test: login ✓ | logout ✓ | expired token ✓ | wrong role redirects ✓
□ 3.9  Update SESSION_LOG.md

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PHASE 4 — FLUTTER FEATURES (one at a time — fully complete before next)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
For each feature:
  □ [n].1  Freezed model + json_serializable (run build_runner)
  □ [n].2  Service (Dio calls to API endpoints, typed, error-handled)
  □ [n].3  Riverpod providers (list, detail, form, search)
  □ [n].4  Screens (list screen, detail screen, form screen)
  □ [n].5  Widgets (feature-specific reusable widgets)
  □ [n].6  Empty state, error state, loading state — ALL three
  □ [n].7  Unit tests for model + service + providers
  □ [n].8  Widget test for main screen
  □ [n].9  Review REVIEW_CHECKLIST.md — check all boxes
  □ [n].10 Update SESSION_LOG.md

□ 4.x  [Feature 1] — complete all steps above
□ 5.x  [Feature 2] — complete all steps above
□ 6.x  [Feature n] — continue for all features from Section 5

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PHASE 5 — SHARED UI POLISH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ 5.1  EmptyState widget — standardized across all list screens
□ 5.2  Loading shimmer — consistent skeleton across all screens
□ 5.3  ErrorView widget — message + retry button (triggers provider refresh)
□ 5.4  ConfirmDeleteDialog — standardized, used for ALL destructive actions
□ 5.5  SnackBar helper — centralized style (success=green, error=red, info=blue)
□ 5.6  Keyboard handling — all forms scroll, no input hidden behind keyboard
□ 5.7  Android physical back button — test GoRouter back stack behavior
□ 5.8  SafeArea on all screens — nothing cut off by notch or system nav bar
□ 5.9  Responsive layout — test on mobile + tablet + web at the same time
□ 5.10 Dark mode — if enabled in Section 1, test all screens
□ 5.11 Accessibility — tap target sizes, semantic labels, contrast ratios

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PHASE 6 — OFFLINE SYNC (skip entirely if "online only")
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ 6.1  Set up local DB with all tables from Section 9
□ 6.2  Create DAO files (one per local table with CRUD + sync methods)
□ 6.3  Set up sync_queue table and SyncQueueDao
□ 6.4  Build SyncService (flush queue when online, pull latest, handle conflicts)
□ 6.5  connectivity_plus listener → triggers sync on reconnect
□ 6.6  Offline banner widget — shown at top of all screens when disconnected
□ 6.7  Optimistic UI updates — write local immediately, sync in background
□ 6.8  Test: full offline flow ✓ | reconnect + sync ✓ | conflict resolution ✓

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
PHASE 7 — FINAL POLISH & RELEASE PREP
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
□ 7.1  App icon — all Android densities + iOS @1x @2x @3x (use flutter_launcher_icons)
□ 7.2  Splash screen — branded, brief, correct for each platform (flutter_native_splash)
□ 7.3  Version number visible in Settings/About: "Version 1.0.0 (build 1)"
□ 7.4  All routes have deep link support configured
□ 7.5  Release build with obfuscation: `--obfuscate --split-debug-info`
□ 7.6  Run full manual test matrix (Section 16) — all boxes checked
□ 7.7  Write missing unit + widget + integration tests
□ 7.8  Run Production Hardening audit (Section 12) — all items addressed
□ 7.9  Update CHANGELOG.md, SESSION_LOG.md, DECISIONS.md
□ 7.10 Update REVIEW_CHECKLIST.md with any project-specific items found
□ 7.11 Upload to Google Play internal track + TestFlight — test 7 days before public
```

---

# ⚠️ 2️⃣1️⃣ THINGS THAT ARE ALWAYS FORGOTTEN
> Check every item here before giving your agent the final prompt.
> These are the #1 cause of rework in Flutter projects.

### UI Gotchas
- [ ] **Loading indicator on every button** — disable button + show CircularProgressIndicator during request
- [ ] **Empty state on every list screen** — no blank white screens, ever
- [ ] **Keyboard hides input fields** — `resizeToAvoidBottomInset: true` + `SingleChildScrollView` on ALL forms
- [ ] **Android physical back button** — GoRouter handles routing but test manually, especially in dialogs
- [ ] **SafeArea on all screens** — wraps Scaffold body — avoids notch and system navigation bar overlap
- [ ] **Small screen overflow** — test on iPhone SE (375px) and small Android — all content must scroll
- [ ] **Landscape mode** — test on mobile and tablet — nothing should overflow horizontally
- [ ] **Platform differences** — date pickers, share sheets, file pickers look different on iOS vs Android

### Data & Logic
- [ ] **Currency always 2 decimal places** — use `NumberFormat.currency(locale: 'en_US', symbol: '\$')` — never manual string concat
- [ ] **Date format consistent** — pick one format, apply everywhere via `formatters.dart`
- [ ] **Timezone** — DB stores UTC, UI displays in local device time via `intl` DateFormat with `toLocal()`
- [ ] **Pagination on every list** — never `limit=99999` — always 20 per page with load-more
- [ ] **Search debounce** — `Timer` cancelled and restarted on every keystroke — never API on every character
- [ ] **BuildContext after await** — check `if (!mounted) return;` before using context after any await
- [ ] **Freezed build_runner** — run `flutter pub run build_runner build --delete-conflicting-outputs` after every model change

### Auth & Security
- [ ] **Token expires while user is active** — Dio interceptor catches 401, but test this with short-lived token
- [ ] **Logout clears ALL secure storage** — test reopen after logout requires login
- [ ] **No hardcoded credentials or test users in release code**
- [ ] **Role check on GoRouter** — every protected route has redirect guard — not just the widget tree
- [ ] **Role change behavior** — document: users must re-login to get new role JWT

### App Completeness
- [ ] **App icon all sizes** — use `flutter_launcher_icons` — never add assets manually
- [ ] **Splash screen branded** — use `flutter_native_splash` — test on physical device
- [ ] **Version number in app** — Settings → About → "Version 1.0.0 (build 1)" — uses `package_info_plus`
- [ ] **Confirm before every delete** — AlertDialog, never skip, never defer
- [ ] **Error handling tested** — put backend down and test every screen — no white screens

### Backend (From the Flutter Side)
- [ ] **API contract tested** — Flutter response parsing matches actual API response shape exactly
- [ ] **Sales/transaction history preserved** — even if product or customer is later deleted
- [ ] **All FK columns indexed** — add now, painful to add when table has millions of rows
- [ ] **traceId propagated** — `x-trace-id` header on every Dio request for backend log correlation

### Skill Kit Hygiene (from MASTER_INSTRUCTIONS.md — all required)
- [ ] **SESSION_LOG.md updated** at the end of EVERY session — not optional
- [ ] **DECISIONS.md updated** for every non-obvious architectural choice made this session
- [ ] **CHANGELOG.md updated** for every user-facing or API-facing change
- [ ] **STACK_VERSIONS.md updated** after every `flutter pub get` or package version change
- [ ] **ANTI_PATTERNS.md updated** if a new bad pattern was discovered this session
- [ ] **Every session ends with ➡️ Next step** — leave agent with direction

---

# 2️⃣2️⃣ SESSION RECOVERY PROTOCOL
> Use this when resuming a project after a break, with a fresh agent context.

## How to Restart a Session Cleanly
```
Say to agent:

"We are resuming the [App Name] Flutter project.

1. Read FLUTTER_PROJECT_PLAN.md — understand the full scope
2. Read MASTER_INSTRUCTIONS.md — cross-skill rules
3. Read flutter-vibe-coder/SKILL.md and INSTRUCTIONS.md
4. Read flutter-vibe-coder/PROJECT_CONTEXT.md — current sprint and known issues
5. Read flutter-vibe-coder/SESSION_LOG.md — last session's work and next step
6. Read flutter-vibe-coder/DECISIONS.md — why key decisions were made
7. Confirm what was done and what remains
8. Resume exactly where SESSION_LOG.md says ➡️ Next step"
```

## What SESSION_LOG.md Must Always Contain
```
## Session — [YYYY-MM-DD HH:MM]

Goal         : [what we set out to accomplish]
Completed    : [what was finished — specific files/features]
In Progress  : [anything partially done — what state it's in]
Decisions    : [any architecture decision made, even small ones]
Known Issues : [any new bugs or tech debt created]
Next Step    : ➡️ [ONE specific action to start next session]
```

---

# 2️⃣3️⃣ PERSONA — HOW THE AI SHOULD COMMUNICATE
> Sourced from `flutter-vibe-coder/PERSONA.md`. Customize for your style.

```yaml
Tone              : pair-programmer
Detail Level      : balanced
Code Comments     : explain non-obvious only — not every line
Show Alternatives : yes — max one alternative per decision
Explain Why       : always for non-obvious choices, skip for obvious ones
Ask Before Acting : ALWAYS use Problem Protocol for all blockers — never guess silently
Refactor Style    : conservative — only when I explicitly ask

Role   : "Senior Flutter engineer. Treat me as a smart developer — explain the why simply, skip basics."
Focus  : "Correctness first. Performance second. Elegance third."

Off-Limits:
  - Do not suggest switching to a different framework or language
  - Do not refactor working code without my explicit permission (SKILL.md hard rule)
  - Do not add packages not in the approved pubspec.yaml list without asking
  - Do not write two layers at once (MASTER_INSTRUCTIONS.md hard rule)
  - Do NOT silently resolve blockers — always use Agent Problem Protocol

Session End Rule: Always close with ➡️ Next step: [one clear, specific action]
```

---

# 2️⃣4️⃣ FINAL AGENT PROMPT — COPY AND PASTE TO START EVERY PROJECT

> Fill in the entire FLUTTER_PROJECT_PLAN.md completely, then paste it + this prompt:

```
You are a senior Flutter engineer and my AI coding partner.

Read this entire FLUTTER_PROJECT_PLAN.md before doing anything else.

Then follow the Agent Boot Sequence at the top — read EVERY skill file listed, in order.

Your job is to build this app A to Z, following every rule in this plan,
in the exact build order in Section 20.

Hard rules from flutter-vibe-coder/SKILL.md — never break these:
❌ Never generate large widget trees without request
❌ Never refactor working code without explicit permission
❌ Never add packages not in the approved pubspec.yaml list without asking
❌ Never produce duplicate logic or widgets
❌ Never end a session without ➡️ Next step

Hard rules from MASTER_INSTRUCTIONS.md — never break these:
❌ Never start work without reading PROJECT_CONTEXT.md and SESSION_LOG.md
❌ Never skip Context7 for library-specific code in any layer
❌ Never work on two layers at the same time
❌ Never end a session without updating SESSION_LOG.md
❌ Never break the API response shape contract

CRITICAL — Agent Problem Protocol:
When you encounter ANY blocker, ambiguity, or decision point with multiple valid paths:
→ STOP immediately
→ Use the Agent Problem Protocol format from Section 2 of this plan
→ Present 3–4 labelled options with pros, cons, and recommendations
→ Wait for my answer before writing any more code
→ Never silently pick an option — always ask first

When starting a new session mid-project, always say:
"Read MASTER_INSTRUCTIONS.md, PROJECT_CONTEXT.md, and SESSION_LOG.md first.
 My task today: [describe the specific task]."

Start now by:
1. Confirming you have read this plan and all skill files in the Boot Sequence
2. Listing the phases you will build and in what order
3. Generating the GitHub Spec Kit files (SPEC.md, TASKS.md, ARCHITECTURE.md, API_SPEC.md, DB_SCHEMA.md)
4. Showing me TASKS.md and waiting for my approval before writing any Dart code
5. Then beginning Phase 1
```

---

```yaml
# File Metadata
FLUTTER_PROJECT_PLAN : v2.0.0
Previous Version     : v1.0.0
Integrates           : flutter-vibe-coder skill kit v1.0.0
Integrates           : MASTER_INSTRUCTIONS.md v2.0.0
Designed For         : Vibe coders building Flutter apps (mobile + web) with AI agents
Sections             : 24
New in v2.0.0        :
  - Agent Problem Protocol (mandatory blocker format with 3-4 options)
  - Role table with Notes column
  - Success Criteria / Definition of Done
  - Platform min versions
  - Cascade & Delete Strategy table in DB design
  - Dio timeout configuration
  - Staging environment in Base URL
  - Session Expired dialog and 429 error handling
  - Manual Test Matrix (platform × scenario grid)
  - Session Recovery Protocol (Section 22)
  - ResizeToAvoidBottomInset and landscape mode reminders
  - platform_info_plus for version number
  - AppBundle build command (not just APK)
Last Updated         : [fill in when you copy this for a new project]
Updated By           : [your name]
Change Reason        : [initial setup / added feature X / updated stack versions]
```
