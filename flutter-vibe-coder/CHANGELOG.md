# 📦 CHANGELOG.md — Flutter
> All notable changes to this project are documented here.
> Format: [Keep a Changelog](https://keepachangelog.com/en/1.1.0/)
> Versioning: [Semantic Versioning](https://semver.org/)

## [Unreleased]

### Added
- WSBills mobile lookup flow with search by connection number, mobile number, or partial name.
- Supabase integration via `supabase_flutter` and runtime `.env` loading with `flutter_dotenv`.
- Bill result cards with amount formatting, paid/unpaid status badges, and staggered entry animations.
- SQL migration for `public.bills` table plus anon read-only RLS policy.

### Changed
- Flutter app entrypoint moved to `lib/main.dart` with portrait orientation lock and app title `WSBills`.
- Theme updated to Material 3 with deep navy and sky blue palette plus Nunito/Playfair typography.
- Supabase bill lookup now targets live schema columns (`connection_no`, `consumer_mobile`, `consumer_name`, `locality`, `total_bill`, `status`).

### Fixed
-

### Removed
-

---

## [0.1.0] — {YYYY-MM-DD}

### Added
- Initial project scaffold with Flutter 3.x
- Base project structure and configuration
- Development environment setup

---

<!-- 
AI Instructions: When making changes, update [Unreleased] section.
Use these categories:
- Added: new features
- Changed: changes to existing functionality  
- Deprecated: soon-to-be removed features
- Removed: removed features
- Fixed: bug fixes
- Security: vulnerability fixes
-->
