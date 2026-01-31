---
name: repo-security-review
description: This skill should be used when the user asks to "review a repo", "security review this", "check if this repo is safe", "audit this GitHub repo", "vet this tool before installing", "is this plugin safe", or when PRs contain links to GitHub repositories requiring security vetting before installation.
---

# Repo Security Review

Pre-installation security review for third-party GitHub repositories, tools, and plugins.

## Purpose

Review repositories BEFORE installation to determine if they are safe. This differs from code-auditing skills (security-auditor, SAST) which review YOUR code. This skill answers: "Should I install this third-party code on my machine?"

## When to Use

- Before installing any GitHub repo, plugin, or tool
- When PRs contain repository links
- When evaluating bookmarked repos
- When someone recommends a tool to install

## 7-Phase Pipeline

Execute phases in order. Stop and report if BLOCK trigger found.

### Phase 1: Remote Reconnaissance

Gather metadata without cloning. Run the recon script or equivalent API calls:

```bash
./scripts/quick-recon.sh owner/repo
```

Or manually:
```bash
gh api users/{owner}              # Account info
gh api repos/{owner}/{repo}       # Repo metadata
gh api repos/{owner}/{repo}/contributors?per_page=1  # Contributor count
gh api repos/{owner}/{repo}/commits?per_page=10      # Recent activity
```

**Auto-FLAG triggers:**
- Account < 30 days old
- Repo < 7 days with high stars
- Disabled issue tracker
- Archived with no fork

Consult `references/known-entities.md` for trusted author list.

### Phase 2: Shallow Clone

```bash
git clone --depth 1 {url} /tmp/security-review/{repo}/
```

Identify: project type (package.json, requirements.txt, etc.), file count, binaries in source, sensitive files (.env, credentials).

### Phase 3: Dependency Audit

Run in report-only mode (no install):

| Stack | Command |
|-------|---------|
| Node | `npm audit --json` |
| Python | `pip-audit` |

Flag HIGH/CRITICAL CVEs. Note if >200 dependencies (supply chain risk).

### Phase 4: Static Pattern Scan

Use Grep to search for patterns. See `references/scan-patterns.md` for complete list.

**HIGH Priority:**
- Dynamic code evaluation patterns
- Shell/process spawning
- Network calls (fetch, axios, requests)
- Obfuscation indicators (long base64, hex sequences)

**MEDIUM Priority:**
- File system writes
- Home directory access
- Credential/environment access

For each match, note file:line and assess context (test file? legitimate use?).

### Phase 5: Permission Analysis

Map system impact:

```
INSTALL creates:    [paths]
RUNTIME modifies:   [paths or none]
BACKGROUND:         [processes or none]
UNINSTALL:          [removal steps]
```

Check for: preinstall/postinstall scripts, shell profile mods, git hooks, daemons.

### Phase 6: Generate Report

Write to `security-reviews/{repo-name}.md` using template from `references/report-template.md`.

**Key sections:**
1. Quick Summary (2-3 sentences)
2. Verdict + Rationale
3. Author Trust assessment
4. Dependency audit results
5. Pattern scan findings (file:line refs)
6. System impact map
7. Cost assessment
8. Flagged items for human review
9. Recommendation

### Phase 7: Human Gate

Present findings. Await explicit approval. Never auto-install.

## Scoring

### 6 Dimensions

| Dimension | Weight |
|-----------|--------|
| Author Trust | 15% |
| Code Safety | 25% |
| Dependency Health | 20% |
| Permission Scope | 20% |
| Install Cleanliness | 10% |
| Maintenance Signal | 10% |

### Verdicts

| Score | Verdict | Meaning |
|-------|---------|---------|
| 0.0-2.0 | PASS | Low risk, recommend proceeding |
| 2.1-5.0 | FLAG | Moderate risk, review flagged items |
| 5.1-10.0 | BLOCK | High risk, recommend against |

### Auto-BLOCK Triggers

Any single finding forces BLOCK:
1. Obfuscated executable payloads
2. Undisclosed network calls to unknown domains
3. Credential harvesting patterns
4. Shell profile modification without disclosure
5. Security bypass in non-test code

## Important Constraints

**Security hook:** Environment may block writes containing code-execution keywords. Describe findings by category + file:line, not by quoting source.

**No execution:** All analysis on cloned source only. Nothing installed or run.

**Security ≠ Install-Ready:** A PASS means no malware, not "install blindly." Consider file disruption from original analysis separately.

## Integration with Bookmarks

When repos come from bookmark analysis:

| Security | File Disruption | Action |
|----------|-----------------|--------|
| PASS | None/Low | Install |
| PASS | Medium/High | Review disruption first |
| FLAG | Any | Review security report |
| BLOCK | Any | Do not install |

## Reference Files

- **`references/scan-patterns.md`** - Complete grep patterns by category
- **`references/known-entities.md`** - Trusted authors and organizations
- **`references/report-template.md`** - Full report template

## Scripts

- **`scripts/quick-recon.sh`** - Automated GitHub API reconnaissance
