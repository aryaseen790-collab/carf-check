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
python3 - "$FILE" > "$TMP/app.js" <<'PY'
import re, sys
s = open(sys.argv[1], encoding='utf-8').read()
m = re.search(r'<script>(.*)</script>', s, re.S)
sys.stdout.write(m.group(1) if m else '')
PY
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
  python3 - "$FILE" "$TMP/smoke.html" <<'PY'
import sys
s = open(sys.argv[1], encoding='utf-8').read()
probe = """
<script>
window.__e=[]; window.onerror=function(m,u,l){window.__e.push(m+' @'+l);};
setTimeout(function(){
  var r=[], sel=document.getElementById('j'), f=document.getElementById('the-form');
  r.push('options='+(sel?sel.options.length:0));
  var c=document.getElementById('globe'), lit=0;
  if(c&&c.getContext){var d=c.getContext('2d').getImageData(0,0,c.width,c.height).data;
    for(var i=3;i<d.length;i+=4){if(d[i]>8)lit++;}}
  r.push('globepx='+lit);
  var bad=0,n=0;
  for(var i=1;i<sel.options.length;i++){
    ['platform','self','none'].forEach(function(u){
      sel.value=sel.options[i].value;
      f.querySelector('input[name=use][value='+u+']').checked=true;
      f.querySelector('input[name=past][value=gaps]').checked=true;
      f.dispatchEvent(new Event('submit',{cancelable:true,bubbles:true}));
      n++;
      var h=document.getElementById('result').innerHTML;
      if(h.length<300||/undefined|NaN/.test(h)) bad++;
    });
  }
  r.push('combos='+n); r.push('bad='+bad);
  r.push('errors='+(window.__e.length?window.__e.join('; '):'none'));
  document.title='RESULT '+r.join(' ');
},1200);
</script>
"""
open(sys.argv[2],'w',encoding='utf-8').write(s.replace('</body>', probe+'</body>'))
PY
  out=$("$CH" --headless --no-sandbox --disable-gpu --virtual-time-budget=9000 \
        --window-size=1200,900 --dump-dom "file://$TMP/smoke.html" 2>/dev/null \
        | grep -o '<title>RESULT[^<]*</title>' | sed 's/<[^>]*>//g')
  if [ -z "$out" ]; then
    say "smoke test" "FAIL — script never ran (parse error?)"; fail=1
  else
    say "smoke test" "${out#RESULT }"
    case "$out" in
      *"bad=0"*) ;;
      *) say "  result rendering" "FAIL — some combinations render empty"; fail=1 ;;
    esac
    case "$out" in
      *"errors=none"*) ;;
      *) say "  console" "FAIL — runtime errors"; fail=1 ;;
    esac
    opts=$(printf '%s' "$out" | sed -n 's/.*options=\([0-9]*\).*/\1/p')
    [ "${opts:-0}" -gt 10 ] || { say "  select" "FAIL — country list not populated"; fail=1; }
    px=$(printf '%s' "$out" | sed -n 's/.*globepx=\([0-9]*\).*/\1/p')
    [ "${px:-0}" -gt 1000 ] || { say "  hero globe" "FAIL — canvas is blank"; fail=1; }
  fi
fi

echo
[ "$fail" -eq 0 ] && echo "All checks passed." || echo "CHECKS FAILED — do not publish."
exit "$fail"
