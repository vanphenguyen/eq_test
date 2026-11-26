// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'EQ Test';

  @override
  String get tabHome => 'Home';

  @override
  String get tabTests => 'Tests';

  @override
  String get tabHistory => 'History';

  @override
  String get tabSettings => 'Settings';

  @override
  String get continueAction => 'Continue';

  @override
  String get skipAction => 'Skip';

  @override
  String get getStarted => 'Get started';

  @override
  String get backAction => 'Back';

  @override
  String get closeAction => 'Close';

  @override
  String get cancelAction => 'Cancel';

  @override
  String get confirmAction => 'Confirm';

  @override
  String get onboardingTitle1 => 'Understand your emotional habits.';

  @override
  String get onboardingTitle2 =>
      'Explore four areas of emotional awareness and interaction.';

  @override
  String get onboardingTitle3 => 'Your responses stay on this device.';

  @override
  String get onboardingBody3 =>
      'This is a self-reflection tool, not a diagnosis or a validated EQ measurement.';

  @override
  String get chooseLanguageTitle => 'Choose your language';

  @override
  String get chooseLanguageBody => 'You can change this later in Settings.';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get homeGreeting => 'Take a moment for yourself today.';

  @override
  String get quickTestTitle => 'Quick Test';

  @override
  String get quickTestMeta => 'About 3–5 minutes · Free';

  @override
  String get fullAssessmentTitle => 'Full Assessment';

  @override
  String get fullAssessmentMeta => 'About 10–15 minutes · Premium';

  @override
  String get premiumLockLabel => 'Premium';

  @override
  String get latestResultTitle => 'Your latest result';

  @override
  String get viewResult => 'View result';

  @override
  String get noResultYet => 'You haven\'t completed an assessment yet.';

  @override
  String get insightTitle => 'A small insight';

  @override
  String get insightBody =>
      'Putting a name to a feeling can make it easier to decide how to respond.';

  @override
  String get testsTitle => 'Tests';

  @override
  String get freeTag => 'Free';

  @override
  String get premiumTag => 'Premium';

  @override
  String get unlockWithPremium => 'Unlock with Premium';

  @override
  String introDuration(String minutes) {
    return 'About $minutes minutes';
  }

  @override
  String introItems(int count) {
    return '$count items';
  }

  @override
  String get introInstructions =>
      'For each statement, choose the answer that fits you best. There are no right or wrong answers.';

  @override
  String get introSituationalNote =>
      'Some items describe a situation. Pick the response you would most likely choose.';

  @override
  String get introPrivacy => 'Your answers are saved only on this device.';

  @override
  String get introLimitation =>
      'This is a reflection tool. It is not a diagnosis or a validated EQ measurement.';

  @override
  String get startAction => 'Start';

  @override
  String get resumeAction => 'Resume';

  @override
  String questionProgress(int current, int total) {
    return '$current of $total';
  }

  @override
  String get nextAction => 'Next';

  @override
  String get previousAction => 'Previous';

  @override
  String get seeMyResults => 'See my results';

  @override
  String get exitTitle => 'Leave this assessment?';

  @override
  String get exitBody =>
      'Your progress is saved. You can pick up where you left off.';

  @override
  String get continueAssessment => 'Keep going';

  @override
  String get saveAndExit => 'Save and exit';

  @override
  String get abandonAssessment => 'Abandon assessment';

  @override
  String get abandonTitle => 'Abandon this assessment?';

  @override
  String get abandonBody =>
      'Your answers for this session will be deleted. This cannot be undone.';

  @override
  String get completionTitle => 'All done';

  @override
  String get completionBody => 'Thank you for taking the time to reflect.';

  @override
  String get viewMyResult => 'View my result';

  @override
  String get resultTitle => 'Your EQ Reflection Index';

  @override
  String get resultCaveat =>
      'This is a self-reflection index. It is not a validated or diagnostic measure of emotional intelligence.';

  @override
  String get exploreDimensions => 'Explore dimensions';

  @override
  String get shareResult => 'Share';

  @override
  String get backToHome => 'Back to home';

  @override
  String get fullResultTitle => 'Full result';

  @override
  String get strengthsTitle => 'Strengths';

  @override
  String get growthTitle => 'Growth opportunities';

  @override
  String get dimensionDetailTitle => 'Dimension detail';

  @override
  String get selfReportSubscore => 'Self-report';

  @override
  String get situationalSubscore => 'Scenarios';

  @override
  String get practicalSuggestion => 'A practical idea';

  @override
  String get sevenDayPlanAction => '7-day practice plan';

  @override
  String get planTitle => '7-day practice plan';

  @override
  String get planIntro =>
      'Seven short, optional activities of about 5–10 minutes each. They are prompts to try, not treatment, and they do not guarantee any change.';

  @override
  String get markDone => 'Mark as done';

  @override
  String get markUndone => 'Mark as not done';

  @override
  String daysDone(int done) {
    return '$done of 7 done';
  }

  @override
  String get bandDeveloping => 'Developing';

  @override
  String get bandEmerging => 'Emerging';

  @override
  String get bandGrowing => 'Growing';

  @override
  String get bandStrong => 'Strong';

  @override
  String get dimSelfAwareness => 'Self-Awareness';

  @override
  String get dimSelfRegulation => 'Self-Regulation';

  @override
  String get dimSocialAwareness => 'Social Awareness';

  @override
  String get dimRelationshipManagement => 'Relationship Management';

  @override
  String get historyTitle => 'History';

  @override
  String get historyEmptyTitle => 'No results yet';

  @override
  String get historyEmptyBody => 'Your completed assessments will appear here.';

  @override
  String get startQuickTest => 'Start a Quick Test';

  @override
  String get quickLabel => 'Quick Test';

  @override
  String get fullLabel => 'Full Assessment';

  @override
  String get paywallHeadline => 'Go deeper with Premium';

  @override
  String get paywallBenefit1 => 'Full Assessment with 40 items';

  @override
  String get paywallBenefit2 => 'Detailed dimension reflections and strengths';

  @override
  String get paywallBenefit3 => 'A 7-day practice plan';

  @override
  String get paywallBenefit4 => 'An ad-free experience';

  @override
  String get paywallPayOnce => 'Pay once. Keep access.';

  @override
  String get paywallLifetimeNote =>
      'Premium is a one-time purchase that stays with your Apple account.';

  @override
  String get buyPremium => 'Unlock Premium';

  @override
  String get restorePurchases => 'Restore purchases';

  @override
  String get termsLink => 'Terms of use';

  @override
  String get privacyLink => 'Privacy policy';

  @override
  String get purchasePending =>
      'Your purchase is pending approval. Premium will unlock once it\'s confirmed.';

  @override
  String get purchaseCancelled => 'Purchase cancelled. Nothing was charged.';

  @override
  String get purchaseFailed =>
      'The purchase did not complete. Please try again.';

  @override
  String get productUnavailable =>
      'Premium isn\'t available right now. Please try again later.';

  @override
  String get storeUnavailable =>
      'The App Store can\'t be reached right now. Your free features still work.';

  @override
  String get restoreFound => 'Your Premium access has been restored.';

  @override
  String get restoreNothing =>
      'No previous purchases were found on this Apple account.';

  @override
  String get premiumActive => 'Premium is active';

  @override
  String get premiumInactive => 'Premium is not active';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsPremium => 'Premium';

  @override
  String get settingsPrivacy => 'Privacy & data';

  @override
  String get settingsTerms => 'Terms of use';

  @override
  String get settingsAbout => 'About';

  @override
  String get settingsSupport => 'Contact support';

  @override
  String get privacyTitle => 'Privacy & data';

  @override
  String get privacyBody =>
      'Your answers, results and history are stored only on this device. The app does not create an account and does not send your answers to anyone. Ads never appear during assessments, on result screens or on the paywall.';

  @override
  String get deleteAllData => 'Delete all assessment data';

  @override
  String get deleteConfirmTitle => 'Delete all assessment data?';

  @override
  String get deleteConfirmBody =>
      'This permanently removes every assessment, answer, result and practice-plan record on this device. Your Premium purchase is not affected. Results you have already shared cannot be recalled.';

  @override
  String get deleteDone => 'All assessment data has been deleted.';

  @override
  String get aboutTitle => 'About EQ Test';

  @override
  String get aboutBody =>
      'EQ Test is a self-reflection app. It helps you notice emotional habits and try small practical steps. It does not diagnose, rank or certify anyone.';

  @override
  String contentVersion(String version) {
    return 'Content version $version';
  }

  @override
  String get shareCaveat =>
      'Self-reflection result. Not a diagnosis or a validated EQ measure.';

  @override
  String get sharePreviewTitle => 'Share preview';

  @override
  String get shareAction => 'Share image';

  @override
  String get shareFailed => 'Could not create the image. Please try again.';

  @override
  String get genericError => 'Something went wrong. Please try again.';

  @override
  String get missingContentError =>
      'Some assessment content could not be loaded, so this assessment can\'t start. Please reinstall or update the app.';

  @override
  String get exitAction => 'Exit';
}
