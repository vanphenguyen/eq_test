# EQ Test 1.0 -- Development Documentation Pack

**Status:** Baseline for MVP implementation\
**Product:** EQ Test\
**Platform:** iOS, Flutter\
**Market:** Global\
**Initial locales:** English (en), Vietnamese (vi)\
**Assessment approach:** Self-report + situational scenarios\
**Monetization:** Free Quick Test with advertising; Premium Lifetime
unlock\
**Backend:** None in MVP

## Document inventory

1.  `PRD.md` -- Product vision, users, scope, features, user journeys,
    business rules, success metrics.
2.  `SRS.md` -- Functional and non-functional software requirements,
    architecture, data model, integrations, security and acceptance
    requirements.
3.  `QUESTION_BANK.md` -- Initial content model, 12-question Quick Test,
    40-question Full Assessment, answer options, reverse scoring,
    scenario scoring keys, content QA.
4.  `SCORING_SPEC.md` -- Authoritative scoring rules, normalization,
    missing data, profile generation, interpretation limits, worked
    examples and test vectors.
5.  `UI_UX_SPEC.md` -- Navigation, screen specifications, interaction
    states, visual system, accessibility, localization, paywall and ad
    placements.

## Implementation precedence

If documents appear to conflict, use this precedence: 1.
`SCORING_SPEC.md` for all calculations and interpretation. 2.
`QUESTION_BANK.md` for exact question wording, IDs, answer keys and
content metadata. 3. `SRS.md` for system behavior and technical
requirements. 4. `UI_UX_SPEC.md` for presentation and interaction. 5.
`PRD.md` for product intent and scope.

Raise a clarification rather than silently inventing a rule.

## Important scientific and product limitation

EQ Test is a self-reflection and educational product. Its internal
0--100 indices are product-defined reflection scores, not a clinically
validated, norm-referenced, diagnostic, employment, or standardized
emotional-intelligence measure. The situational items are authored
learning scenarios, not a validated ability-based assessment. Do not
market the result as a scientifically certified EQ score.

The question bank in this pack is an MVP content draft. Before public
release, conduct expert review, cognitive interviews, language review,
and pilot testing. Do not claim psychometric validity or reliability
until supported by appropriate research.

## AI Developer instructions

-   Implement the specifications as written.
-   Do not invent additional assessment dimensions, scoring weights,
    premium entitlements, or question wording.
-   Keep question content data-driven; do not hardcode question text in
    UI widgets.
-   Keep scoring deterministic, pure, unit-tested and independent of
    presentation.
-   Never send answers, assessment results, or emotional profiles to
    advertising SDKs.
-   Do not add accounts, cloud sync, remote analytics, AI-generated
    psychological interpretations, or backend services to MVP.
-   Store all user assessment data locally and provide a clear
    delete-data action.
-   Treat IAP entitlement as authoritative only after StoreKit
    transaction verification through the supported platform APIs.
-   Provide restore purchases.
-   Keep ads out of assessment questions and result screens.
-   Use the same question IDs and scoring keys across locales.
-   Any change to question wording, answer keys, scoring, or result
    thresholds requires a versioned content/scoring update and
    regression tests.

## Definition of MVP complete

The MVP is complete only when all P0 requirements in the five documents
are implemented, tested on supported iPhones, localized in English and
Vietnamese, and ready for App Store submission with privacy disclosures,
working IAP, restore purchases, and functioning ad consent behavior
where required.
