# Deploy ke GitHub Pages (folder `/docs`)

1. Pastikan semua file web ada di `/docs`.
2. Push project ke GitHub repository.
3. Buka repository: `Settings` -> `Pages`.
4. Di `Build and deployment`:
   - `Source`: `Deploy from a branch`
   - `Branch`: `main` (atau branch yang dipakai)
   - `Folder`: `/docs`
5. Klik `Save`, tunggu build selesai.
6. Cek URL default, contoh: `https://username.github.io/repository-name/`.
7. Untuk domain custom (`route2de.com`), isi `Custom domain` di halaman Pages.
8. Aktifkan `Enforce HTTPS` setelah DNS valid.
