# Source note — every date in the tool, and where it came from

Check this list against primary sources before publication. Two things to know first:

1. **The byline is set to Arya Seen; the credentials field is empty and the contact address
   is still a placeholder.** Both live at the top of the script in `index.html`. A
   qualification after the name carries real weight with this audience — add one if you
   have it, rather than leaving it off. `CONTACT` reads `[YOUR EMAIL]`, and the footer's
   correction line stays inert until it holds a real address, so nothing personal is
   published by accident.
2. **Everything below was assembled from secondary sources** (tax-authority summaries,
   professional-services alerts, legislative trackers, national press) reached through
   web search. Direct access to `legislation.gov.uk`, `gov.uk`, `oecd.org` and similar
   was blocked by the network policy of the machine this was built on, so **no row here
   has been read against the instrument's own text.** The instruments are named so that
   check is a short job. Rows flagged **[VERIFY FIRST]** are the ones where a wrong date
   would do the most damage or where sources disagreed.

The September 2026 interface rebuild changed no date, no instrument and no status in the
dataset — only how they are drawn. This note still describes what the tool renders.

**Re-checked 25 November 2026.** What moved, and what did not:

- **UK:** HMRC withdrew the first-year registration deadline of 31 January 2027 on
  2 November 2026 and confirmed its reporting portal will not open on 1 January 2027. That
  row has been **removed** rather than left showing a withdrawn date. The 31 May 2027
  reporting deadline is unchanged. **[VERIFY FIRST]** against HMRC's own guidance — this
  came from practitioner reporting, not the guidance page itself.
- **EU:** ten of the twelve member states have since transposed DAC8. Only **Czechia and
  Spain** remain; both received reasoned opinions on 19 November 2026, giving them two
  months before referral to the Court of Justice.
- **Canada:** now **Bill C-31** (Budget 2025 Implementation Act No. 2), adding Part XXI of
  the Income Tax Act for 2027 onward, first returns before 2 May 2028. No Royal Assent as
  of late October 2026, and Part XXI commences only on assent.
- **Australia:** draft legislation published **15 October 2026**; still not law.
- **Switzerland:** unchanged in substance; the partner-state list needs a second bill that
  Parliament had not passed as of November 2026.
- **United States:** the OECD commitment list of 23 June 2026 records it for first exchanges
  **by 2029**.
- **No dated row changed** in Ireland, Germany, Denmark, Japan or Singapore. A targeted
  search for changes to the German (31 July 2027) and Danish (31 January 2027) deadlines
  returned nothing either way, so absence of news is the only evidence for those two.

Dataset date: 25 November 2026. Seven jurisdictions render dates. Twenty-four EU member
states, nine other jurisdictions and a catch-all are deliberately recorded as
`unconfirmed`; they render the "no verified dates" branch.

---

## United Kingdom — `status: sourced`

Instrument: **The Reporting Cryptoasset Service Providers (Due Diligence and Reporting
Requirements) Regulations 2025, SI 2025/744** (made 24 June 2025, in force 1 January 2026).

| Date shown | Event | Where it came from |
|---|---|---|
| 1 January 2026 | Collection starts | SI 2025/744 commencement. Consistently reported. |
| 1 January 2027 | Self-certification for pre-existing users must be held | **[VERIFY FIRST]** Derived from the CARF twelve-month due-diligence window for pre-existing users, reported as applying in the UK. Confirm the regulation and whether the operative date is 31 December 2026 or 1 January 2027. |
| 31 May 2027 | First report to HMRC for calendar year 2026 | Reported consistently across HMRC-derived commentary. Confirm the regulation number. Explicitly **not** postponed by the 2 November 2026 guidance change. |
| ~~31 January 2027~~ | ~~Platforms registered with HMRC~~ | **Removed 25 November 2026**, withdrawn by HMRC on 2 November 2026. Nothing replaced it, because no replacement date has been verified. |
| 30 September 2027 | First exchange with partner authorities | CARF-MCAA Section 3, nine months after year end. Confirm against the MCAA text and the UK's activated partner list. |

## Ireland — `status: sourced`

Instruments: **section 891HA, Taxes Consolidation Act 1997** (inserted by **section 92,
Finance Act 2025**); **S.I. No. 584 of 2025**; **Council Directive (EU) 2023/2226 (DAC8)**.

