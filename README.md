# EQ Test

A local-first Flutter app for iOS for self-reflection on emotional habits. It has no
account, no backend, and no cloud sync. Specifications are in [`docs/`](docs/); scoring
follows `docs/SCORING_SPEC.md`, and content changes are listed in
[`docs/CONTENT_CHANGES.md`](docs/CONTENT_CHANGES.md).

> This is a self-reflection tool. Its indices are product-defined and are not a validated
> or diagnostic EQ measure.

## Layout

```
lib/
  domain/        Pure Dart: models, scoring engine, result content types (no Flutter)
  data/
    db/          Drift schema (sessions, answers, results, plan progress)
    repositories/ AssessmentRepository (transactional save, complete, history, delete)
    store/       PremiumService (StoreKit via in_app_purchase, product eqtest_premium_lifetime)
  features/      Screens: onboarding, home, tests, assessment, results, paywall, settings
  app/           Riverpod providers, go_router routes, theme, app root
  l10n/          ARB strings (English template + Vietnamese)
assets/content/  question_bank.json (content v1.1.0), result_content.json
test/            Scoring unit tests, repository tests, and widget flow tests
docs/            Development pack (PRD, SRS, scoring, UI/UX, question bank) + CONTENT_CHANGES.md
```

Questions are data-driven: question text and option keys come from the JSON, not from
widgets. Scoring is pure and deterministic and rejects incomplete or invalid answers
instead of returning a partial result.

## Run and test

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # Drift codegen
flutter gen-l10n                                           # ARB → Dart
flutter analyze
flutter test
flutter run                                                # on an iOS simulator or device
```

## Status and open items

Implemented: onboarding, language (en/vi), Quick Test (12 items), Full Assessment
(40 items, gated by Premium), resume after relaunch, quick and full results, dimension
detail, 7-day plan with local check-off, history, share image (native share sheet),
Premium purchase and restore through StoreKit, privacy page with delete-all.

Not done yet, and needed before release:

- **Ads.** No ad SDK is integrated. The pack's consent flow and ad placements are not
  implemented.
- **Terms, privacy policy, and support links.** The pack gives no URLs, so these buttons
  are disabled in the paywall, and settings has no support link yet.
- **StoreKit verification.** Premium unlocks on a verified `purchased`/`restored` status
  from `in_app_purchase`. Server-side or StoreKit 2 receipt verification and refund
  handling are not implemented.
- **iOS configuration.** The In-App Purchase capability, the product in App Store Connect,
  the App Store privacy disclosures, and screenshots still need to be set up.
- **Content review.** Vietnamese wording, the four added items, and result copy need
  review by a qualified reviewer and native speakers.
- **Device testing.** The app was built and tested on Linux (unit and widget tests). It
  has not been run on an iPhone or simulator.
