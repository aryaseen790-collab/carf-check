# Source note — every date in the tool, and where it came from

Check this list against primary sources before publication. Two things to know first:

1. **The byline is a placeholder.** `MAINTAINER` at the top of the script in `index.html`
   reads `[YOUR NAME]` / `[YOUR CREDENTIALS]`. The named author is a trust requirement and
   cannot be invented — set it to a real person who will stand behind the dataset.
2. **Everything below was assembled from secondary sources** (tax-authority summaries,
   professional-services alerts, legislative trackers, national press) reached through
   web search. Direct access to `legislation.gov.uk`, `gov.uk`, `oecd.org` and similar
   was blocked by the network policy of the machine this was built on, so **no row here
   has been read against the instrument's own text.** The instruments are named so that
   check is a short job. Rows flagged **[VERIFY FIRST]** are the ones where a wrong date
   would do the most damage or where sources disagreed.

Dataset date: 7 September 2026. Twenty-five EU member states and eleven other jurisdictions are
deliberately recorded as `unconfirmed`; they render the "no verified dates" branch.

---

## United Kingdom — `status: sourced`

Instrument: **The Reporting Cryptoasset Service Providers (Due Diligence and Reporting
Requirements) Regulations 2025, SI 2025/744** (made 24 June 2025, in force 1 January 2026).

| Date shown | Event | Where it came from |
|---|---|---|
| 1 January 2026 | Collection starts | SI 2025/744 commencement. Consistently reported. |
| 1 January 2027 | Self-certification for pre-existing users must be held | **[VERIFY FIRST]** Derived from the CARF twelve-month due-diligence window for pre-existing users, reported as applying in the UK. Confirm the regulation and whether the operative date is 31 December 2026 or 1 January 2027. |
| 31 January 2027 | Platforms registered with HMRC | **[VERIFY FIRST]** From a single practitioner briefing. Confirm the registration provision and date in SI 2025/744. |
| 31 May 2027 | First report to HMRC for calendar year 2026 | Reported consistently across HMRC-derived commentary. Confirm the regulation number. |
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

The record also states the US has not signed the CARF-MCAA. **[VERIFY FIRST]** against the
OECD's published signatory list at the date of publication.

---

## Recorded as `unconfirmed` — no dates rendered

| Jurisdiction | Why |
|---|---|
| Switzerland | AEOI Act extension approved 26 September 2025, in force 1 January 2026, but the Federal Council decided on 26 November 2025 that the crypto provisions would not apply during 2026 while the 74-state partner list is settled. No exchange date is fixed. |
| Canada | Draft proposals of 15 August 2025 (new Part of the Income Tax Act); start deferred from 1 January 2026 to 1 January 2027 in the 2026 spring update. Not enacted. |
| Australia | Announced in the 2025–26 MYEFO on 17 December 2025; the ATO states the measure is not yet law. |
| Belgium, Bulgaria, Cyprus, Czechia, Estonia, Greece, Luxembourg, Malta, Netherlands, Poland, Portugal, Spain | The twelve member states the European Commission named in February 2026 for failing to transpose DAC8. Obligations depend on national law that was not yet in force. |
| Austria, Croatia, Denmark, Finland, France, Hungary, Italy, Latvia, Lithuania, Romania, Slovakia, Slovenia, Sweden | Not among the twelve named, so they appear to have transposed — but the national instrument and the nationally-set filing deadline were not verified. Denmark is the closest to promotion: its 31 January deadline is reported, the instrument is not named here. |
| Brazil, India, New Zealand, Norway, South Africa, United Arab Emirates | No primary source verified. |
| "Somewhere else, or not listed above" | Catch-all. |

## Framework-level claims made in the copy

| Claim | Source |
|---|---|
| 46 jurisdictions committed for the 2026 reporting period, 29 for 2027, one for 2028, as at 23 June 2026 | OECD, as reported in CARF implementation commentary. **[VERIFY FIRST]** — this number is quoted on the page. |
| Other 2026 tallies put total commitments near 76 | Secondary commentary. Quoted as an approximation, deliberately. |
| Exchange within nine months of year end | CARF-MCAA Section 3; DAC8 Article 8ad. |
| Reportable retail payments above roughly USD 50,000 | OECD CARF, Section I. Confirm the threshold wording. |
| Blocking after two reminders and 60 days | CARF/DAC8 due diligence rules, as reported for the UK. **[VERIFY FIRST]** before relying on the 60-day figure. |

## Maintenance rule

The comment above `DATA` in `index.html` states it and it should stay: a jurisdiction moves
to `sourced` only on a named legal instrument that is in force, never on a news report, a
consultation, a budget announcement or a press release. Add the changelog entry in the same
commit as the data change.