| Date shown | Event | Where it came from |
|---|---|---|
| 1 January 2026 | Collection starts | Revenue-derived commentary; provisions apply from this date. |
| 1 January 2027 | Self-certification for pre-existing users | **[VERIFY FIRST]** DAC8 twelve-month window; confirm in Annex VI as transposed by S.I. 584/2025. |
| 30 September 2027 | First exchange between competent authorities | DAC8 Article 8ad, nine months after year end. |

The record deliberately shows **no filing deadline to Revenue**. DAC8's EU-wide 31 January
date was removed during negotiation and each member state now sets its own; Ireland's was
not verified. If you verify it, add the row — do not assume 31 January.

## Germany — `status: sourced`

Instruments: **Kryptowerte-Steuertransparenzgesetz (KStTG)** (passed 22 December 2025, in
force 24 December 2025); **DAC8**; BMF circular of 14 January 2026 (dataset and interface).

| Date shown | Event | Where it came from |
|---|---|---|
| 1 January 2026 | Collection starts; first reporting period is 2026 | German legal commentary, consistent. |
| 1 January 2027 | Identification complete for users on the books at 31 Dec 2025 | KStTG §§ 4–6 transitional rule, as reported. Confirm the section numbers. |
| 31 July 2027 | First report to the BZSt | **[VERIFY FIRST]** Reported consistently in German commentary, but it differs from other member states (Denmark files 31 January). Confirm the KStTG section that fixes 31 July. |
| 30 September 2027 | First exchange | DAC8 Article 8ad. |

## Denmark — `status: sourced`

Instruments: **Law No. 409 of 2025** (Danish implementation of DAC8 and the OECD CARF,
generally in force 1 May 2025); **Executive Order No. 1155 of 2025**, published in the
Danish Official Gazette on 2 October 2025; **DAC8**.

| Date shown | Event | Where it came from |
|---|---|---|
| 1 January 2026 | Collection starts | Law No. 409/2025 and Executive Order No. 1155/2025, as reported by Danish and international practitioner commentary. **[VERIFY FIRST]** Confirm the law number and the commencement provision — the law itself came into force 1 May 2025 but the reporting obligations run from 1 January 2026, and that distinction must be right. |
| 1 January 2027 | Self-certification for pre-existing users | DAC8 twelve-month window as implemented. Confirm in the Executive Order. |
| 31 January 2027 | First report to Skattestyrelsen | Reported consistently: Denmark set its own 31 January deadline rather than using the full year DAC8 now allows. This is the earliest filing date in the dataset. Confirm the section of Executive Order No. 1155/2025 that fixes it. |
| 30 September 2027 | First exchange | DAC8 Article 8ad. |

Skattestyrelsen has said its reporting system will be ready in January 2027; that statement
is context in the event text, not a date the tool renders.

## Japan — `status: sourced`

Instrument: **FY2024 tax reform (令和6年度税制改正)**, amending the Act on Special Provisions
for the Enforcement of Tax Treaties; in force 1 January 2026.

| Date shown | Event | Where it came from |
|---|---|---|
| 1 January 2026 | Collection starts | Japanese practitioner commentary, consistent. |
| 31 December 2026 | Residence notification due from users who opened accounts on or before 31 Dec 2025 | **[VERIFY FIRST]** This is a *user* obligation with a near deadline, so it carries the highest cost if wrong. Confirm the article and the exact deadline. |
| 30 April 2027 | First report to the National Tax Agency | **[VERIFY FIRST]** Reported as "by 30 April of the following year". Confirm. |
| 30 September 2027 | First exchange | CARF-MCAA. |

## Singapore — `status: sourced`

Instrument: **Income Tax (International Tax Compliance Agreements) (Crypto-Asset Reporting
Framework) Regulations 2026**, first published in the Government Gazette 11 August 2026,
under the Income Tax Act 1947.

