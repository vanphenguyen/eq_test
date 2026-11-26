# EQ Test: ghi chú cho Claude

App Flutter (iOS) tự suy ngẫm về thói quen cảm xúc. Không tài khoản, không backend, dữ liệu chỉ nằm trên máy.
Tài liệu nguồn nằm trong `docs/` (PRD, SRS, SCORING_SPEC, UI_UX_SPEC, QUESTION_BANK); nội dung đã đổi nằm trong
`docs/CONTENT_CHANGES.md`. Khi hai tài liệu mâu thuẫn, làm theo thứ tự ưu tiên ở `docs/README.md`.

## Cấu trúc
- `lib/domain/`: thuần Dart, không import Flutter. `scoring.dart` là công thức điểm (SCORING_SPEC).
- `assets/content/question_bank.json`, `result_content.json`: nội dung và câu hỏi. Đổi câu hỏi thì sửa JSON.
- `lib/data/`: Drift (`db/`), repository, `PremiumService` (StoreKit qua `in_app_purchase`).
- `lib/features/`: màn hình. `lib/app/`: router, provider, theme, liên kết (`links.dart`).
- `lib/l10n/*.arb`: chữ giao diện. Không viết chữ hiển thị thẳng trong widget.
- `site/`: trang chính sách và điều khoản, đăng qua workflow `Pages`.
- `codemagic.yaml`: workflow build iOS. `docs/APP_STORE.md`: các bước đăng App Store.

## Lệnh
- Trước khi commit: `flutter analyze && flutter test`. Cả hai phải sạch.
- Sau khi sửa model Drift: `dart run build_runner build --delete-conflicting-outputs`.
- Sau khi sửa `.arb`: `flutter gen-l10n` (chạy tự động khi `flutter pub get`).
- Phiên cloud: `CLAUDE_CODE_REMOTE=true bash scripts/claude_session_start.sh` cài Flutter 3.47.8 vào `~/flutter`.

## Quy ước
- Flutter được ghim `3.47.8` (giống Codemagic và `build.yml`). Không nâng phiên bản nếu chưa thử cả hai nơi.
- Mã app `com.phenv.eqtest` (iOS). Không đổi sau khi đã đăng ký trên Apple.
- Sản phẩm mua trong app: `eqtest_premium_lifetime` (non-consumable). Không đổi mã này.
- Premium chỉ mở khóa sau khi StoreKit báo giao dịch thành công hoặc được khôi phục. Không mở khóa theo lần chạm nút.
- Đổi câu hỏi, khóa đáp án, công thức hay ngưỡng: tăng `contentVersion`/`scoringVersion`, thêm test hồi quy,
  và ghi vào `docs/CONTENT_CHANGES.md`. Không tính lại kết quả cũ.
- Không tự thêm SDK phân tích, quảng cáo hay dịch vụ mạng nếu chưa có quyết định và cập nhật trang chính sách.
- Số build iOS lấy từ giờ UTC lúc build (`codemagic.yaml`). Khi ra bản mới: tăng `version` trong `pubspec.yaml`
  và ghi `CHANGELOG.md`.
- Làm trên nhánh riêng. Không mở Pull Request nếu chủ dự án chưa yêu cầu.
