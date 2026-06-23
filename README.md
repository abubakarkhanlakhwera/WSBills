# WSBills - Water Supply Billing App

Flutter/Dart application for water supply billing, payment tracking, customer records, and local service workflows.

## Overview

Many small water-supply operators still depend on manual registers, spreadsheets, paper slips, or scattered records. WSBills is a practical app direction for managing customers, bills, payment status, dues, and service records in a cleaner digital workflow.

## Core Capabilities

- Water-supply billing workflow foundation
- Customer and payment-status management direction
- Supabase-ready backend configuration through environment variables
- Mobile-first Flutter structure
- Documentation scaffold for product planning, onboarding, and implementation decisions

## Tech Stack

- Flutter and Dart
- Supabase Flutter
- `flutter_dotenv` style runtime configuration
- Local-first mobile product thinking for service teams

## Repository Structure

```text
flutter-vibe-coder/   Main Flutter application workspace
MASTER_INSTRUCTIONS.md Project planning and build guidance
.vscode/             Local editor configuration
```

## Environment Setup

Copy the example environment file and fill in project-specific values:

```bash
cp flutter-vibe-coder/.env.example flutter-vibe-coder/.env
```

Required variables:

```text
SUPABASE_URL=
SUPABASE_ANON_KEY=
```

Do not commit `.env` files or real customer data.

## Getting Started

```bash
cd flutter-vibe-coder
flutter pub get
flutter analyze
flutter test
flutter run
```

## Security Notes

- Review Supabase Row Level Security policies before using real data.
- Treat billing/customer records as private operational data.
- Keep only sample/demo records in public screenshots or test fixtures.
- Rotate credentials if any private value was ever committed.

## Roadmap

- Add screenshots of customer, billing, and payment-status screens
- Document the complete billing lifecycle
- Add sample data fixtures
- Add CI and release packaging once the app structure is stable

## Author

Muhammad AbuBakar Siddique
Portfolio: [abees.me](https://abees.me)
