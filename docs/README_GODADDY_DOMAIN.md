# Koneksi Domain GoDaddy -> GitHub Pages (singkat)

1. Di GitHub Pages, set `Custom domain`: `route2de.com`.
2. Di DNS GoDaddy, buat record berikut:
   - `A` untuk host `@` ke:
     - `185.199.108.153`
     - `185.199.109.153`
     - `185.199.110.153`
     - `185.199.111.153`
   - `CNAME` host `www` ke: `username.github.io`
3. Simpan DNS, tunggu propagasi (umumnya menit-jam, bisa sampai 24 jam).
4. Kembali ke GitHub Pages dan aktifkan `Enforce HTTPS`.

Catatan:
- Ganti `username.github.io` dengan username GitHub kamu.
- Jika mau satu versi domain saja, atur forwarding `www` atau root di GoDaddy.
