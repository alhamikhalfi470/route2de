# App Store Submission Checklist (Route2DE)

## A. Website & Legal URL
- Developer Website URL aktif: `https://route2de.com/`
- Privacy Policy URL aktif: `https://route2de.com/privacy.html`
- Terms of Use URL aktif: `https://route2de.com/terms.html`
- Support URL aktif: `https://route2de.com/support.html`

## B. App Privacy (App Store Connect)
- Data account dan assessment dicatat sesuai implementasi aktual.
- Tracking/cross-app tracking diisi sesuai kondisi nyata aplikasi.
- Third-party SDK (Firebase Auth/Firestore/Analytics/Crashlytics) dicatat akurat.

## C. In-App Legal Consistency
- Halaman legal di app sinkron dengan website (`Privacy`, `Terms`, `Disclaimer`).
- Last updated date konsisten di web dan app.
- Support email aktif: `support@route2de.com`.

## D. Security & Compliance
- API keys direstrict sesuai best practice.
- Token/PAT yang sempat bocor sudah direvoke.
- Repo public hanya berisi konten website/legal.
- Source code app tetap di repo private.

## E. Release Readiness
- Build release tanpa error.
- Test login, assessment, save result, delete account.
- Link legal dari app dan App Store metadata semua valid (HTTP 200).
