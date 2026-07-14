# ─────────────────────────────────────────────
# rsync wrapper with .gitignore support
#
# Usage:
#   rsync-dir <local_dir> <remote>          # one-shot sync
#   rsync-dir -w <local_dir> <remote>       # watch mode (auto-sync on change)
#
# <remote> format: user@host:/path/to/dest
#   or just host:/path/to/dest  (uses your default SSH user)
#
# Dependencies:
#   - rsync  (always required)
#   - fswatch (only for watch mode — brew install fswatch)
# ─────────────────────────────────────────────
rss() {
  local watch_mode=false

  # Parse flags
  if [[ "$1" == "-w" || "$1" == "--watch" ]]; then
    watch_mode=true
    shift
  fi

  if [[ $# -lt 2 ]]; then
    echo "Usage: rsync-dir [-w|--watch] <local_dir> <user@host:/remote/dir>"
    return 1
  fi

  local src="$1"
  local dst="$2"

  if [[ "$src" == "." ]]; then
    src="$PWD"
  fi

  # Build rsync filter rules from .gitignore files
  local -a filter_args
  filter_args=(
    --archive           # preserve permissions, timestamps, symlinks, etc.
    --compress          # compress during transfer
#    --delete            # remove files on remote that were deleted locally
    --human-readable
    --progress
    # Always exclude .git directory itself
    --exclude='.git/'
    --exclude='.DS_Store'
  )

  # If a .gitignore exists in the source dir, use it
  if [[ -f "${src%.gitignore}.gitignore" ]] || [[ -f "${1}/.gitignore" ]]; then
    filter_args+=(--filter=':- .gitignore')   # respect every .gitignore found in the tree
  fi

  # ── Helper: run one sync ──────────────────────────────────────────────────
  _do_sync() {
    echo "⟳  Syncing ${src} → ${dst} …"
    rsync "${filter_args[@]}" "$src" "$dst" && echo "✓  Done." || echo "✗  rsync failed (exit $?)."
  }

  # ── One-shot mode ─────────────────────────────────────────────────────────
  if ! $watch_mode; then
    _do_sync
    return
  fi

  # ── Watch mode ────────────────────────────────────────────────────────────
  if ! command -v fswatch &>/dev/null; then
    echo "Error: 'fswatch' is required for watch mode."
    echo "Install it with:  brew install fswatch"
    return 1
  fi

  echo "👁  Watching ${src} for changes (Ctrl-C to stop)…"
  _do_sync   # initial sync before watching

  # Debounce: wait 1 s after the last event before syncing
  local _last_event=0
  fswatch --recursive --latency 0.5 --exclude '\.git/' "$src" | while read -r event; do
    local now=$(date +%s)
    if (( now - _last_event >= 1 )); then
      _last_event=$now
      _do_sync
    fi
  done
}
