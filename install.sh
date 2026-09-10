#!/usr/bin/env sh
set -eu

say()  { printf '\033[36m[+]\033[0m %s\n' "$1"; }
ok()   { printf '\033[32m[ok]\033[0m %s\n' "$1"; }
warn() { printf '\033[33m[!]\033[0m %s\n' "$1"; }
die()  { printf '\033[31m[x]\033[0m %s\n' "$1" >&2; exit 1; }

# --- locate repo ---------------------------------------------------------
repo=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P) || die "cannot locate repo"
[ -f "$repo/init.lua" ] || die "$repo does not look like this nvim config (init.lua missing)"

# --- options -------------------------------------------------------------
copy=0
bootstrap=1
for arg in "$@"; do
  case "$arg" in
    --copy)         copy=1 ;;
    --no-bootstrap) bootstrap=0 ;;
    -h|--help)
      cat <<EOF
Usage: $0 [--copy] [--no-bootstrap]

  --copy          copy files instead of symlinking
  --no-bootstrap  do not launch nvim to install plugins
EOF
      exit 0 ;;
    *) die "unknown option: $arg" ;;
  esac
done

# --- platform ------------------------------------------------------------
os=$(uname -s 2>/dev/null || echo unknown)
case "$os" in
  MINGW*|MSYS*|CYGWIN*) os=windows ;;
  Darwin)               os=macos ;;
  Linux)                os=linux ;;
  *)                    os=unix ;;
esac

if [ "$os" = "windows" ]; then
  base="${LOCALAPPDATA:-$HOME/AppData/Local}"
  if command -v cygpath >/dev/null 2>&1; then
    base=$(cygpath -u "$base")
  else
    base=$(printf '%s' "$base" | tr '\\' '/')
  fi
  target="$base/nvim"
else
  target="${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
fi

say "platform:      $os"
say "config target: $target"

# --- already installed? --------------------------------------------------
same=0
if [ -e "$target" ] || [ -L "$target" ]; then
  target_real=$(CDPATH= cd -- "$target" 2>/dev/null && pwd -P) || target_real=""
  if [ -n "$target_real" ] && [ "$target_real" = "$repo" ]; then
    same=1
    ok "already installed: $target is this repo"
  fi
fi

if [ "$same" -ne 1 ]; then
  if [ -e "$target" ] || [ -L "$target" ]; then
    backup="$target.bak.$(date +%Y%m%d%H%M%S)"
    warn "backing up existing config to $backup"
    mv "$target" "$backup"
  fi

  mkdir -p "$(dirname -- "$target")"

  if [ "$copy" -eq 0 ]; then
    if ln -s "$repo" "$target" 2>/dev/null; then
      ok "linked $target -> $repo"
    else
      warn "symlink failed (permissions?); copying instead"
      copy=1
    fi
  fi

  if [ "$copy" -eq 1 ]; then
    mkdir -p "$target"
    if command -v tar >/dev/null 2>&1; then
      (cd "$repo" && tar cf - --exclude=.git .) | (cd "$target" && tar xf -)
    else
      cp -R "$repo/." "$target/"
    fi
    ok "copied $repo -> $target"
  fi
fi

# --- neovim --------------------------------------------------------------
if command -v nvim >/dev/null 2>&1; then
  ver=$(nvim --version 2>/dev/null | head -n1 | sed 's/[^0-9.]//g' | tr -d '\r')
  major=$(printf '%s' "$ver" | cut -d. -f1)
  minor=$(printf '%s' "$ver" | cut -d. -f2)
  if [ "${major:-0}" -gt 0 ] || [ "${minor:-0}" -ge 12 ]; then
    ok "neovim $ver"
  else
    warn "neovim $ver found, but vim.pack requires >= 0.12"
  fi
else
  warn "neovim not found: https://github.com/neovim/neovim/releases"
fi

# --- optional dependencies ----------------------------------------------
for dep in git rg tree-sitter; do
  if command -v "$dep" >/dev/null 2>&1; then
    ok "$dep found"
  else
    warn "$dep not found (optional)"
  fi
done
for cc in cc gcc clang cl; do
  if command -v "$cc" >/dev/null 2>&1; then
    ok "C compiler: $cc"
    break
  fi
done

# --- bootstrap plugins ---------------------------------------------------
if [ "$bootstrap" -eq 1 ] && command -v nvim >/dev/null 2>&1; then
  say "installing plugins (first launch may take a while)..."
  nvim --headless "+qa" >/dev/null 2>&1 \
    || warn "plugin bootstrap returned non-zero; open nvim and run :checkhealth"
fi

ok "done. open nvim to finish setup."
