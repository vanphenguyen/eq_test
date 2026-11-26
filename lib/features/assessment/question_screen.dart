import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../app/providers.dart';
import '../../domain/models.dart';
import '../../l10n/app_localizations.dart';
import '../common/widgets.dart';

class QuestionScreen extends ConsumerStatefulWidget {
  const QuestionScreen({super.key, required this.sessionId, required this.type});

  final String sessionId;
  final AssessmentType type;

  @override
  ConsumerState<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends ConsumerState<QuestionScreen> {
  ContentBundle? _content;
  List<Question> _questions = const [];
  Map<String, String> _answers = {};
  int _index = 0;
  bool _loading = true;
  bool _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final content = await ref.read(contentProvider.future);
      final repo = await ref.read(assessmentRepositoryProvider.future);
      final session = await repo.getInProgress(widget.sessionId);
      final answers = await repo.loadAnswers(widget.sessionId);
      if (!mounted) return;
      setState(() {
        _content = content;
        _questions = content.questionsFor(widget.type);
        _answers = answers;
        _index = (session?.currentIndex ?? 0).clamp(0, _questions.length - 1);
        _loading = false;
      });
    } catch (_) {
      if (mounted) {
        setState(() {
        _loading = false;
        _error = 'load';
      });
      }
    }
  }

  List<(String value, String label, String text)> _choicesFor(Question q) {
    final locale = localeCodeOf(context);
    if (q.type == ItemType.selfReport) {
      final labels = _content!.scaleLabels[locale]!;
      return [
        for (var i = 0; i < labels.length; i++)
          ('${i + 1}', '', labels[i]),
      ];
    }
    return [
      for (final o in q.options) (o.label, o.label, o.text.resolve(locale)),
    ];
  }

  Future<void> _select(String value) async {
    final q = _questions[_index];
    setState(() => _answers[q.id] = value);
    final repo = await ref.read(assessmentRepositoryProvider.future);
    await repo.saveAnswer(
      sessionId: widget.sessionId,
      questionId: q.id,
      value: value,
      currentIndex: _index,
    );
  }

  Future<void> _go(int target) async {
    final repo = await ref.read(assessmentRepositoryProvider.future);
    await repo.setPosition(widget.sessionId, target);
    setState(() => _index = target);
  }

  Future<void> _next() async {
    if (_busy) return;
    final isLast = _index == _questions.length - 1;
    if (!isLast) {
      await _go(_index + 1);
      return;
    }
    setState(() => _busy = true);
    try {
      final repo = await ref.read(assessmentRepositoryProvider.future);
      await repo.complete(sessionId: widget.sessionId, type: widget.type);
      if (mounted) {
        context.pushReplacement(
          '/assessment/${widget.sessionId}/done?type=${widget.type.code}',
        );
      }
    } catch (_) {
      // Incomplete or invalid answers never produce a partial result.
      if (mounted) {
        setState(() => _busy = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(AppLocalizations.of(context).genericError)),
        );
      }
    }
  }

  Future<void> _requestExit() async {
    final l = AppLocalizations.of(context);
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(l.exitTitle, style: Theme.of(ctx).textTheme.titleLarge),
              const SizedBox(height: 8),
              Text(l.exitBody),
              const SizedBox(height: 20),
              FilledButton(
                onPressed: () => Navigator.pop(ctx, 'continue'),
                child: Text(l.continueAssessment),
              ),
              const SizedBox(height: 8),
              OutlinedButton(
                onPressed: () => Navigator.pop(ctx, 'save'),
                child: Text(l.saveAndExit),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () => Navigator.pop(ctx, 'abandon'),
                child: Text(l.abandonAssessment),
              ),
            ],
          ),
        ),
      ),
    );
    if (!mounted || action == null || action == 'continue') return;
    if (action == 'abandon') {
      final sure = await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l.abandonTitle),
          content: Text(l.abandonBody),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, false),
              child: Text(l.cancelAction),
            ),
            FilledButton(
              onPressed: () => Navigator.pop(ctx, true),
              child: Text(l.abandonAssessment),
            ),
          ],
        ),
      );
      if (sure != true || !mounted) return;
      final repo = await ref.read(assessmentRepositoryProvider.future);
      await repo.abandon(widget.sessionId);
    }
    if (mounted) context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    if (_loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    if (_error != null || _questions.isEmpty) {
      return Scaffold(body: Center(child: Text(l.missingContentError)));
    }

    final q = _questions[_index];
    final locale = localeCodeOf(context);
    final selected = _answers[q.id];
    final choices = _choicesFor(q);
    final isLast = _index == _questions.length - 1;
    final total = _questions.length;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _requestExit();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            tooltip: l.closeAction,
            onPressed: _requestExit,
          ),
          title: Text(l.questionProgress(_index + 1, total)),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              LinearProgressIndicator(
                value: (_index + 1) / total,
                minHeight: 4,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                  children: [
                    Text(
                      q.prompt.resolve(locale),
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            height: 1.35,
                          ),
                    ),
                    const SizedBox(height: 24),
                    for (final c in choices)
                      ChoiceTile(
                        label: c.$2,
                        text: c.$3,
                        selected: selected == c.$1,
                        onTap: () => _select(c.$1),
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _index == 0 || _busy
                            ? null
                            : () => _go(_index - 1),
                        child: Text(l.previousAction),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: selected == null || _busy ? null : _next,
                        child: Text(isLast ? l.seeMyResults : l.nextAction),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
