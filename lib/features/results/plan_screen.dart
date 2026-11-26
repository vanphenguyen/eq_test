import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../l10n/app_localizations.dart';
import '../common/widgets.dart';

class PlanScreen extends ConsumerWidget {
  const PlanScreen({super.key, required this.sessionId});

  final String sessionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l = AppLocalizations.of(context);
    final locale = localeCodeOf(context);
    final content = ref.watch(resultContentProvider).value;
    final done = ref.watch(planProgressProvider(sessionId)).value ?? {};

    return Scaffold(
      appBar: AppBar(title: Text(l.planTitle)),
      body: content == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(l.planIntro),
                const SizedBox(height: 8),
                Text(l.daysDone(done.length),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(height: 12),
                for (final a in content.practicePlan)
                  Card(
                    child: CheckboxListTile(
                      value: done.contains(a.day),
                      title: Text('${a.day}. ${a.title.resolve(locale)}'),
                      subtitle: Text(a.body.resolve(locale)),
                      controlAffinity: ListTileControlAffinity.trailing,
                      onChanged: (v) async {
                        final repo = await ref.read(
                            assessmentRepositoryProvider.future);
                        await repo.setPlanDayCompleted(
                          sessionId,
                          a.day,
                          v ?? false,
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 12),
                ReflectionCaveat(text: l.resultCaveat),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () => context.go('/home'),
                  child: Text(l.backToHome),
                ),
              ],
            ),
    );
  }
}
