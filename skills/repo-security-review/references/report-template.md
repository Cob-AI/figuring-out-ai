# Security Review Report Template

Use this template when generating security review reports.

## Full Report Structure

```markdown
# Security Review: {owner}/{repo}

> **Reviewed:** {YYYY-MM-DD}
> **Verdict:** {PASS|FLAG|BLOCK}
> **Risk Score:** {X.X} / 10.0

---

## Quick Summary

{2-3 sentence plain English summary of what this repo does and key security observations}

**Primary concerns:**
1. {First concern or "None identified"}
2. {Second concern if applicable}

---

## Verdict Rationale

{VERDICT} -- {Specific evidence supporting the verdict. Be concrete: "Uses shell spawning in src/install.js:45 for git operations" not "has some risky code"}

---

## Author Trust: {HIGH|MEDIUM|LOW}

| Dimension | Value |
|-----------|-------|
| Owner | {owner name or org} |
| Stars | {count} |
| License | {MIT/Apache/etc or "None"} |
| Account Age | {X months/years} |
| Contributors | {count} |
| Last Commit | {date or "X days ago"} |
| Known Entity | {Yes - reason / No} |

---

## Security Analysis

### Dependency Audit

| Metric | Value |
|--------|-------|
| Total dependencies | {count or "N/A"} |
| Critical CVEs | {count} |
| High CVEs | {count} |
| Medium CVEs | {count} |
| Lock file present | {Yes/No} |

### Pattern Scan Results

#### Flagged Patterns

{For each finding:}
- **[CATEGORY]** {Brief description} at `{file}:{line}`
  - Context: {What it does, why flagged}
  - Assessment: {Legitimate use / Needs review / Suspicious}

{If no concerning patterns:}
No concerning patterns identified.

#### Clean Scan Areas

The following were scanned and found clean:
- {Pattern category not found}
- {Pattern category not found}

---

## System Impact Map

```
INSTALL creates:
  - {path1}
  - {path2 or "No paths created"}

RUNTIME modifies:
  - {path or "None"}

BACKGROUND processes:
  - {process or "None"}

UNINSTALL requires:
  - {command or "Standard uninstall"}
```

---

## Cost Assessment

| Category | Details |
|----------|---------|
| Installation | {Free / Requires subscription} |
| Runtime | {Free / API costs / Token usage} |
| API Keys Required | {None / List of APIs} |
| Surprise Bill Risk | {None / Low / Medium / High} |

{If API costs:}
**Estimated costs:** {Description of potential costs}

---

## Flagged Items for Human Review

{Numbered list of items requiring human decision:}

1. **{Item title}**
   - Location: `{file}:{line}`
   - Concern: {Why flagged}
   - Question: {What user needs to decide}

2. **{Item title}**
   ...

{If no flagged items:}
No items require explicit human review.

---

## Recommendation

**{VERDICT}** -- {Clear action recommendation}

{For PASS:}
Safe to proceed with installation. {Any minor notes}

{For FLAG:}
Review the flagged items above before proceeding. Specifically:
- {Key decision point 1}
- {Key decision point 2}

{For BLOCK:}
Do not install. {Specific reason and what would need to change}
```

## Abbreviated Report (for batch summaries)

Use in LEDGER.md or summary tables:

```markdown
| Repository | Verdict | Risk | Key Finding | Report |
|------------|---------|------|-------------|--------|
| {owner/repo} | **{VERDICT}** | {X.X} | {One-line summary} | [Report]({file}.md) |
```

## Verdict Criteria Quick Reference

### PASS (0.0 - 2.0)
- No suspicious patterns OR patterns are clearly legitimate
- Known/trusted author OR new but transparent
- Clean dependency audit OR only low-severity issues
- Clear install/uninstall path
- No undisclosed system access

### FLAG (2.1 - 5.0)
- Some patterns need context review
- Unknown author but code looks reasonable
- Some dependency CVEs (non-critical)
- Writes to config directories
- Uses APIs that could incur costs

### BLOCK (5.1 - 10.0)
- Obfuscated code without explanation
- Undisclosed network calls
- Credential harvesting patterns
- Shell profile modification
- Multiple high-severity concerns

## Writing Style

- Use objective language, not alarmist
- Reference specific files and lines
- Explain WHY something is flagged, not just THAT it's flagged
- Provide context for legitimate uses
- Be actionable: what should user do next?
