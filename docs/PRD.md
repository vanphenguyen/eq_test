# Product Requirements Document (PRD)

## EQ Test 1.0

**Document status:** Baseline\
**Owner:** Product\
**Target platform:** iOS\
**Framework:** Flutter\
**Release target:** MVP 1.0

## 1. Product summary

EQ Test is a mobile self-discovery application that helps adults reflect
on how they recognize, regulate, and respond to emotions in everyday
situations. It offers a short free assessment and a longer premium
assessment, then presents transparent dimension-level feedback and
practical exercises.

The product combines: - Self-report statements: users rate how well
statements describe their usual behavior. - Situational reflection:
users choose the response they consider most constructive in a described
scenario.

The app is educational and reflective. It does not diagnose, clinically
assess, certify, or rank a person's emotional intelligence.

## 2. Product vision

Help people understand their emotional habits and identify practical
opportunities for growth through an approachable, private, well-designed
mobile experience.

## 3. Goals

### 3.1 MVP goals

-   Deliver a complete, polished iOS app without requiring an account.
-   Provide a free Quick Test that delivers useful feedback.
-   Offer a paid Full Assessment with deeper reflection and actionable
    suggestions.
-   Explain results transparently and avoid unsupported scientific
    claims.
-   Monetize through non-personalized/contextual advertising where
    available and one-time Premium Lifetime IAP.
-   Keep assessment data on device.
-   Support English and Vietnamese from launch.

### 3.2 Non-goals

-   Clinical or mental-health diagnosis.
-   A validated psychometric instrument or norm-referenced EQ score.
-   Hiring, employee selection, school admissions, or other high-stakes
    decisions.
-   Social networking, leaderboards, public profiles or friend
    comparisons.
-   Cloud accounts, synchronization or server-side storage.
-   Generative-AI interpretation of personal answers.
-   Android release in version 1.0.
-   Personality testing or other assessment products.

## 4. Target users

Primary audience: adults aged 18+ interested in self-development,
communication, relationships, emotional habits and personal reflection.

User needs: - A short, approachable way to reflect on emotional
habits. - Clear explanations instead of a score without context. -
Practical actions that can be tried in everyday life. - Privacy and no
account creation. - A visually attractive result that can be shared
voluntarily.

The app must not target children or present itself as a substitute for
professional support.

## 5. Positioning and value proposition

**Working store positioning:** "Explore your emotional habits.
Understand your strengths. Find practical ways to grow."

Core value: 1. Discover -- complete a structured reflection. 2.
Understand -- review four dimensions and answer patterns. 3. Improve --
choose small, practical exercises. 4. Track -- revisit previous results
stored on the device.

## 6. Assessment model

Four product dimensions: 1. Self-Awareness -- noticing and naming one's
own emotional states. 2. Self-Regulation -- pausing and choosing
responses when emotions are strong. 3. Social Awareness -- considering
cues and perspectives of other people. 4. Relationship Management --
communicating, listening, resolving disagreements and repairing
interactions.

These are product organization categories, not a claim that EQ is
universally defined by exactly four dimensions.

### 6.1 Quick Test

-   12 items: 2 self-report + 1 situational item per dimension.
-   Expected duration: approximately 3--5 minutes.
-   Free.
-   Result includes four dimension reflection indices, an overall
    reflection index, brief interpretation and selected growth
    suggestions.
-   Advertising may appear on Home or other non-assessment surfaces
    subject to consent and platform policy; never inside the test or on
    the result screen.

### 6.2 Full Assessment

-   40 items: 6 self-report + 4 situational items per dimension.
-   Expected duration: approximately 10--15 minutes.
-   Premium Lifetime entitlement required.
-   Result includes detailed dimension feedback, strengths, growth
    opportunities, response-pattern reflections and a 7-day suggested
    practice plan.
-   The Full Assessment is not described as more scientifically
    accurate; it provides broader coverage and more detailed feedback.

## 7. Monetization and entitlement

### 7.1 Free

-   App access and onboarding.
-   Quick Test.
-   Quick Test result.
-   Local history for completed free tests.
-   Advertising on eligible non-assessment screens.
-   Access to Settings, privacy information and delete-data control.

### 7.2 Premium Lifetime

Recommended single non-consumable product: - Product ID:
`eqtest_premium_lifetime` - Unlock Full Assessment. - Unlock detailed
Full Assessment result and 7-day plan. - Remove ads. - Entitlement
persists after reinstall when restored through StoreKit.

Do not sell a separate Full Report or Remove Ads product in MVP. Avoid
duplicate or overlapping entitlements.

### 7.3 Purchase behavior

-   Display localized price returned by StoreKit; never hardcode a
    currency price in the UI.
-   Explain one-time payment and lifetime access clearly.
-   Provide Restore Purchases.
-   Do not unlock premium on a client-side button tap; unlock only after
    verified successful transaction state.
