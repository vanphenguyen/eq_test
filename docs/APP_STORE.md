# Đưa EQ Test lên App Store bằng Codemagic

Codemagic thay cho máy Mac: nó build bản iPhone, ký app, và tải lên App Store Connect.
Cấu hình nằm trong `codemagic.yaml`. Mã app: **`com.phenv.eqtest`** (không đổi được sau khi đăng ký).
Các bước dưới đây chỉ làm một lần. Tên nút trên web của Apple và Codemagic có thể đổi chút ít.

## 0. Build thử trước (không cần tài khoản Apple)
Codemagic > app EQ Test > **Start new build** > nhánh `main` > workflow **iOS - Build thử (không cần Apple)**.
Bước này chạy `flutter analyze`, `flutter test` và build thử; kết quả không cài được lên máy.
Nếu có bước bị đỏ, gửi nhật ký của bước đó cho Claude và sửa xong rồi mới làm tiếp.

Workflow **iOS - Bản cho máy ảo iPhone (xem thử)** chạy app trên máy ảo trong trình duyệt của Codemagic.

## Cần có trước
- Tài khoản **Apple Developer Program** (99 USD mỗi năm), đã được Apple duyệt.
- Đã có sẵn mã app `com.phenv.eqtest` trên Apple (bước 1).
- Với Premium (mua một lần trong app): cần hoàn tất **Paid Apps Agreement**, thông tin ngân hàng và thuế trong App Store Connect (Business). Chưa xong thì không tạo được sản phẩm mua hàng và không thử được mua.

## 1. Đăng ký mã app với Apple
developer.apple.com > Account > Certificates, Identifiers & Profiles > **Identifiers** > dấu **+** > App IDs > App.
- Description: `EQ Test`. Bundle ID: chọn **Explicit**, nhập `com.phenv.eqtest`.
- Bật khả năng **In-App Purchase** (chỉ tick ở đây; app dùng StoreKit để mua Premium).
- Không cần Push Notifications hay khả năng nào khác.

## 2. Tạo app trên App Store Connect
appstoreconnect.apple.com > Apps > dấu **+** > New App.
- Platform: iOS. Name: `EQ Test: Emotional Habits`. Primary language: English (U.S.).
- Thêm ngôn ngữ Vietnamese ở góc trên bên phải trang app, tên: `EQ Test: Thói quen cảm xúc`.
- Bundle ID: chọn `com.phenv.eqtest`. SKU: ví dụ `eqtest`.

## 3. Tạo khóa API cho Codemagic
App Store Connect > Users and Access > **Integrations** > App Store Connect API > Team Keys > dấu **+**.
- Name: `codemagic`. Access: **App Manager**.
- Tải file `.p8` về (chỉ tải được một lần), ghi lại **Issuer ID** và **Key ID**.
- **Không gửi file này hay nội dung của nó cho ai, kể cả vào khung chat.**

Trong Codemagic: Teams > (tài khoản của bạn) > **Integrations** > Developer Portal > Manage keys > Add key.
- **Đặt tên đúng là `codemagic`** (`codemagic.yaml` gọi khóa theo tên này), nhập Issuer ID, Key ID, tải file `.p8` lên.

## 4. Chứng chỉ ký app
Codemagic: Teams > (tài khoản của bạn) > **Code signing identities** > tab **iOS certificates** > Generate certificate:
loại **Apple Distribution**, chọn khóa `codemagic`. Cất giữ file chứng chỉ và mật khẩu Codemagic hiện ra.

## 5. Hồ sơ cấp phép (provisioning profile)
developer.apple.com > Profiles > dấu **+** > Distribution > **App Store Connect**.
- Chọn App ID `com.phenv.eqtest`, chọn chứng chỉ ở bước 4, đặt tên (ví dụ `eqtest appstore`), Generate.

Codemagic > Code signing identities > tab **iOS provisioning profiles** > Fetch profiles > chọn hồ sơ đó.

