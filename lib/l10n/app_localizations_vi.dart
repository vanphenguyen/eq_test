// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appName => 'EQ Test';

  @override
  String get tabHome => 'Trang chủ';

  @override
  String get tabTests => 'Bài test';

  @override
  String get tabHistory => 'Lịch sử';

  @override
  String get tabSettings => 'Cài đặt';

  @override
  String get continueAction => 'Tiếp tục';

  @override
  String get skipAction => 'Bỏ qua';

  @override
  String get getStarted => 'Bắt đầu';

  @override
  String get backAction => 'Quay lại';

  @override
  String get closeAction => 'Đóng';

  @override
  String get cancelAction => 'Hủy';

  @override
  String get confirmAction => 'Xác nhận';

  @override
  String get onboardingTitle1 => 'Hiểu hơn về thói quen cảm xúc của bạn.';

  @override
  String get onboardingTitle2 =>
      'Khám phá bốn khía cạnh của nhận thức và tương tác cảm xúc.';

  @override
  String get onboardingTitle3 =>
      'Câu trả lời của bạn chỉ được lưu trên thiết bị này.';

  @override
  String get onboardingBody3 =>
      'Đây là công cụ tự suy ngẫm, không phải chẩn đoán hay bài đo EQ đã được kiểm định.';

  @override
  String get chooseLanguageTitle => 'Chọn ngôn ngữ';

  @override
  String get chooseLanguageBody => 'Bạn có thể đổi lại trong Cài đặt.';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageVietnamese => 'Tiếng Việt';

  @override
  String get homeGreeting =>
      'Hôm nay hãy dành một chút thời gian cho chính mình.';

  @override
  String get quickTestTitle => 'Bài test nhanh';

  @override
  String get quickTestMeta => 'Khoảng 3–5 phút · Miễn phí';

  @override
  String get fullAssessmentTitle => 'Bài đánh giá đầy đủ';

  @override
  String get fullAssessmentMeta => 'Khoảng 10–15 phút · Premium';

  @override
  String get premiumLockLabel => 'Premium';

  @override
  String get latestResultTitle => 'Kết quả gần nhất';

  @override
  String get viewResult => 'Xem kết quả';

  @override
  String get noResultYet => 'Bạn chưa hoàn thành bài đánh giá nào.';

  @override
  String get insightTitle => 'Một gợi ý nhỏ';

  @override
  String get insightBody =>
      'Gọi tên được cảm xúc đôi khi giúp bạn dễ quyết định cách phản ứng hơn.';

  @override
  String get testsTitle => 'Bài test';

  @override
  String get freeTag => 'Miễn phí';

  @override
  String get premiumTag => 'Premium';

  @override
  String get unlockWithPremium => 'Mở khóa với Premium';

  @override
  String introDuration(String minutes) {
    return 'Khoảng $minutes phút';
  }

  @override
  String introItems(int count) {
    return '$count câu';
  }

  @override
  String get introInstructions =>
      'Với mỗi câu, hãy chọn đáp án phù hợp nhất với bạn. Không có đáp án đúng hay sai.';

  @override
  String get introSituationalNote =>
      'Một số câu mô tả một tình huống. Hãy chọn cách phản ứng mà bạn có khả năng làm nhất.';

  @override
  String get introPrivacy =>
      'Câu trả lời của bạn chỉ được lưu trên thiết bị này.';

  @override
  String get introLimitation =>
      'Đây là công cụ suy ngẫm. Nó không phải là chẩn đoán hay bài đo EQ đã được kiểm định.';

  @override
  String get startAction => 'Bắt đầu';

  @override
  String get resumeAction => 'Làm tiếp';

  @override
  String questionProgress(int current, int total) {
    return 'Câu $current / $total';
  }

  @override
  String get nextAction => 'Tiếp theo';

  @override
  String get previousAction => 'Quay lại câu trước';

  @override
  String get seeMyResults => 'Xem kết quả';

  @override
  String get exitTitle => 'Thoát bài đánh giá?';

  @override
  String get exitBody =>
      'Tiến độ của bạn đã được lưu. Bạn có thể làm tiếp sau.';

  @override
  String get continueAssessment => 'Làm tiếp';

  @override
  String get saveAndExit => 'Lưu và thoát';

  @override
  String get abandonAssessment => 'Bỏ bài đánh giá';

  @override
  String get abandonTitle => 'Bỏ bài đánh giá này?';

  @override
  String get abandonBody =>
      'Câu trả lời trong lần làm này sẽ bị xóa. Hành động này không thể hoàn tác.';

  @override
  String get completionTitle => 'Hoàn thành rồi';

  @override
  String get completionBody => 'Cảm ơn bạn đã dành thời gian để suy ngẫm.';

  @override
  String get viewMyResult => 'Xem kết quả của tôi';

  @override
  String get resultTitle => 'Chỉ số Suy ngẫm EQ của bạn';

  @override
  String get resultCaveat =>
      'Đây là chỉ số tự suy ngẫm. Nó không phải là thước đo đã được kiểm định hay dùng để chẩn đoán trí tuệ cảm xúc.';

  @override
  String get exploreDimensions => 'Xem chi tiết từng khía cạnh';

  @override
  String get shareResult => 'Chia sẻ';

  @override
  String get backToHome => 'Về trang chủ';

  @override
  String get fullResultTitle => 'Kết quả đầy đủ';

  @override
  String get strengthsTitle => 'Điểm mạnh';

  @override
  String get growthTitle => 'Cơ hội phát triển';

  @override
  String get dimensionDetailTitle => 'Chi tiết khía cạnh';

  @override
  String get selfReportSubscore => 'Tự đánh giá';

  @override
  String get situationalSubscore => 'Tình huống';

  @override
  String get practicalSuggestion => 'Gợi ý thực hành';

  @override
  String get sevenDayPlanAction => 'Kế hoạch thực hành 7 ngày';

  @override
  String get planTitle => 'Kế hoạch thực hành 7 ngày';

  @override
  String get planIntro =>
      'Bảy hoạt động ngắn, không bắt buộc, mỗi hoạt động khoảng 5–10 phút. Đây là gợi ý để thử, không phải liệu pháp, và không đảm bảo thay đổi nào.';

  @override
  String get markDone => 'Đánh dấu đã làm';

  @override
  String get markUndone => 'Bỏ đánh dấu';

  @override
  String daysDone(int done) {
    return 'Đã làm $done / 7 ngày';
  }

  @override
  String get bandDeveloping => 'Đang phát triển';

  @override
  String get bandEmerging => 'Đang hình thành';

  @override
  String get bandGrowing => 'Đang tăng trưởng';

  @override
  String get bandStrong => 'Vững vàng';

  @override
  String get dimSelfAwareness => 'Nhận thức bản thân';

  @override
  String get dimSelfRegulation => 'Tự điều chỉnh';

  @override
  String get dimSocialAwareness => 'Nhận thức xã hội';

  @override
  String get dimRelationshipManagement => 'Quản lý quan hệ';

  @override
  String get historyTitle => 'Lịch sử';

  @override
  String get historyEmptyTitle => 'Chưa có kết quả';

  @override
  String get historyEmptyBody =>
      'Các bài đánh giá bạn hoàn thành sẽ hiện ở đây.';

  @override
  String get startQuickTest => 'Làm bài test nhanh';

  @override
  String get quickLabel => 'Bài test nhanh';

  @override
  String get fullLabel => 'Bài đánh giá đầy đủ';

  @override
  String get paywallHeadline => 'Đi sâu hơn cùng Premium';

  @override
  String get paywallBenefit1 => 'Bài đánh giá đầy đủ với 40 câu';

  @override
  String get paywallBenefit2 =>
      'Phân tích chi tiết từng khía cạnh và điểm mạnh';

  @override
  String get paywallBenefit3 => 'Kế hoạch thực hành 7 ngày';

  @override
  String get paywallBenefit4 => 'Trải nghiệm không có quảng cáo';

  @override
  String get paywallPayOnce => 'Trả một lần. Dùng mãi mãi.';

  @override
  String get paywallLifetimeNote =>
      'Premium là giao dịch mua một lần, gắn với tài khoản Apple của bạn.';

  @override
  String get buyPremium => 'Mở khóa Premium';

  @override
  String get restorePurchases => 'Khôi phục giao dịch';

  @override
  String get termsLink => 'Điều khoản sử dụng';

  @override
  String get privacyLink => 'Chính sách quyền riêng tư';

  @override
  String get purchasePending =>
      'Giao dịch đang chờ xác nhận. Premium sẽ được mở khi giao dịch được xác nhận.';

  @override
  String get purchaseCancelled =>
      'Bạn đã hủy giao dịch. Không có khoản nào bị thu.';

  @override
  String get purchaseFailed => 'Giao dịch chưa hoàn tất. Vui lòng thử lại.';

  @override
  String get productUnavailable =>
      'Premium chưa khả dụng lúc này. Vui lòng thử lại sau.';

  @override
  String get storeUnavailable =>
      'Không kết nối được App Store lúc này. Các tính năng miễn phí vẫn hoạt động.';

  @override
  String get restoreFound =>
      'Quyền truy cập Premium của bạn đã được khôi phục.';

  @override
  String get restoreNothing =>
      'Không tìm thấy giao dịch nào trước đó trên tài khoản Apple này.';

  @override
  String get premiumActive => 'Premium đang hoạt động';

  @override
  String get premiumInactive => 'Chưa kích hoạt Premium';

  @override
  String get settingsTitle => 'Cài đặt';

  @override
  String get settingsLanguage => 'Ngôn ngữ';

  @override
  String get settingsPremium => 'Premium';

  @override
  String get settingsPrivacy => 'Quyền riêng tư và dữ liệu';

  @override
  String get settingsTerms => 'Điều khoản sử dụng';

  @override
  String get settingsAbout => 'Giới thiệu';

  @override
  String get settingsSupport => 'Liên hệ hỗ trợ';

  @override
  String get privacyTitle => 'Quyền riêng tư và dữ liệu';

  @override
  String get privacyBody =>
      'Câu trả lời, kết quả và lịch sử của bạn chỉ được lưu trên thiết bị này. Ứng dụng không tạo tài khoản và không gửi câu trả lời của bạn cho ai. Quảng cáo không bao giờ xuất hiện trong lúc làm bài, ở màn hình kết quả hoặc màn hình mua Premium.';

  @override
  String get deleteAllData => 'Xóa toàn bộ dữ liệu đánh giá';

  @override
  String get deleteConfirmTitle => 'Xóa toàn bộ dữ liệu đánh giá?';

  @override
  String get deleteConfirmBody =>
      'Thao tác này xóa vĩnh viễn mọi bài đánh giá, câu trả lời, kết quả và kế hoạch thực hành trên thiết bị này. Giao dịch Premium của bạn không bị ảnh hưởng. Kết quả bạn đã chia sẻ thì không thể thu lại.';

  @override
  String get deleteDone => 'Đã xóa toàn bộ dữ liệu đánh giá.';

  @override
  String get aboutTitle => 'Giới thiệu EQ Test';

  @override
  String get aboutBody =>
      'EQ Test là ứng dụng tự suy ngẫm. Ứng dụng giúp bạn nhận ra thói quen cảm xúc và thử những bước nhỏ, thiết thực. Ứng dụng không chẩn đoán, xếp hạng hay chứng nhận bất kỳ ai.';

  @override
  String contentVersion(String version) {
    return 'Phiên bản nội dung $version';
  }

  @override
  String get shareCaveat =>
      'Kết quả tự suy ngẫm. Không phải chẩn đoán hay thước đo EQ đã được kiểm định.';

  @override
  String get sharePreviewTitle => 'Xem trước';

  @override
  String get shareAction => 'Chia sẻ ảnh';

  @override
  String get shareFailed => 'Không thể tạo ảnh. Vui lòng thử lại.';

  @override
  String get genericError => 'Đã xảy ra lỗi. Vui lòng thử lại.';

  @override
  String get missingContentError =>
      'Không tải được nội dung bài đánh giá nên chưa thể bắt đầu. Vui lòng cài lại hoặc cập nhật ứng dụng.';

  @override
  String get exitAction => 'Thoát';
}
