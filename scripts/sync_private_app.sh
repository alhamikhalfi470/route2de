#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
PRIVATE_REPO_URL="${PRIVATE_REPO_URL:-https://github.com/alhamikhalfi470/route2de-app-private.git}"
PRIVATE_BRANCH="${PRIVATE_BRANCH:-main}"
GITHUB_USER="${GITHUB_USER:-alhamikhalfi470}"
GIT_AUTHOR_NAME="${GIT_AUTHOR_NAME:-$GITHUB_USER}"
GIT_AUTHOR_EMAIL="${GIT_AUTHOR_EMAIL:-${GITHUB_USER}@users.noreply.github.com}"
COMMIT_MSG="${COMMIT_MSG:-Sync full Route2DE app snapshot}"

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

WORK_DIR="${TMP_DIR}/private-app"
git clone --depth=1 --branch "${PRIVATE_BRANCH}" "${PRIVATE_REPO_URL}" "${WORK_DIR}" >/dev/null

rsync -a --delete \
  --exclude '.git/' \
  --exclude '.DS_Store' \
  --exclude '.dart_tool/' \
  --exclude 'build/' \
  --exclude '.idea/workspace.xml' \
  "${ROOT_DIR}/" "${WORK_DIR}/"

cd "${WORK_DIR}"
git add -A

if git diff --cached --quiet; then
  echo "No private app changes to push."
  exit 0
fi

git -c user.name="${GIT_AUTHOR_NAME}" -c user.email="${GIT_AUTHOR_EMAIL}" commit -m "${COMMIT_MSG}" >/dev/null
git push origin "${PRIVATE_BRANCH}"

echo "Private app synced to ${PRIVATE_REPO_URL} (${PRIVATE_BRANCH})."
