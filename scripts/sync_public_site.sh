#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PUBLIC_REPO_URL="${PUBLIC_REPO_URL:-https://github.com/alhamikhalfi470/route2de.git}"
PUBLIC_BRANCH="${PUBLIC_BRANCH:-main}"
GITHUB_USER="${GITHUB_USER:-alhamikhalfi470}"
GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-$GITHUB_USER}"
GIT_AUTHOR_EMAIL="${GIT_AUTHOR_EMAIL:-${GITHUB_USER}@users.noreply.github.com}"
COMMIT_MSG="${COMMIT_MSG:-Update public website content from /docs}"

if [[ -z "${GITHUB_TOKEN:-}" ]]; then
  echo "ERROR: Set GITHUB_TOKEN before running this script."
  exit 1
fi

TMP_DIR="$(mktemp -d)"
ASKPASS_FILE="${TMP_DIR}/askpass.sh"
trap 'rm -rf "${TMP_DIR}"' EXIT

cat > "${ASKPASS_FILE}" <<'ASKPASS'
#!/bin/sh
case "$1" in
  *Username*) echo "$GITHUB_USER" ;;
  *Password*) echo "$GITHUB_TOKEN" ;;
  *) echo "" ;;
esac
ASKPASS
chmod 700 "${ASKPASS_FILE}"

export GITHUB_USER GITHUB_TOKEN
export GIT_ASKPASS="${ASKPASS_FILE}"
export GIT_TERMINAL_PROMPT=0

WORK_DIR="${TMP_DIR}/public-site"
git clone --depth=1 --branch "${PUBLIC_BRANCH}" "${PUBLIC_REPO_URL}" "${WORK_DIR}" >/dev/null

rsync -a --delete --exclude '.DS_Store' "${ROOT_DIR}/docs/" "${WORK_DIR}/docs/"

cat > "${WORK_DIR}/README.md" <<'README'
# Route2DE Website

Public repository for Route2DE landing page and legal pages.

- Landing: `https://route2de.com/`
- Privacy Policy: `https://route2de.com/privacy.html`
- Terms of Use: `https://route2de.com/terms.html`
- Support: `https://route2de.com/support.html`

This repo is intentionally website-only.
README

cat > "${WORK_DIR}/.gitignore" <<'GITIGNORE'
.DS_Store
GITIGNORE

cd "${WORK_DIR}"
git add -A

if git diff --cached --quiet; then
  echo "No public site changes to push."
  exit 0
fi

git -c user.name="${GIT_AUTHOR_NAME}" -c user.email="${GIT_AUTHOR_EMAIL}" commit -m "${COMMIT_MSG}" >/dev/null
git push origin "${PUBLIC_BRANCH}"

echo "Public website synced to ${PUBLIC_REPO_URL} (${PUBLIC_BRANCH})."
