#!/usr/bin/env bash
# Pre-publish check for index.html.
#
# The page is one file with the script inline, so a single stray character in a
# string literal takes the whole thing down: no options in the select, no globe,
# no submit handler, and nothing in the console unless you open it. That has
# happened. Run this before every push.
#
#   ./check.sh
#
# Needs node. Uses Chromium for the smoke test if one can be found; skips that
# part with a warning if not.

set -uo pipefail
cd "$(dirname "$0")"
FILE=index.html
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
fail=0

say() { printf '%-34s %s\n' "$1" "$2"; }

# 1 — the script must parse
python3 - "$FILE" > "$TMP/app.js" <<'PYEOF'
import re, sys
s = open(sys.argv[1], encoding='utf-8').read()
m = re.search(r'<script>(.*)</script>', s, re.S)
sys.stdout.write(m.group(1) if m else '')
PYEOF
if [ ! -s "$TMP/app.js" ]; then
  say "script extraction" "FAIL — no <script> block found"; fail=1
elif node --check "$TMP/app.js" 2>"$TMP/syntax.txt"; then
  say "javascript parses" "ok"
else
  say "javascript parses" "FAIL"; sed 's/^/    /' "$TMP/syntax.txt" | head -6; fail=1
fi

# 2 — the promises the page makes about itself
if grep -qE "localStorage|sessionStorage|document\.cookie|fetch\(|XMLHttpRequest|WebSocket" "$FILE"; then
  say "no storage or network calls" "FAIL"; fail=1
else
  say "no storage or network calls" "ok"
fi
if grep -qE '(src|href)="https?:|@import' "$FILE"; then
  say "no external resources" "FAIL"; fail=1
else
  say "no external resources" "ok"
fi

# 3 — does it actually run
CH=""
for c in /opt/pw-browsers/chromium_headless_shell-*/chrome-linux/headless_shell \
         /opt/pw-browsers/chromium-*/chrome-linux/chrome \
         "$(command -v chromium 2>/dev/null)" "$(command -v google-chrome 2>/dev/null)"; do
  [ -x "$c" ] && { CH="$c"; break; }
done

if [ -z "$CH" ]; then
  say "smoke test" "SKIPPED — no chromium found"
else
  python3 - "$FILE" "$TMP/smoke.html" ".check/probe.js" <<'PYEOF'
import sys
s = open(sys.argv[1], encoding='utf-8').read()
probe = open(sys.argv[3], encoding='utf-8').read()
open(sys.argv[2], 'w', encoding='utf-8').write(
    s.replace('</body>', '<script>' + probe + '</script></body>'))
PYEOF
  out=$("$CH" --headless --no-sandbox --disable-gpu --virtual-time-budget=12000 \
        --window-size=1200,900 --dump-dom "file://$TMP/smoke.html" 2>/dev/null \
        | grep -o '<title>RESULT[^<]*</title>' | sed 's/<[^>]*>//g')
  if [ -z "$out" ]; then
    say "smoke test" "FAIL — script never ran (parse error?)"; fail=1
  else
    say "smoke test" "${out#RESULT }"
    check() { case "$out" in *"$1"*) ;; *) say "  $2" "FAIL — $3"; fail=1 ;; esac; }
    check "bad=0"                 "result rendering" "some combinations render empty"
    check "errors=none"           "console"          "runtime errors"
    check "combo=1"               "country search"   "combobox did not mount"
    check "steps=3"               "guided form"      "stepper did not mount"
    check "visiblestep=1"         "guided form"      "not one step at a time"
    check "blockedwithoutanswer=1" "guided form"     "advances without an answer"
    check "readout=1"             "result readout"   "countdown missing"
    check "filters=4"             "date filters"     "filter chips missing"
    opts=$(printf '%s' "$out" | sed -n 's/.*options=\([0-9]*\).*/\1/p')
    [ "${opts:-0}" -gt 10 ] || { say "  select" "FAIL — country list not populated"; fail=1; }
    px=$(printf '%s' "$out" | sed -n 's/.*globepx=\([0-9]*\).*/\1/p')
    [ "${px:-0}" -gt 1000 ] || { say "  hero globe" "FAIL — canvas is blank"; fail=1; }
    fr=$(printf '%s' "$out" | sed -n 's/.*afteryoufilter=\([0-9]*\).*/\1/p')
    [ "${fr:-0}" -ge 1 ] || { say "  date filters" "FAIL — filtering hid every row"; fail=1; }
  fi
fi

echo
[ "$fail" -eq 0 ] && echo "All checks passed." || echo "CHECKS FAILED — do not publish."
exit "$fail"