| Date shown | Event | Where it came from |
|---|---|---|
| 11 August 2026 | Regulations gazetted | IRAS-derived commentary. |
| 1 January 2027 | Collection starts (first reporting year is 2027, not 2026) | IRAS. |
| 31 December 2027 | Self-certification deadline for users existing at 31 Dec 2026 | IRAS. |
| 1 January 2028 | Platforms must stop relevant transactions for users without one | IRAS. |
| 31 May 2028 | First return to IRAS for 2027 | IRAS. |
| September 2028 (`display`, sorts at 30 Sep 2028) | First exchange | Singapore's stated commitment to begin exchanges in September 2028. The commitment names the month only, so the tool shows the month only. |

## United States — `status: sourced`, `outside: true`

Not a CARF jurisdiction. Instruments: **IRC § 6045** and the **2024 digital asset broker
final regulations**, following the Infrastructure Investment and Jobs Act 2021.

| Date shown | Event | Where it came from |
|---|---|---|
| 1 January 2025 | Gross proceeds reporting begins | Final regulations. |
| Early 2026 (`display`, sorts at 31 Jan 2026) | First Form 1099-DA issued, covering 2025, proceeds only | Reported as "early 2026". Rendered as a word, not a fabricated day. |
| 1 January 2026 | Cost basis reporting begins for covered digital assets | Final regulations. |
| Early 2027 (`display`, sorts at 31 Jan 2027) | First 1099-DA carrying cost basis, covering 2026 | Same. |

The record states the US is not in the 2027 or 2028 rounds, has not signed the CARF-MCAA,
and is recorded by the OECD for first exchanges by 2029. **[VERIFY FIRST]** against the
OECD's commitment list and its signatory list — two different lists, and the US appears on
one but not the other.

---

## Recorded as `unconfirmed` — no dates rendered

| Jurisdiction | Why |
|---|---|
| Switzerland | AEOI Act extension approved 26 September 2025, in force 1 January 2026, but the Federal Council decided on 26 November 2025 that the crypto provisions would not apply during 2026. The 74-state partner list needs a second bill, unpassed as of November 2026, and partners are re-checked against the standard before any exchange. No exchange date is fixed. |
| Canada | Bill C-31 (Budget 2025 Implementation Act No. 2) would add Part XXI of the Income Tax Act for 2027 onward, first returns before 2 May 2028. No Royal Assent as of late October 2026; Part XXI commences on assent, so wording and dates can still change. |
| Australia | Draft legislation published 15 October 2026, following the 2025–26 MYEFO announcement; the ATO still records it as not yet law. Proposed collection start 1 January 2027, first exchange 2028, with much of the detail left to regulations that do not exist yet. |
| Czechia, Spain | The only two of the original twelve still being pursued. Reasoned opinions issued 19 November 2026: two months to finish transposing or be referred to the Court of Justice. |
| Austria, Belgium, Bulgaria, Croatia, Cyprus, Estonia, Finland, France, Greece, Hungary, Italy, Latvia, Lithuania, Luxembourg, Malta, Netherlands, Poland, Portugal, Romania, Slovakia, Slovenia, Sweden | Not among the twelve named, so they appear to have transposed — but the national instrument and the nationally-set filing deadline were not verified. Each needs the same treatment Denmark got: find the instrument, find the nationally-set filing date, then promote. |
| Brazil, India, New Zealand, Norway, South Africa, United Arab Emirates | No primary source verified. |
| "Somewhere else, or not listed above" | Catch-all. |

## Framework-level claims made in the copy

| Claim | Source |
|---|---|
| 76 committed jurisdictions as at 23 June 2026: 46 for first exchanges by 2027, 29 by 2028, the United States by 2029 | OECD commitment list via secondary compilations. **[VERIFY FIRST]** — quoted on the page. The earlier wording said "46 for 2026, 29 for 2027, one for 2028", a year out on each; corrected 25 November 2026. |
| Exchange within nine months of year end | CARF-MCAA Section 3; DAC8 Article 8ad. |
| Reportable retail payments above roughly USD 50,000 | OECD CARF, Section I. Confirm the threshold wording. |
| Blocking after two reminders and 60 days | CARF/DAC8 due diligence rules, as reported for the UK. **[VERIFY FIRST]** before relying on the 60-day figure. |

## Maintenance rule

The comment above `DATA` in `index.html` states it and it should stay: a jurisdiction moves
to `sourced` only on a named legal instrument that is in force, never on a news report, a
consultation, a budget announcement or a press release. Add the changelog entry in the same
commit as the data change.
