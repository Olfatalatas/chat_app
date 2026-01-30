# chat_app

[![Flutter](https://img.shields.io/badge/Flutter-Available-brightgreen)]()
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)]()

Deskripsi singkat: aplikasi chat sederhana berbasis Flutter + Firebase (Cloud Firestore). Tujuan: demo fitur chat realtime, manajemen user, dan struktur aplikasi Flutter yang bersih.

---

## Daftar isi 📚
1. **Overview**
2. **Fitur**
3. **Prasyarat**
4. **Instalasi & Menjalankan**
5. **Setup Firebase**
6. **Struktur Proyek**
7. **Testing & CI**
8. **Kontribusi**
9. **Lisensi**

---

## 1. Overview 💡
Aplikasi ini menampilkan fitur chat realtime dengan Firestore. Cocok sebagai contoh implementasi arsitektur sederhana pada Flutter.

## 2. Fitur ✅
- Chat realtime menggunakan **Cloud Firestore**
- Tampilan daftar chat & halaman chat individual
- Menyimpan user dan pesan (model terpisah di `lib/model/`)
- Struktur komponen UI modular di `lib/widget/`

## 3. Prasyarat 🔧
- **Flutter SDK** (stable) terpasang — cek dengan:
```bash
flutter --version
```
- **Android SDK** (untuk Android) atau **Xcode** (untuk iOS build)
- (Opsional) Akun Firebase untuk konfigurasi backend

## 4. Instalasi & Menjalankan ▶️
1. Clone repo:
```bash
git clone <repo-url>
cd chat_app
```
2. Install dependensi:
```bash
flutter pub get
```
3. Jalankan app:
- Android:
```bash
flutter run -d android
```
- iOS (macOS):
```bash
flutter run -d ios
```
4. Build release:
```bash
flutter build apk   # Android
flutter build ios   # iOS (macOS)
```

> Tip: jalankan `flutter doctor` jika ada masalah environment.

## 5. Setup Firebase 🔐
Proyek menggunakan `firebase_core` & `cloud_firestore`. Langkah singkat:
1. Buat project di [Firebase Console](https://console.firebase.google.com/).
2. Tambahkan aplikasi Android:
   - Isi package name sesuai `android/app/src/.../AndroidManifest.xml`.
   - Download `google-services.json` dan letakkan di `android/app/`.
3. Tambahkan aplikasi iOS (jika diperlukan):
   - Download `GoogleService-Info.plist` dan letakkan di `ios/Runner/`.
4. Konfigurasi Gradle:
   - Pastikan `com.google.gms:google-services` ada di file build gradle sesuai dokumentasi Firebase.
5. Atur aturan Firestore (rules) untuk keamanan:
   - Jangan gunakan rules publik di production, mulai dengan rules terbatas dan aturan autentikasi.
6. Jika menggunakan autentikasi tambahan (Google Sign-In, phone), daftar SHA-1 untuk Android.

> Catatan keamanan: jangan commit file berisi credential/secret selain `google-services.json` / `GoogleService-Info.plist` yang biasanya tidak berisi secret sensitif. Hindari memasukkan service account keys ke repo publik.

## 6. Struktur Proyek 🔍
- `lib/`
  - `main.dart` — entry point
  - `api/` — integrasi Firebase (`firebase_api.dart`)
  - `model/` — `user.dart`, `message.dart`
  - `page/` — halaman UI (`chat_page.dart`, `chats_page.dart`)
  - `widget/` — komponen UI (header, message list, input)
- `android/`, `ios/` — platform-specific config
- `test/` — test unit/widget

## 7. Testing & CI 🧪
- Jalankan test:
```bash
flutter test
```
- Contoh GitHub Actions (simple) untuk menjalankan test:
```yaml
name: Flutter CI
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
        with:
          flutter-version: 'stable'
      - run: flutter pub get
      - run: flutter test --no-platform-plugins
```

## 8. Kontribusi 🤝
- Fork repo → buat branch feature → buat PR
- Tambahkan issue untuk bug/fitur
- Ikuti gaya kode project dan sertakan test bila perlu

## 9. Lisensi 📄
Project dapat dilisensikan dengan **MIT** (atau lisensi lain sesuai keinginan). Contoh header lisensi MIT dapat ditambahkan ke file `LICENSE`.

