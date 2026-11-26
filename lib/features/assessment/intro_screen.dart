import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../domain/models.dart';
import '../../l10n/app_localizations.dart';
import '../common/widgets.dart';

class AssessmentIntroScreen extends ConsumerWidget {
  const AssessmentIntroScreen({super.key, required this.type});

  final AssessmentType type;

  Future<void> _start(BuildContext context, WidgetRef ref) async {
    final premium = ref.read(premiumProvider).value ?? false;
    if (type == AssessmentType.full && !premium) {
      context.pushReplacement('/paywall');
      return;
    }
    final locale = localeCodeOf(context);
    final repo = await ref.read(assessmentRepositoryProvider.future);
    final session = await repo.startOrResume(type, locale);
    if (context.mounted) {
      context.pushReplacement(
        '/assessment/${session.sessionId}/run?type=${type.code}',
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final content = ref.watch(contentProvider);
    final isFull = type == AssessmentType.full;
    final count = isFull ? 40 : 12;
    final minutes = isFull ? '10–15' : '3–5';
    final title = isFull ? l.fullAssessmentTitle : l.quickTestTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: l.closeAction,
          onPressed: () => context.pop(),
        ),
      ),
      body: content.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, _) => Center(child: Text(l.missingContentError)),
        data: (_) => SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  Chip(label: Text(l.introDuration(minutes))),
                  Chip(label: Text(l.introItems(count))),
                ],
              ),
              const SizedBox(height: 20),
              Text(l.introInstructions),
              const SizedBox(height: 8),
              Text(l.introSituationalNote),
              const SizedBox(height: 20),
              Text(l.introPrivacy),
              const SizedBox(height: 16),
              ReflectionCaveat(text: l.introLimitation),
              const SizedBox(height: 28),
              FilledButton(
                onPressed: () => _start(context, ref),
                child: Text(l.startAction),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
