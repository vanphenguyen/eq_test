# UI/UX Specification

## EQ Test 1.0

## 1. Design direction

**Style:** Premium Minimal Psychology\
**Tone:** Calm, supportive, modern, non-judgmental\
**Primary locale:** English\
**Secondary locale:** Vietnamese

Visual principles: - Warm, uncluttered surfaces. - Indigo/purple as
primary brand family, soft blue as secondary. - High-contrast text and
restrained gradients. - Rounded cards with consistent spacing. - Clear
progress and feedback. - Motion is subtle and never required to
understand state. - Avoid medical, diagnostic or brain-scan visual
metaphors.

## 2. Navigation

Four primary destinations: 1. Home 2. Tests 3. History 4. Settings

Use a bottom navigation bar on main app surfaces. Assessment flow should
use a focused full-screen layout with a back control and progress
indicator.

## 3. Screen inventory

  ID       Screen                Key content
  -------- --------------------- -----------------------------------------------------
  UI-001   Splash                Logo, app initialization
  UI-002   Onboarding            Value proposition, privacy, limitations
  UI-003   Language Selection    English / Vietnamese
  UI-004   Home                  Welcome, Quick Test, Full Assessment, latest result
  UI-005   Test Catalog          Test cards and access state
  UI-006   Assessment Intro      Duration, item count, response guidance
  UI-007   Question              Prompt, options, progress, previous/next
  UI-008   Exit Confirmation     Save and exit / continue
  UI-009   Completion            Completion confirmation
  UI-010   Quick Result          Overall index, dimensions, caveat
  UI-011   Dimension Detail      Dimension score and reflection
  UI-012   Full Result           Strengths, growth opportunities
  UI-013   7-Day Plan            Daily practical activities
  UI-014   Share Result          Preview share card and native share
  UI-015   History               Completed sessions list
  UI-016   History Detail        Previous result
  UI-017   Paywall               Premium Lifetime benefits and purchase
  UI-018   Purchase State        Loading, success, pending, failure
  UI-019   Settings              Language, privacy, restore, about
  UI-020   Privacy & Data        Privacy policy, delete local data
  UI-021   Delete Confirmation   Confirm/cancel
  UI-022   About & Disclaimer    Product purpose and limitations

## 4. Screen requirements

### UI-001 Splash

-   Display brand mark and EQ Test.
-   Avoid artificial loading delays.
-   Route to onboarding only on first run; otherwise Home.
-   Handle database and StoreKit initialization failures gracefully.

### UI-002 Onboarding

Three concise panels: 1. "Understand your emotional habits." 2. "Explore
four areas of emotional awareness and interaction." 3. "Your responses
stay on this device. This is a self-reflection tool, not a diagnosis or
validated EQ measurement."

Actions: Continue, Skip (where appropriate), Get Started.

### UI-003 Language Selection

-   English and Vietnamese.
-   Persist selection.
-   Do not infer or expose precise location.
-   System language may be used as initial suggestion, but user choice
    wins.

### UI-004 Home

Hierarchy: 1. Greeting without requiring a name. 2. Primary Quick Test
card with duration and free label. 3. Full Assessment card with Premium
label/lock state. 4. Latest result summary if available. 5. Small
educational insight. 6. Bottom navigation.

Ads: optional native ad only in a designated non-intrusive slot, subject
to consent and entitlement. No ad should displace the primary action.

### UI-005 Test Catalog

-   Separate Free and Premium cards.
-   Explain duration and item count.
-   Premium card opens paywall when locked.
-   Do not imply Full Assessment is scientifically more accurate.

### UI-006 Assessment Intro

Show: - Assessment name. - Estimated duration. - Number of items. -
Response instructions. - Privacy reminder. - Limitation statement. -
Start / Resume action.

### UI-007 Question

Layout: - Top: close/back and progress text. - Progress bar. - Dimension
label (optional; avoid revealing a desired answer). - Question prompt. -
Response options. - Previous and Next controls. - Save automatically.

Self-report options: five clearly labeled choices. Situational options:
four text choices; do not color-code one option as correct before
submission.

Interaction: - Selection updates local state. - Next enabled only after
valid answer. - Previous preserves current answer. - On final question,
button label becomes "See my results". - No ads, paywall interruptions,
external links or distracting animation.

### UI-008 Exit Confirmation

Explain progress is saved. Actions: - Continue assessment. - Save and
exit. - Abandon assessment (separate destructive confirmation if
needed).

### UI-009 Completion

Show calm completion confirmation and transition to result. Do not
insert an interstitial ad.

### UI-010 Quick Result

Show: - "Your EQ Reflection Index". - Overall score and provisional
label. - Four dimension scores. - Brief authored summary. - Visible
limitation note. - Explore dimensions / Share / Home.

Do not show percentiles, average population comparisons, "top X%" or
clinical claims.

### UI-011 Dimension Detail

Show: - Dimension name and plain-language definition. - Dimension
index. - Self-report subscore and situational subscore separately. - One
or two reflection statements. - Practical suggestion.

