# CARF exposure check

A single-file public tool: it tells someone whether their crypto activity falls under the
OECD Crypto-Asset Reporting Framework, which tax authority receives their data, and on what
date. `index.html` is the whole product — inline CSS and JavaScript, no dependencies, no
build step. Deploy it to any static host as it is.

## Page structure

One environment from top to bottom, rather than a hero followed by documents:

1. **Hero** — full height, wireframe globe in canvas carrying the dataset's own exchange
   routes, headline, and three live figures.
2. **Trust** — why nothing leaves the page, as three tiles. This is a ranking and
   credibility requirement, not decoration; do not quietly drop it.
3. **How it works** — collect, report, exchange, with the third stage lit because the first
   cross-border exchange is the next real milestone.
4. **The three questions** — a guided sequence, one question at a time: type-to-search for the
   country (marked `dated` or `no dates` so coverage is visible before you pick), number keys
   to answer, auto-advance, answer chips you can click to go back, and a segmented progress
   bar. This is an enhancement layer: `mountCombo` and `mountStepper` are both wrapped in
   try/catch, and if either fails the plain three-question form underneath still submits.
5. **The result** — numbered plates opening with a readout band (status, receiving authority,
   live countdown), then data path, dates, payload, readiness, sources. Every date is tagged
   with who has to act — you, the platform, or the authorities — and the timeline can be
   filtered down to just your own moves.
6. **Footer** — the standing promise about dates, then maintainer, methodology, changelog.

A fixed background canvas (`#field`) drifts behind all of it, a nav appears once the hero
is behind you, and a scroll progress line runs along the top. That continuity is the point:
the page should not feel like a landing page bolted to a form.

## The interface

An inverted read-out: dark cool ground, one amber accent, six palette values. Type is
Space Grotesk for display and Inter for text, both subset and embedded in the file — see
FONTS.md. The page opens on a full-height hero carrying a wireframe globe drawn in canvas,
with the exchange routes of the dataset's own jurisdictions travelling across it. Below
that, the result is assembled from plates:

- **Data path** — a canvas diagram of the journey your record makes, from the platform to
  its own authority, across the border, to yours. It lays out vertically under 560px and
  horizontally above. Packets animate; under reduced motion it draws one static frame.
- **Fixed dates** — the timeline, rendered with real depth (CSS 3D). Plates settle forward
  on entry, lift on hover or keyboard focus, and the stack tilts a few degrees with a fine
  pointer. Text stays selectable DOM text throughout.
- **Readiness** — the three actions as tracked steps with a progress ring and a live
  countdown to the next dated event. Ticks are in memory only: no storage, and the page
  says so where the reader can see it.

One rule about motion is structural rather than stylistic: **entrance animations are
opt-in**. Every element is visible by default, and the script adds `body.anim` only once it
knows motion is wanted. A stalled animation frame can therefore never leave the content
invisible, which is the usual way an animated page fails. The scroll reveals carry a
four-second failsafe for the same reason. Keep that shape if you add animation.

Two more rules hold the design together. The amber accent marks the next upcoming date and
readiness state, nothing else — its scarcity is what makes it read as a signal. And every
effect is switchable: `prefers-reduced-motion` turns depth, animation and the canvas loop
off automatically, and a visible control in the header does the same for anyone else. Keep
both working when you change anything here.

The closing block invites the reader to pass the page on, and its copy control uses the
clipboard API only — still no network, no storage, no third party.

It makes no network requests, loads no third-party code, and uses no cookies or storage, so
the claim on the page that nothing entered leaves the page is literally true. Keep it that
way: adding an analytics snippet or a web font would make the page lie.

## Before you push

Run `./check.sh`. It now also asserts that the country search and the guided form mounted,
that the form refuses to advance without an answer, and that the readout and date filters
rendered — so a broken enhancement layer fails the check rather than shipping quietly.

Run `./check.sh`. The script is inline in a single HTML file, so one stray character in a
string literal takes the entire page down — no options in the select, no hero, no submit
handler, and nothing visible in the console unless you open it. That has already happened
once. The script parses the JavaScript, confirms the page still makes no network or storage
calls, and drives it in headless Chromium to check the country list populates, the globe
paints and every jurisdiction renders a result.

## Before publishing

1. `MAINTAINER.name` is set to Arya Seen. `MAINTAINER.credentials` is empty — add a
   qualification if you have one, since it is the byline doing the trust work. `CONTACT`
   is still `[YOUR EMAIL]`; the footer's correction line only appears once it holds a real
   address, so the page never shows a placeholder to readers.
2. Check every date against its primary source. `SOURCES.md` lists each one with the
   instrument it came from and flags the rows that most need it.

## Changing the dataset

Jurisdictions live in the `DATA` object at the top of the script. A record moves to
`status: 'sourced'` only on a named legal instrument that is in force — never a news
report, a consultation, a budget announcement or a press release. Anything else stays
`unconfirmed` and renders the "no verified dates" branch, which is a feature of the tool
rather than an error state. Update `LAST_UPDATED` and add a `CHANGELOG` entry in the same
commit as any data change.
