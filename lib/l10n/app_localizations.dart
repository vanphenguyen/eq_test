import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi'),
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'EQ Test'**
  String get appName;

  /// No description provided for @tabHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tabHome;

  /// No description provided for @tabTests.
  ///
  /// In en, this message translates to:
  /// **'Tests'**
  String get tabTests;

  /// No description provided for @tabHistory.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get tabHistory;

  /// No description provided for @tabSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get tabSettings;

  /// No description provided for @continueAction.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueAction;

  /// No description provided for @skipAction.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skipAction;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get getStarted;

  /// No description provided for @backAction.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backAction;

  /// No description provided for @closeAction.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeAction;

  /// No description provided for @cancelAction.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancelAction;

  /// No description provided for @confirmAction.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirmAction;

  /// No description provided for @onboardingTitle1.
  ///
  /// In en, this message translates to:
  /// **'Understand your emotional habits.'**
  String get onboardingTitle1;

  /// No description provided for @onboardingTitle2.
  ///
  /// In en, this message translates to:
  /// **'Explore four areas of emotional awareness and interaction.'**
  String get onboardingTitle2;

  /// No description provided for @onboardingTitle3.
  ///
  /// In en, this message translates to:
  /// **'Your responses stay on this device.'**
  String get onboardingTitle3;

  /// No description provided for @onboardingBody3.
  ///
  /// In en, this message translates to:
  /// **'This is a self-reflection tool, not a diagnosis or a validated EQ measurement.'**
  String get onboardingBody3;

  /// No description provided for @chooseLanguageTitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get chooseLanguageTitle;

  /// No description provided for @chooseLanguageBody.
  ///
  /// In en, this message translates to:
  /// **'You can change this later in Settings.'**
  String get chooseLanguageBody;

  /// No description provided for @languageEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get languageEnglish;

  /// No description provided for @languageVietnamese.
  ///
  /// In en, this message translates to:
  /// **'Tiếng Việt'**
  String get languageVietnamese;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Take a moment for yourself today.'**
  String get homeGreeting;

  /// No description provided for @quickTestTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick Test'**
  String get quickTestTitle;

  /// No description provided for @quickTestMeta.
  ///
  /// In en, this message translates to:
  /// **'About 3–5 minutes · Free'**
  String get quickTestMeta;

  /// No description provided for @fullAssessmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Full Assessment'**
  String get fullAssessmentTitle;

  /// No description provided for @fullAssessmentMeta.
  ///
  /// In en, this message translates to:
  /// **'About 10–15 minutes · Premium'**
  String get fullAssessmentMeta;

  /// No description provided for @premiumLockLabel.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumLockLabel;

  /// No description provided for @latestResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Your latest result'**
  String get latestResultTitle;

  /// No description provided for @viewResult.
  ///
  /// In en, this message translates to:
  /// **'View result'**
  String get viewResult;

  /// No description provided for @noResultYet.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t completed an assessment yet.'**
  String get noResultYet;

  /// No description provided for @insightTitle.
  ///
  /// In en, this message translates to:
  /// **'A small insight'**
  String get insightTitle;

  /// No description provided for @insightBody.
  ///
  /// In en, this message translates to:
  /// **'Putting a name to a feeling can make it easier to decide how to respond.'**
  String get insightBody;

  /// No description provided for @testsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tests'**
  String get testsTitle;

  /// No description provided for @freeTag.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get freeTag;

  /// No description provided for @premiumTag.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumTag;

  /// No description provided for @unlockWithPremium.
  ///
  /// In en, this message translates to:
  /// **'Unlock with Premium'**
  String get unlockWithPremium;

  /// No description provided for @introDuration.
  ///
  /// In en, this message translates to:
  /// **'About {minutes} minutes'**
  String introDuration(String minutes);

  /// No description provided for @introItems.
  ///
  /// In en, this message translates to:
  /// **'{count} items'**
  String introItems(int count);

  /// No description provided for @introInstructions.
  ///
  /// In en, this message translates to:
  /// **'For each statement, choose the answer that fits you best. There are no right or wrong answers.'**
  String get introInstructions;

  /// No description provided for @introSituationalNote.
  ///
  /// In en, this message translates to:
  /// **'Some items describe a situation. Pick the response you would most likely choose.'**
  String get introSituationalNote;

  /// No description provided for @introPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Your answers are saved only on this device.'**
  String get introPrivacy;

  /// No description provided for @introLimitation.
  ///
  /// In en, this message translates to:
  /// **'This is a reflection tool. It is not a diagnosis or a validated EQ measurement.'**
  String get introLimitation;

  /// No description provided for @startAction.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get startAction;

  /// No description provided for @resumeAction.
  ///
  /// In en, this message translates to:
  /// **'Resume'**
  String get resumeAction;

  /// No description provided for @questionProgress.
  ///
  /// In en, this message translates to:
  /// **'{current} of {total}'**
  String questionProgress(int current, int total);

  /// No description provided for @nextAction.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get nextAction;

  /// No description provided for @previousAction.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previousAction;

  /// No description provided for @seeMyResults.
  ///
  /// In en, this message translates to:
  /// **'See my results'**
  String get seeMyResults;

  /// No description provided for @exitTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave this assessment?'**
  String get exitTitle;

  /// No description provided for @exitBody.
  ///
  /// In en, this message translates to:
  /// **'Your progress is saved. You can pick up where you left off.'**
  String get exitBody;

  /// No description provided for @continueAssessment.
  ///
  /// In en, this message translates to:
  /// **'Keep going'**
  String get continueAssessment;

  /// No description provided for @saveAndExit.
  ///
  /// In en, this message translates to:
  /// **'Save and exit'**
  String get saveAndExit;

  /// No description provided for @abandonAssessment.
  ///
  /// In en, this message translates to:
  /// **'Abandon assessment'**
  String get abandonAssessment;

  /// No description provided for @abandonTitle.
  ///
  /// In en, this message translates to:
  /// **'Abandon this assessment?'**
  String get abandonTitle;

  /// No description provided for @abandonBody.
  ///
  /// In en, this message translates to:
  /// **'Your answers for this session will be deleted. This cannot be undone.'**
  String get abandonBody;

  /// No description provided for @completionTitle.
  ///
  /// In en, this message translates to:
  /// **'All done'**
  String get completionTitle;

  /// No description provided for @completionBody.
  ///
  /// In en, this message translates to:
  /// **'Thank you for taking the time to reflect.'**
  String get completionBody;

  /// No description provided for @viewMyResult.
  ///
  /// In en, this message translates to:
  /// **'View my result'**
  String get viewMyResult;

  /// No description provided for @resultTitle.
  ///
  /// In en, this message translates to:
  /// **'Your EQ Reflection Index'**
  String get resultTitle;

  /// No description provided for @resultCaveat.
  ///
  /// In en, this message translates to:
  /// **'This is a self-reflection index. It is not a validated or diagnostic measure of emotional intelligence.'**
  String get resultCaveat;

  /// No description provided for @exploreDimensions.
  ///
  /// In en, this message translates to:
  /// **'Explore dimensions'**
  String get exploreDimensions;

  /// No description provided for @shareResult.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get shareResult;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get backToHome;

  /// No description provided for @fullResultTitle.
  ///
  /// In en, this message translates to:
  /// **'Full result'**
  String get fullResultTitle;

  /// No description provided for @strengthsTitle.
  ///
  /// In en, this message translates to:
  /// **'Strengths'**
  String get strengthsTitle;

  /// No description provided for @growthTitle.
  ///
  /// In en, this message translates to:
  /// **'Growth opportunities'**
  String get growthTitle;

  /// No description provided for @dimensionDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Dimension detail'**
  String get dimensionDetailTitle;

  /// No description provided for @selfReportSubscore.
  ///
  /// In en, this message translates to:
  /// **'Self-report'**
  String get selfReportSubscore;

  /// No description provided for @situationalSubscore.
  ///
  /// In en, this message translates to:
  /// **'Scenarios'**
  String get situationalSubscore;

  /// No description provided for @practicalSuggestion.
  ///
  /// In en, this message translates to:
  /// **'A practical idea'**
  String get practicalSuggestion;

  /// No description provided for @sevenDayPlanAction.
  ///
  /// In en, this message translates to:
  /// **'7-day practice plan'**
  String get sevenDayPlanAction;

  /// No description provided for @planTitle.
  ///
  /// In en, this message translates to:
  /// **'7-day practice plan'**
  String get planTitle;

  /// No description provided for @planIntro.
  ///
  /// In en, this message translates to:
  /// **'Seven short, optional activities of about 5–10 minutes each. They are prompts to try, not treatment, and they do not guarantee any change.'**
  String get planIntro;

  /// No description provided for @markDone.
  ///
  /// In en, this message translates to:
  /// **'Mark as done'**
  String get markDone;

  /// No description provided for @markUndone.
  ///
  /// In en, this message translates to:
  /// **'Mark as not done'**
  String get markUndone;

  /// No description provided for @daysDone.
  ///
  /// In en, this message translates to:
  /// **'{done} of 7 done'**
  String daysDone(int done);

  /// No description provided for @bandDeveloping.
  ///
  /// In en, this message translates to:
  /// **'Developing'**
  String get bandDeveloping;

  /// No description provided for @bandEmerging.
  ///
  /// In en, this message translates to:
  /// **'Emerging'**
  String get bandEmerging;

  /// No description provided for @bandGrowing.
  ///
  /// In en, this message translates to:
  /// **'Growing'**
  String get bandGrowing;

  /// No description provided for @bandStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get bandStrong;

  /// No description provided for @dimSelfAwareness.
  ///
  /// In en, this message translates to:
  /// **'Self-Awareness'**
  String get dimSelfAwareness;

  /// No description provided for @dimSelfRegulation.
  ///
  /// In en, this message translates to:
  /// **'Self-Regulation'**
  String get dimSelfRegulation;

  /// No description provided for @dimSocialAwareness.
  ///
  /// In en, this message translates to:
  /// **'Social Awareness'**
  String get dimSocialAwareness;

  /// No description provided for @dimRelationshipManagement.
  ///
  /// In en, this message translates to:
  /// **'Relationship Management'**
  String get dimRelationshipManagement;

  /// No description provided for @historyTitle.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get historyTitle;

  /// No description provided for @historyEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No results yet'**
  String get historyEmptyTitle;

  /// No description provided for @historyEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Your completed assessments will appear here.'**
  String get historyEmptyBody;

  /// No description provided for @startQuickTest.
  ///
  /// In en, this message translates to:
  /// **'Start a Quick Test'**
  String get startQuickTest;

  /// No description provided for @quickLabel.
  ///
  /// In en, this message translates to:
  /// **'Quick Test'**
  String get quickLabel;

  /// No description provided for @fullLabel.
  ///
  /// In en, this message translates to:
  /// **'Full Assessment'**
  String get fullLabel;

  /// No description provided for @paywallHeadline.
  ///
  /// In en, this message translates to:
  /// **'Go deeper with Premium'**
  String get paywallHeadline;

  /// No description provided for @paywallBenefit1.
  ///
  /// In en, this message translates to:
  /// **'Full Assessment with 40 items'**
  String get paywallBenefit1;

  /// No description provided for @paywallBenefit2.
  ///
  /// In en, this message translates to:
  /// **'Detailed dimension reflections and strengths'**
  String get paywallBenefit2;

  /// No description provided for @paywallBenefit3.
  ///
  /// In en, this message translates to:
  /// **'A 7-day practice plan'**
  String get paywallBenefit3;

  /// No description provided for @paywallBenefit4.
  ///
  /// In en, this message translates to:
  /// **'An ad-free experience'**
  String get paywallBenefit4;

  /// No description provided for @paywallPayOnce.
  ///
  /// In en, this message translates to:
  /// **'Pay once. Keep access.'**
  String get paywallPayOnce;

  /// No description provided for @paywallLifetimeNote.
  ///
  /// In en, this message translates to:
  /// **'Premium is a one-time purchase that stays with your Apple account.'**
  String get paywallLifetimeNote;

  /// No description provided for @buyPremium.
  ///
  /// In en, this message translates to:
  /// **'Unlock Premium'**
  String get buyPremium;

  /// No description provided for @restorePurchases.
  ///
  /// In en, this message translates to:
  /// **'Restore purchases'**
  String get restorePurchases;

  /// No description provided for @termsLink.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get termsLink;

  /// No description provided for @privacyLink.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get privacyLink;

  /// No description provided for @purchasePending.
  ///
  /// In en, this message translates to:
  /// **'Your purchase is pending approval. Premium will unlock once it\'s confirmed.'**
  String get purchasePending;

  /// No description provided for @purchaseCancelled.
  ///
  /// In en, this message translates to:
  /// **'Purchase cancelled. Nothing was charged.'**
  String get purchaseCancelled;

  /// No description provided for @purchaseFailed.
  ///
  /// In en, this message translates to:
  /// **'The purchase did not complete. Please try again.'**
  String get purchaseFailed;

  /// No description provided for @productUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Premium isn\'t available right now. Please try again later.'**
  String get productUnavailable;

  /// No description provided for @storeUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The App Store can\'t be reached right now. Your free features still work.'**
  String get storeUnavailable;

  /// No description provided for @restoreFound.
  ///
  /// In en, this message translates to:
  /// **'Your Premium access has been restored.'**
  String get restoreFound;

  /// No description provided for @restoreNothing.
  ///
  /// In en, this message translates to:
  /// **'No previous purchases were found on this Apple account.'**
  String get restoreNothing;

  /// No description provided for @premiumActive.
  ///
  /// In en, this message translates to:
  /// **'Premium is active'**
  String get premiumActive;

  /// No description provided for @premiumInactive.
  ///
  /// In en, this message translates to:
  /// **'Premium is not active'**
  String get premiumInactive;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsPremium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get settingsPremium;

  /// No description provided for @settingsPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy & data'**
  String get settingsPrivacy;

  /// No description provided for @settingsTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of use'**
  String get settingsTerms;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settingsAbout;

  /// No description provided for @settingsSupport.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get settingsSupport;

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy & data'**
  String get privacyTitle;

  /// No description provided for @privacyBody.
  ///
  /// In en, this message translates to:
  /// **'Your answers, results and history are stored only on this device. The app does not create an account and does not send your answers to anyone. Ads never appear during assessments, on result screens or on the paywall.'**
  String get privacyBody;

  /// No description provided for @deleteAllData.
  ///
  /// In en, this message translates to:
  /// **'Delete all assessment data'**
  String get deleteAllData;

  /// No description provided for @deleteConfirmTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete all assessment data?'**
  String get deleteConfirmTitle;

  /// No description provided for @deleteConfirmBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently removes every assessment, answer, result and practice-plan record on this device. Your Premium purchase is not affected. Results you have already shared cannot be recalled.'**
  String get deleteConfirmBody;

  /// No description provided for @deleteDone.
  ///
  /// In en, this message translates to:
  /// **'All assessment data has been deleted.'**
  String get deleteDone;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About EQ Test'**
  String get aboutTitle;

  /// No description provided for @aboutBody.
  ///
  /// In en, this message translates to:
  /// **'EQ Test is a self-reflection app. It helps you notice emotional habits and try small practical steps. It does not diagnose, rank or certify anyone.'**
  String get aboutBody;

  /// No description provided for @contentVersion.
  ///
  /// In en, this message translates to:
  /// **'Content version {version}'**
  String contentVersion(String version);

  /// No description provided for @shareCaveat.
  ///
  /// In en, this message translates to:
  /// **'Self-reflection result. Not a diagnosis or a validated EQ measure.'**
  String get shareCaveat;

  /// No description provided for @sharePreviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Share preview'**
  String get sharePreviewTitle;

  /// No description provided for @shareAction.
  ///
  /// In en, this message translates to:
  /// **'Share image'**
  String get shareAction;

  /// No description provided for @shareFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not create the image. Please try again.'**
  String get shareFailed;

  /// No description provided for @genericError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get genericError;

  /// No description provided for @missingContentError.
  ///
  /// In en, this message translates to:
  /// **'Some assessment content could not be loaded, so this assessment can\'t start. Please reinstall or update the app.'**
  String get missingContentError;

  /// No description provided for @exitAction.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exitAction;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
