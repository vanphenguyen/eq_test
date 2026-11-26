import 'dart:convert';
import 'dart:io';

import 'package:eq_test/domain/models.dart';

ContentBundle loadContent() {
  final file = File('assets/content/question_bank.json');
  return ContentBundle.fromJson(
    jsonDecode(file.readAsStringSync()) as Map<String, dynamic>,
  );
}

/// Builds answers for every item of [type]. [selfValue] receives the raw
/// self-report value that should be entered, [situational] the option label.
Map<String, String> buildAnswers(
  ContentBundle content,
  AssessmentType type, {
  required String Function(Question q) selfRaw,
  required String Function(Question q) situationalLabel,
}) {
  final answers = <String, String>{};
  for (final q in content.questionsFor(type)) {
    answers[q.id] = q.type == ItemType.selfReport
        ? selfRaw(q)
        : situationalLabel(q);
  }
  return answers;
}

/// Maximum response: 5 for normal items, 1 for reversed (adjusted = 5);
/// the highest-keyed option for situational items.
String maxSelfRaw(Question q) => q.reverseScored ? '1' : '5';
String minSelfRaw(Question q) => q.reverseScored ? '5' : '1';

String bestOption(Question q) =>
    q.options.reduce((a, b) => a.score >= b.score ? a : b).label;
String worstOption(Question q) =>
    q.options.reduce((a, b) => a.score <= b.score ? a : b).label;
