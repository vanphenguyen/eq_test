import 'package:go_router/go_router.dart';

import '../domain/models.dart';
import '../features/assessment/completion_screen.dart';
import '../features/assessment/intro_screen.dart';
import '../features/assessment/question_screen.dart';
import '../features/home/home_shell.dart';
import '../features/onboarding/onboarding_screens.dart';
import '../features/paywall/paywall_screen.dart';
import '../features/results/dimension_detail_screen.dart';
import '../features/results/plan_screen.dart';
import '../features/results/result_screen.dart';
import '../features/settings/privacy_screen.dart';

GoRouter buildRouter() {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashScreen()),
      GoRoute(
        path: '/onboarding',
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/language',
        builder: (_, __) => const LanguageScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (_, __) => const HomeShell(),
      ),
      GoRoute(
        path: '/assessment/:type/intro',
        builder: (_, state) => AssessmentIntroScreen(
          type: AssessmentType.fromCode(state.pathParameters['type']!),
        ),
      ),
      GoRoute(
        path: '/assessment/:sessionId/run',
        builder: (_, state) => QuestionScreen(
          sessionId: state.pathParameters['sessionId']!,
          type: AssessmentType.fromCode(state.uri.queryParameters['type']!),
        ),
      ),
      GoRoute(
        path: '/assessment/:sessionId/done',
        builder: (_, state) => CompletionScreen(
          sessionId: state.pathParameters['sessionId']!,
          type: AssessmentType.fromCode(state.uri.queryParameters['type']!),
        ),
      ),
      GoRoute(
        path: '/result/:sessionId',
        builder: (_, state) => ResultScreen(
          sessionId: state.pathParameters['sessionId']!,
        ),
      ),
      GoRoute(
        path: '/result/:sessionId/dimension/:code',
        builder: (_, state) => DimensionDetailScreen(
          sessionId: state.pathParameters['sessionId']!,
          dimension: Dimension.fromCode(state.pathParameters['code']!),
        ),
      ),
      GoRoute(
        path: '/result/:sessionId/plan',
        builder: (_, state) => PlanScreen(
          sessionId: state.pathParameters['sessionId']!,
        ),
      ),
      GoRoute(
        path: '/paywall',
        builder: (_, __) => const PaywallScreen(),
      ),
      GoRoute(
        path: '/settings/privacy',
        builder: (_, __) => const PrivacyScreen(),
      ),
    ],
  );
}
