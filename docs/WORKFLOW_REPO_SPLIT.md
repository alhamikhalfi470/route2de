# Route2DE Repo Split Workflow

Tujuan:
- `origin` (public): website marketing + legal page saja.
- `app-private` (private): full source Flutter app.

## 1) Sync website ke repo public
Jalankan dari root project:

```bash
GITHUB_TOKEN=<token_baru> ./scripts/sync_public_site.sh
```

Hasil:
- Hanya konten `/docs` (plus `README.md`, `.gitignore`) yang dipush ke repo public.
- Source app tidak ikut terdorong ke public repo.

## 2) Sync full app ke repo private
Jalankan:

```bash
GITHUB_TOKEN=<token_baru> ./scripts/sync_private_app.sh
```

Hasil:
- Snapshot full project disinkronkan ke repo private.
- Aman untuk kerja komersial (source code tetap private).

## 3) Rule harian yang aman
- Ubah website/legal di `/docs`, lalu jalankan `sync_public_site.sh`.
- Ubah Flutter/backend logic, lalu jalankan `sync_private_app.sh`.
- Untuk rilis besar, jalankan keduanya berurutan.

## Security
- Jangan simpan PAT di file source code.
- Revoke token yang pernah dibagikan di chat.
- Gunakan token baru dengan masa aktif pendek.