## 6. Tạo sản phẩm Premium
App Store Connect > app EQ Test > **In-App Purchases** (hoặc Monetization) > dấu **+** > **Non-Consumable**.
- Product ID: **`eqtest_premium_lifetime`** (phải khớp đúng với app).
- Reference name: `Premium Lifetime`. Đặt giá ở các bậc có sẵn; App Store tự hiện giá theo từng nước.
- Localization: thêm tên hiển thị và mô tả bằng English và Vietnamese, ví dụ "Premium Lifetime" và "Mở khóa Bài đánh giá đầy đủ, kết quả chi tiết, kế hoạch 7 ngày. Trả một lần, dùng mãi mãi."
- Review Screenshot: chụp màn hình màn hình Paywall (bắt buộc để gửi duyệt).
- Sản phẩm phải được gửi duyệt cùng phiên bản app đầu tiên.

Thử mua: App Store Connect > Users and Access > Sandbox > tạo tài khoản thử. Trên iPhone, đăng xuất Apple ID thật trong App Store rồi
khi app hỏi, đăng nhập tài khoản sandbox để thử mua và Khôi phục giao dịch.

## 7. Chạy build
Codemagic > app EQ Test > **Start new build** > nhánh `main` > workflow **iOS - App Store**.
- Build mất khoảng 10 đến 20 phút. Xong, bản build được tải lên App Store Connect, mục **TestFlight**
  (Apple xử lý thêm 10 đến 30 phút mới hiện).
- Nếu build lỗi: gửi cho Claude phần nhật ký của bước bị đỏ.

## 8. Thử trên iPhone bằng TestFlight
App Store Connect > app > TestFlight > Internal Testing > tạo nhóm, thêm Apple ID của bạn.
Cài app **TestFlight** trên iPhone và cài bản thử. Kiểm tra: làm trọn Bài test nhanh, xem kết quả,
chia sẻ ảnh kết quả, mua và khôi phục Premium bằng tài khoản sandbox, xóa dữ liệu trong Cài đặt.

## 9. Trang legal và thông tin App Store
Hai trang chính sách được đăng qua GitHub Pages (workflow `Pages`). Một lần duy nhất:
GitHub > repo `eq_test` > **Settings > Pages > Source: GitHub Actions**. Sau khi chạy xong:
- Privacy Policy URL: `https://vanphenguyen.github.io/eq_test/privacy.html`
- Terms: `https://vanphenguyen.github.io/eq_test/terms.html`

Nội dung viết sẵn (tên, phụ đề, mô tả, từ khóa, ghi chú cho người duyệt) ở `docs/app-store/listing.md` và
`docs/app-store/<en|vi>/thong-tin.md`. Ảnh chụp màn hình cần chụp từ bản TestFlight hoặc máy ảo, cỡ 1206x2622
(iPhone 6.9"), đặt vào `docs/app-store/<en|vi>/`.

App Store Connect > app > tab **Distribution** (App Store):
- Dán nội dung cho từng ô; chọn **Build** đã tải lên ở bước 7.
- **App Privacy**: chọn **Data Not Collected**.
- **Age Rating**: trả lời "None / No" cho mọi câu; kết quả 4+.
- **Giá**: Free (Premium là mua trong app).

## 10. Gửi duyệt
Bấm **Add for Review** rồi **Submit**. Apple thường duyệt trong 1 đến 3 ngày. Nếu bị từ chối, Apple ghi rõ lý do;
gửi nội dung đó cho Claude để sửa.

## Số thứ tự build
Apple chỉ nhận bản có số build lớn hơn mọi bản đã tải lên. Workflow dùng ngày giờ lúc build (giờ UTC, dạng
`YYMMDDHHMM`) làm số build, nên số này luôn tăng. Nếu build trên máy Mac, dùng cùng cách:

```bash
flutter build ipa --release --build-number=$(date -u +%y%m%d%H%M)
```

## Mỗi lần ra bản mới
Tăng `version` trong `pubspec.yaml` (ví dụ `1.0.1+1`), ghi `CHANGELOG.md`, đẩy lên `main`, chạy lại bước 7,
rồi tạo phiên bản mới trên App Store Connect và gửi duyệt.
Nếu đổi nội dung câu hỏi hay công thức điểm: tăng `contentVersion`/`scoringVersion` và thêm test hồi quy trước khi build.
