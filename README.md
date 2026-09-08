# CARF exposure check

A single-file public tool: it tells someone whether their crypto activity falls under the
OECD Crypto-Asset Reporting Framework, which tax authority receives their data, and on what
date. `index.html` is the whole product — inline CSS and JavaScript, no dependencies, no
build step. Deploy it to any static host as it is.

The closing block invites the reader to pass the page on, and its copy control uses the
clipboard API only — still no network, no storage, no third party.

It makes no network requests, loads no third-party code, and uses no cookies or storage, so
the claim on the page that nothing entered leaves the page is literally true. Keep it that
way: adding an analytics snippet or a web font would make the page lie.

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
