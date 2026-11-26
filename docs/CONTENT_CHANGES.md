# Content changes: v1.0.0 pack → v1.1.0 app content

The authoritative content for the app is now `assets/content/question_bank.json`
(v1.1.0) and `assets/content/result_content.json` (v1.1.0). `QUESTION_BANK.md` in
this folder is the original v1.0.0 draft and is kept for reference. Where the two
differ in wording, the JSON is what the app uses.

## 1. Wording was revised

Prompts and options were rewritten to sound more natural and to vary sentence
structure (the v1.0.0 items repeated "I can…" and "When I…" patterns). For every
item the following were kept unchanged: the ID, dimension, item type, reverse-scoring
flag, and every situational key (letter → keyed score).

Vietnamese (`vi`) text is new in this version. It was drafted to read naturally
rather than translated word for word. It still needs a native speaker and a
qualified reviewer before release (see the pack's `QUESTION_BANK.md` section 8).

## 2. Four situational items were added (gap in the pack)

The pack requires the Full Assessment to have 40 items, 10 per dimension (6 self-report
and 4 situational). The pack's listed items total 36: each dimension had only 3
situational items, not 4. The following were added, one per dimension, using the same
structure and a keyed 1–4 score per option:

| ID | Dimension | Scenario (summary) |
|---|---|---|
| F-SA-10 | Self-Awareness | Unexplained flat mood before a trip |
| F-SR-10 | Self-Regulation | A friend's offhand remark stings in a group chat |
| F-SO-10 | Social Awareness | A new team member left out of a lunch plan |
| F-RM-10 | Relationship Management | A housemate keeps leaving shared chores undone |

These four are drafts written for this build. They are flagged for expert review.

## 3. Result copy is new

The pack defines the bands and the overall label text (SCORING_SPEC.md §7), but it
does not include the dimension-level reflections, strengths, growth lines, or the 7-day
practice plan that the spec requires for the Full result. These were drafted in
`assets/content/result_content.json`. They use "may suggest" wording and avoid
absolute claims. They also need review.

## 4. Versioning

`contentVersion` is `1.1.0` and `scoringVersion` is `1.0.0`. Scoring formulas,
bands, and keys are unchanged from the pack. Results store the version they were
scored under, so history is never recalculated.
