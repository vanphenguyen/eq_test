# Scoring Specification

## EQ Test 1.0

**This document is authoritative for score calculation.**

## 1. Purpose and interpretation

The app calculates product-defined reflection indices from user
responses. These are not standardized EQ scores, clinical scores,
percentiles, population norms or validated psychometric measurements.

The overall index is a descriptive summary of the app's authored
content. It must be labeled **EQ Reflection Index** or **EQ Profile
Index**, never presented as a certified or objectively measured EQ.

## 2. Dimensions

-   SA: Self-Awareness
-   SR: Self-Regulation
-   SO: Social Awareness
-   RM: Relationship Management

Each dimension contributes equally to the overall index.

## 3. Item types and raw scoring

### 3.1 Self-report

Raw response is integer 1--5: 1 Strongly disagree 2 Disagree 3 Neither
agree nor disagree 4 Agree 5 Strongly agree

Normal item: adjusted score = raw response.

Reverse item: adjusted score = 6 - raw response.

Reverse scoring is applied only when `reverseScored=true` in the
question data.

### 3.2 Situational

Each option maps to integer 1--4 in the question bank. Use the exact
keyed value. Do not infer or calculate a score from option order.

The scenario key represents the response most aligned with the app's
educational guidance. It is not an objectively correct answer in every
real-life context.

## 4. Per-dimension normalization

For each dimension, calculate self-report and situational subscores
separately.

Self-report normalized score:
`SR_norm = ((mean(selfReportAdjusted) - 1) / 4) * 100`

Situational normalized score:
`SIT_norm = ((mean(situationalKeyed) - 1) / 3) * 100`

Both produce values from 0 to 100.

For each dimension:
`DimensionIndex = (0.5 * SR_norm) + (0.5 * SIT_norm)`

This 50/50 weighting is a product design choice for balanced
presentation. It is not empirically derived.

Why keep the two subscores separate: self-perception and responses to
authored scenarios are different response formats and should not be
treated as interchangeable measurements.

## 5. Overall index

`EQReflectionIndex = mean(SA_Index, SR_Index, SO_Index, RM_Index)`

All four dimensions have equal weight. Round only for display; retain
full precision internally.

Display: - Overall index: nearest integer. - Dimension index: nearest
integer. - Do not display decimal precision that implies scientific
accuracy.

## 6. Quick Test and Full Assessment

Quick Test has per dimension: - 2 self-report items. - 1 situational
item.

Full Assessment has per dimension: - 6 self-report items. - 4
situational items.

Both use the same dimension formula. Quick Test is a shorter reflection
snapshot; Full Assessment provides more item coverage and richer
feedback. Do not claim the Full Assessment is validated or objectively
more accurate.

## 7. Interpretation bands

Use these product-language bands for display only:

      Index Label
  --------- ------------
      0--39 Developing
     40--59 Emerging
     60--79 Growing
    80--100 Strong

These thresholds are provisional UX groupings, not norms or diagnostic
cutoffs. Do not tell users that they are below/above average or compare
them with a population.

Use neutral descriptions: - Developing: "Your responses point to an area
you may want to explore with small, practical steps." - Emerging: "Your
responses show some helpful habits, alongside opportunities to build
consistency." - Growing: "Your responses suggest several developing
habits you can continue to strengthen." - Strong: "Your responses
indicate habits that may be useful strengths in the situations covered
by this assessment."

## 8. Missing responses

-   Required item unanswered: assessment cannot be submitted.
-   Do not impute, estimate or substitute missing responses.
-   No partial dimension score in the final result.
-   A saved in-progress session may contain unanswered items.
-   Abandoned sessions do not produce a result.

## 9. Result generation

Result generation must be deterministic and authored.

Inputs: - dimension indices, - self-report and situational subscores, -
item-level answer patterns, - assessment type, - content version.

Output: - overall index and band, - four dimension indices and bands, -
strengths, - growth opportunities, - 7-day practice plan for Full
Assessment.

Rules: - Select a small number of observations based on predefined
thresholds and item tags. - Avoid generating a statement from a single
response unless it is framed as a reflection prompt. - Use "your
responses may suggest" rather than "you are". - Never infer a mental
health condition, trauma, abuse, personality disorder or risk state. -
Do not produce a ranking, percentile or prediction. - If subscores
diverge, describe the difference without treating it as inconsistency or
deception.

## 10. Worked example

Example for Self-Awareness in Quick Test: - Q-SA-01 self-report raw = 4;
normal item → 4. - Q-SA-02 self-report raw = 2; reverse item → 6 - 2 =
4. - Q-SA-03 situational selected option C → keyed score 4.

Self-report mean = (4 + 4) / 2 = 4.
`SR_norm = ((4 - 1) / 4) * 100 = 75`.

Situational mean = 4. `SIT_norm = ((4 - 1) / 3) * 100 = 100`.

Dimension index = (75 + 100) / 2 = 87.5 → display 88.

The high result is an app reflection index, not proof of a high
standardized EQ.

## 11. Implementation pseudocode

``` text
function calculateDimension(items, answers):
    selfValues = []
    situationalValues = []

    for item in items:
        answer = answers[item.id]
        if answer is missing:
            raise IncompleteAssessment

        if item.type == "self_report":
            value = answer
            if item.reverseScored:
                value = 6 - value
            assert 1 <= value <= 5
            selfValues.append(value)

        else if item.type == "situational":
            value = item.optionScores[answer]
            assert 1 <= value <= 4
            situationalValues.append(value)

    assert selfValues is not empty
    assert situationalValues is not empty

    selfNorm = ((mean(selfValues) - 1) / 4) * 100
    situationalNorm = ((mean(situationalValues) - 1) / 3) * 100

    return 0.5 * selfNorm + 0.5 * situationalNorm

function calculateAssessment(questionSet, answers):
    for each required question:
        if answer missing:
            raise IncompleteAssessment

    for dimension in [SA, SR, SO, RM]:
        dimensionScore[dimension] =
            calculateDimension(dimension.items, answers)

    overall = mean(all four dimensionScore values)

    return result with full precision, contentVersion, scoringVersion
```

## 12. Required unit tests

1.  Lowest possible response on all self-report and situational items →
    dimension 0.
2.  Highest possible response on all items → dimension 100.
3.  Reverse item raw 1 → adjusted 5.
4.  Reverse item raw 5 → adjusted 1.
5.  Scenario option maps to exact key, not option index.
6.  Quick Test has correct item counts and per-dimension composition.
7.  Full Assessment has correct item counts and per-dimension
    composition.
8.  Missing answer rejects submission.
9.  Unknown question ID rejects scoring.
10. Invalid Likert value rejects scoring.
11. Invalid situational option rejects scoring.
12. Overall index equals arithmetic mean of four dimension indices.
13. Display rounding does not alter stored score.
14. Interpretation bands handle boundary values 39, 40, 59, 60, 79, 80.
15. Result content is deterministic for same inputs and content version.

## 13. Versioning

Maintain: - `contentVersion`, e.g. `1.0.0` - `scoringVersion`,
e.g. `1.0.0`

Any change to prompt wording that affects meaning, reverse-scoring
flags, scenario keys, formulas or thresholds requires a version
increment and regression tests. Historical results must retain their
original version metadata. Never silently recalculate historical results
using new rules.