### UI-012 Full Result

Show: - Overall reflection index. - Four dimension indices. -
Strengths. - Growth opportunities. - Response pattern observations. -
Disclaimer. - CTA to 7-Day Plan and Share.

### UI-013 7-Day Plan

-   Seven short, optional activities.
-   Each activity should be achievable in 5--10 minutes.
-   Activities are educational prompts, not treatment.
-   User can mark an activity complete locally.
-   Do not claim the plan will increase EQ by a guaranteed amount.

### UI-014 Share Result

-   Preview before sharing.
-   User explicitly taps Share.
-   Export only overall score, dimension summary and app branding.
-   Do not include raw answers, full item-level response data or private
    notes.
-   Include a small "self-reflection result" caveat on the share image.

### UI-015/016 History

-   Newest first.
-   Display date, assessment type and overall index.
-   Tap to view stored result.
-   Empty state encourages a first Quick Test.
-   Do not imply score changes necessarily represent real psychological
    change.

### UI-017 Paywall

Content: - Headline: "Go deeper with Premium". - Benefits: Full
Assessment, detailed dimension reflections, 7-day practice plan, ad-free
experience. - One-time payment label: "Pay once. Keep access." -
StoreKit localized price. - Purchase button. - Restore Purchases. -
Terms and Privacy links. - Clear close button. - No fake countdowns,
false scarcity, preselected recurring billing or misleading price
presentation.

### UI-018 Purchase State

Handle: - Loading. - Success. - Pending. - User cancelled. - Store
unavailable. - Product unavailable. - Restore found. - Restore found
nothing. - Transaction revoked/refunded.

### UI-019 Settings

-   Language.
-   Premium status / restore.
-   Privacy & Data.
-   Terms.
-   About.
-   Contact/support link.

### UI-020/021 Privacy and deletion

-   Explain local storage and third-party SDK data practices.
-   Delete all assessment sessions, answers and results after
    confirmation.
-   Do not delete App Store purchase entitlement.
-   Explain that deletion cannot reverse data already shared by the user
    through the share sheet.

### UI-022 About

Include: - Product purpose. - Assessment limitation. - Content/scoring
version where useful. - Support contact. - Privacy and terms.

## 5. Visual tokens

Suggested starting tokens (adjust after visual QA): - Primary:
indigo/purple family. - Secondary: soft blue. - Background: warm
white. - Surface: white/light neutral. - Primary text: near-black. -
Secondary text: neutral gray. - Success: restrained green. - Warning:
amber. - Error: accessible red.

Spacing scale: 4, 8, 12, 16, 20, 24, 32. Card radius: 16--20. Button
height: at least 48. Touch targets: follow Apple accessibility guidance;
aim for 44×44 pt minimum. Use SF Pro on iOS or a consistent bundled font
with full Vietnamese glyph coverage.

## 6. Charts

-   Radar chart may be used as a secondary visual, not the only
    representation.
-   Always provide a textual list of four dimension values.
-   Do not use red/green to imply good/bad emotional character.
-   Avoid misleading truncated axes.
-   Display scores as product reflection indices.
-   Ensure chart labels remain legible at larger text sizes.

## 7. Motion and feedback

-   Short transitions, approximately 150--250 ms where appropriate.
-   Respect Reduce Motion.
-   Haptic feedback optional and subtle.
-   Do not use celebratory or punitive animation based on score.
-   Provide clear loading and error states.

## 8. Accessibility

-   VoiceOver labels for controls and charts.
-   Logical focus order.
-   Dynamic Type support.
-   Sufficient contrast.
-   Do not encode selected state only by color.
-   Support larger text without clipping.
-   Localized accessibility labels.
-   Buttons have clear verbs.

## 9. Localization and content layout

-   All user-visible text comes from localization/content resources.
-   English and Vietnamese must be tested on small and large iPhones.
-   Allow wrapping; do not rely on fixed-height question cards.
-   Keep option order and scoring IDs consistent across locales.
-   Do not machine-translate psychological nuance without review.
-   Use locale-aware date and currency formatting.

## 10. Ads and paywall UX rules

-   No ads in assessment flow, completion, results or paywall.
-   No ads targeted using emotional profile or answers.
-   Premium removes app ads.
-   Ad failure collapses the slot cleanly.
-   Consent flow must not block free assessment if the user declines
    ads.
-   Paywall must state one-time payment and lifetime access clearly.
-   Restore Purchases remains visible.

## 11. UX acceptance checklist

-   First-time user can reach Quick Test in no more than a few clear
    actions.
-   Every question state has selected, unselected, disabled and
    navigation states.
-   Back navigation preserves answers.
-   Progress is understandable and accurate.
-   Result caveat is readable, not hidden in legal copy.
-   Premium price comes from StoreKit.
-   Restore is discoverable.
-   No ad appears in assessment or result.
-   All screens support English and Vietnamese.
-   VoiceOver can complete the test.
-   Share preview contains no raw answers.
