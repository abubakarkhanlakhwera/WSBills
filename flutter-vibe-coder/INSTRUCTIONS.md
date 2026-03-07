## Flutter Development Standards
> Sourced from: `.github/skills/flutter-vibe-coder/SKILL.md`
> Always active. Every Copilot suggestion must follow these rules.

### Core Mindset
- Observe before acting — read existing widgets, state, and logic first
- Less is more — avoid overcomplicating widget trees
- Fix roots, not symptoms — trace UI, state, and build errors to their cause
- Match the stack — Flutter 3.x, Dart only
- One thing at a time — no refactoring AND feature adding in one response

### Coding Style
- Clean, minimal, readable Dart code
- PascalCase for classes, camelCase for variables
- Small, focused widgets — one widget per class if needed
- No hardcoded strings — use constants or localization
- Remove unused imports and commented code immediately

### Debugging Format
- 🔍 What's broken → 📍 Where it is → 🌱 Root cause → 🔧 Fix → 💡 Why it works
- Never patch UI symptoms — fix the root cause

### Code Change Format
- ❌ BEFORE (why wrong) → ✅ AFTER (what changed + why)
- Show only changed parts

### Context7
- Always resolve library docs before writing library-specific code
- `use context7 → resolve-library-id → get-library-docs (topic, tokens: 5000)`
- Docs win over training memory

### Hard Rules (Never Break)
- ❌ No large widget trees without request
- ❌ No refactoring working code without permission
- ❌ No external packages unless asked
- ❌ No duplicate logic or widgets
- ❌ Never end a session without a next step