-   Handle pending, cancelled, failed, refunded/revoked and restored
    transactions.
-   Do not block free features if StoreKit is temporarily unavailable.

## 8. Core user journeys

### Journey A -- First use

Launch → onboarding → choose/confirm language → Home → Quick Test
introduction → questions → completion → result → optional share → Home.

### Journey B -- Premium conversion

Home → Full Assessment card → Premium paywall → StoreKit purchase →
verified entitlement → Full Assessment introduction → questions →
detailed result.

### Journey C -- Return user

Launch → Home → recent result/history → view previous result or start a
new assessment.

### Journey D -- Restore

Settings/Paywall → Restore Purchases → StoreKit restore/sync →
entitlement refresh → confirmation state.

### Journey E -- Privacy

Settings → Privacy & Data → delete all local assessment history and
answers → confirmation → data removed from local database.

## 9. Functional feature requirements

Priority definitions: - P0: required for MVP release. - P1: desirable
after launch; not release-blocking. - P2: explicitly out of MVP.

  -----------------------------------------------------------------------
  ID                      Requirement             Priority
  ----------------------- ----------------------- -----------------------
  FR-001                  App launches to a       P0
                          stable, branded entry   
                          screen                  

  FR-002                  First-run onboarding    P0
                          explains purpose and    
                          limitations             

  FR-003                  User can select English P0
                          or Vietnamese           

  FR-004                  User can start Quick    P0
                          Test without account    

  FR-005                  User can start Full     P0
                          Assessment only with    
                          Premium entitlement     

  FR-006                  Questions load from     P0
                          versioned content data  

  FR-007                  User can select one     P0
                          answer per question     

  FR-008                  User can navigate       P0
                          backward and forward    

  FR-009                  Progress is saved       P0
                          locally and can be      
                          resumed                 

  FR-010                  Completed assessment    P0
                          calculates              
                          deterministic scores    

  FR-011                  Results show four       P0
                          dimensions and overall  
                          reflection index        

  FR-012                  Results show            P0
                          interpretation caveat   

  FR-013                  Full result shows       P0
                          strengths, growth       
                          opportunities and 7-day 
                          practices               

  FR-014                  User can share a result P0
                          image voluntarily       

  FR-015                  User can view local     P0
                          assessment history      

  FR-016                  User can delete all     P0
                          local assessment data   

  FR-017                  Premium IAP purchase    P0
                          and restore work        

  FR-018                  Premium users see no    P0
                          app ads                 

  FR-019                  Ads never appear during P0
                          questions or on result  
                          screens                 

  FR-020                  Privacy policy, terms   P0
                          and support contact are 
                          accessible              

  FR-021                  App handles offline use P0
                          for assessment and      
                          results                 

  FR-022                  App supports dynamic    P0
                          text and accessibility  
                          labels                  

  FR-023                  App handles app         P0
                          interruption and        
                          relaunch safely         

  FR-024                  App supports localized  P0
                          content and UI in en/vi 
  -----------------------------------------------------------------------

## 10. Content and safety requirements

-   Use neutral, non-judgmental language.
-   Do not label users as emotionally deficient, toxic, unstable,
    narcissistic, abusive or disordered based on scores.
-   Do not infer diagnoses, trauma, personality disorders or mental
    health conditions.
-   Avoid absolute statements such as "You always..." or "You are
    incapable of...".
-   Use probabilistic reflective wording: "Your answers may suggest...",
    "You might find it useful to...".
-   Situational answer keys represent the app's preferred constructive
    response for learning purposes, not a definitive universally correct
    psychological answer.
-   Display the assessment limitation in onboarding/instructions and
    result views.
-   Provide content review by a qualified reviewer before public
    release.

## 11. Success metrics

Initial internal launch hypotheses, not industry benchmarks: -
Onboarding completion ≥ 80%. - Quick Test completion among starters ≥
65%. - Result view rate ≥ 60% of Quick Test starters. - Result share
rate ≥ 5% of completed tests. - Premium conversion target: 1--3% of
engaged users. - Crash-free sessions target ≥ 99.5%.

Because MVP has no backend analytics, these metrics cannot all be
measured centrally. Use App Store Connect aggregate metrics and
privacy-preserving, consented diagnostics only if explicitly added in a
later release. Do not add analytics SDKs silently.

## 12. Release scope and exit criteria

Release only when: - All P0 requirements pass. - All question IDs and
scoring keys match the approved content pack. - Scoring unit tests
pass. - IAP sandbox purchase, cancellation and restore pass. - Ads are
disabled for premium entitlement and excluded from assessment/result
screens. - Offline assessment works. - English and Vietnamese content
has been reviewed. - Privacy disclosures match actual SDK behavior. -
App Store metadata and screenshots contain no unsupported scientific
claims.
