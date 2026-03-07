# 🔒 SECURITY.md — Flutter Security Checklist
> Stack-specific security rules for this project.
> The AI must check these before suggesting any auth, data, or config code.

## Flutter-Specific Security Rules
- Never store secrets in Flutter assets or source — use secure storage
- Use flutter_secure_storage for tokens, not SharedPreferences
- Validate all data from platform channels
- Certificate pinning for sensitive API communication

## Universal Security Rules

### Secrets Management
- Never commit secrets, API keys, or credentials to VCS
- Use environment variables or secret managers for all sensitive config
- Rotate credentials immediately if accidentally exposed
- Use different credentials per environment (dev/staging/prod)

### Input Validation
- Validate and sanitize ALL user inputs before processing
- Use allowlists, not denylists, for input validation
- Validate on the server — client-side validation is UX only

### Authentication & Authorization
- Check authentication on every protected route/endpoint
- Check authorization (does this user own this resource?) separately from authentication
- Use short-lived tokens with refresh token rotation

### Data Protection
- Never log sensitive data (passwords, tokens, PII, payment info)
- Encrypt sensitive data at rest
- Use HTTPS/TLS for all data in transit — no HTTP in production

### Dependencies
- Keep dependencies updated — run security audits regularly
- Review new dependency licenses and security posture before adding
- Pin dependency versions in production

## Security Incident Response
If a security issue is found:
1. Do NOT push a fix directly to main
2. Create a private branch
3. Fix, test, and review
4. Deploy with a coordinated release
5. Document in DECISIONS.md what was changed and why

---

## 🛡️ VIBE SECURITY FOUNDATION — Production Hardening Mode

> **Activate this mode with:** *"I am in Production Hardening mode. Audit our current progress and implement the following security essentials immediately. Do not skip these for the sake of speed."*
>
> When this mode is active, the AI must audit all existing code first, list what is missing, then implement each item one by one before moving on.

---

### 1. 🚦 Rate Limiting
**Goal:** Prevent brute force and DoS attacks on all API and auth routes.
Use a sliding window or token bucket approach.

**This stack implements it with:**
Rate limiting lives on the backend — ensure your API enforces it. On the Flutter side: disable submit buttons during in-flight requests, add debounce to search/OTP inputs (`debounce_throttle` package), never allow retry loops without exponential backoff.

**Audit checklist:**
- [ ] Login endpoint rate-limited (max 5 attempts/minute per IP)
- [ ] Signup endpoint rate-limited
- [ ] OTP / password-reset endpoints rate-limited
- [ ] General API routes rate-limited (sliding window)
- [ ] Redis or distributed store used (not in-memory, which resets on restart)

---

### 2. 🔍 Strict Input Validation
**Goal:** Schema-based validation on every incoming request. Reject anything that doesn't match. Sanitize to prevent SQL injection, XSS, and NoSQL injection.

**This stack implements it with:**
Validate all form inputs client-side before sending — use `TextFormField` with `validator:` callbacks. Never rely on client validation alone. Sanitize display of any user-generated content to prevent XSS in WebViews.

**Audit checklist:**
- [ ] Every route/endpoint/action has a schema — no raw unvalidated input reaches services
- [ ] Unknown/extra fields are stripped or rejected
- [ ] String inputs sanitized against XSS
- [ ] Validation failure returns 400 immediately — no partial processing
- [ ] Client-side validation exists for UX, but server-side validation is the real gate

---

### 3. 🔑 Secure API Key & Secret Handling
**Goal:** Zero secrets in source code. App fails loudly at startup if required secrets are missing. .env.example documents all required keys.

**This stack implements it with:**
Never hardcode API keys, base URLs, or secrets in Dart source. Use `flutter_dotenv` for local dev. For production, use remote config (Firebase Remote Config) or build-time env injection via `--dart-define`. `.env` is gitignored, `.env.example` committed.

**Audit checklist:**
- [ ] Zero hardcoded secrets, API keys, DB URLs, or tokens in any source file
- [ ] All secrets loaded from environment variables
- [ ] App throws / crashes at startup if any required env var is missing
- [ ] `.env.example` committed to VCS with dummy values for every required key
- [ ] `.env` (with real values) is in `.gitignore`
- [ ] Different secrets used per environment (dev / staging / prod)

---

### 4. 🧱 Additional Hardening
**Goal:** CORS locked to trusted origins, security headers set, all DB queries parameterized, no accidental test routes or bypasses left in code.

**This stack implements it with:**
Use `flutter_secure_storage` for tokens — never `SharedPreferences` for sensitive data. Certificate pinning via `http_certificate_pinning` or custom `HttpClient` with `badCertificateCallback` override for sensitive apps. Obfuscate release builds: `flutter build --obfuscate --split-debug-info`.

**Audit checklist:**
- [ ] CORS configured with explicit allowed origins — never wildcard `*` in production
- [ ] Security headers set (CSP, HSTS, X-Frame-Options, X-Content-Type-Options, Referrer-Policy)
- [ ] All database queries parameterized — no string interpolation into SQL/queries
- [ ] No test routes, debug endpoints, or auth bypasses left in codebase
- [ ] No sensitive data (passwords, tokens, PII) logged anywhere
- [ ] Dependencies audited for vulnerabilities in CI pipeline

**Recommended tools for this stack:**
`flutter_secure_storage`, `flutter_dotenv`, `http_certificate_pinning`, `debounce_throttle`

---

### 🧠 Pro-Tips (Always Active)

**The One-File Trap**
> AI loves putting everything in one file. As your app grows:
> *"Refactor security logic (rate limiting, validation, auth checks) into reusable middleware so it's centralized and harder to accidentally bypass."*

**The Log Leak**
> After every session involving auth or user data, ask:
> *"Ensure we are not logging sensitive user data, API keys, tokens, or PII to the console or log files in any environment."*

**The Auth Check**
> Before every deployment, manually verify:
> - No `test` login route or hardcoded test credentials exist
> - No commented-out auth middleware
> - No `if (process.env.NODE_ENV === 'development') skipAuth()` left behind
> - No `/debug`, `/admin`, `/backdoor` routes that bypass normal auth

**The Audit Prompt**
> Run this at the end of any security-sensitive session:
> *"Review all code written in this session. List any security concerns — missing validation, exposed secrets, unprotected routes, or logging issues. Fix them before we close."*

---

### 🔁 Production Hardening Audit — Session Trigger

Copy and paste this prompt to activate a full security audit at any time:

```
I am in 'Production Hardening' mode. Audit our current progress and implement
the following security essentials immediately. Do not skip these for speed:

1. Rate Limiting — sliding window or token bucket on all API and auth routes
2. Strict Input Validation — schema-based, reject on failure, sanitize all inputs
3. Secure Secret Handling — no hardcoded secrets, startup validation, .env.example
4. Additional Hardening — CORS, security headers, parameterized queries, no test routes

Review existing code. List what is missing. Implement each item one by one.
Reference this project's SECURITY.md for stack-specific implementation details.
Make this app unshakeable.
```
