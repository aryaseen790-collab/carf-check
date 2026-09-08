# Typefaces

The page embeds two typefaces as base64 `woff2` inside its own `<style>` block. That is
deliberate: a webfont served from a CDN would make a network request on every visit, and the
page's central claim is that it makes none. Inlining keeps the claim true, removes the
flash of unstyled text, and keeps the file working offline.

## What is embedded

| Family | Role | Copyright | Licence |
|---|---|---|---|
| **Inter** | body and interface text | Copyright 2016 The Inter Project Authors (https://github.com/rsms/inter) | SIL Open Font Licence 1.1 — https://openfontlicense.org |
| **Space Grotesk** | display: headline, dates, figures, headings | Copyright 2020 The Space Grotesk Project Authors (https://github.com/floriankarsten/space-grotesk) | SIL Open Font Licence 1.1 — https://scripts.sil.org/OFL |

Both are variable fonts carrying a weight axis, so one file per family covers every weight
the page uses. Both are used under the SIL Open Font Licence 1.1. Neither is sold, and
neither is distributed on its own — they travel only as part of this page, which is what the
licence permits.

## What was done to them

The files are subsets of the Google Fonts distributions, cut down with `pyftsubset` to the
207 codepoints this page can actually render — ASCII, the Latin-1 and Latin Extended-A
letters that appear in European authority names, and the punctuation the copy uses. The
`tnum` (tabular figures) feature is retained deliberately: it is what keeps the dates
aligned down the timeline column. Hinting is dropped; the weight axis is kept.

Subsetting for web delivery under the same family name is the same thing Google Fonts does
when it serves these families, and the licence permits modification. Four files result —
Latin and Latin Extended for each family — totalling about 78KB of base64.

Characters outside that set fall back to the reader's system font. That is intentional and
affects one place: the Japanese instrument names in the dataset (国税庁, 令和6年度税制改正),
which render in the system's CJK face. Adding CJK coverage would cost several megabytes to
serve a handful of characters.

## If you change the typefaces

Regenerate the subsets rather than dropping in full font files, keep `tnum`, and update this
file with the new copyright lines — read them out of the font's own name table (nameID 0 and
14) rather than copying them from a website, so the notice matches what you actually shipped.
And do not replace the inlining with a CDN link: it would break the promise in the page's
own privacy statement.
