import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models.dart';
import '../../l10n/app_localizations.dart';

class CompletionScreen extends StatelessWidget {
  const CompletionScreen({super.key, required this.sessionId, required this.type});

  final String sessionId;
  final AssessmentType type;

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Icon(Icons.check_circle_outline,
                  size: 64, color: Theme.of(context).colorScheme.primary),
              const SizedBox(height: 16),
              Text(l.completionTitle,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 8),
              Text(l.completionBody, textAlign: TextAlign.center),
              const SizedBox(height: 32),
              FilledButton(
                onPressed: () =>
                    context.pushReplacement('/result/$sessionId'),
                child: Text(l.viewMyResult),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
