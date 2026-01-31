# Repo Security Review Skill

A Claude Code skill for reviewing GitHub repositories before installing them.

## The Problem

As a non-technical person exploring the AI ecosystem, you'll encounter tons of open-source tools, plugins, and repos that promise to level up your workflow. But downloading and installing code from the internet carries risk — especially when you can't easily read the code yourself to know what it does.

This skill helps bridge that gap by giving Claude Code a structured framework to review repositories *before* you install them.

## What It Does

When you ask Claude Code to review a repo (e.g., `/repo-security-review` or "is this repo safe to install?"), it will:

1. **Gather metadata** — Account age, stars, contributors, recent activity
2. **Clone and scan** — Shallow clone to temp directory, scan for risky patterns
3. **Audit dependencies** — Check for known vulnerabilities
4. **Map system impact** — What files/directories will it create or modify?
5. **Generate a report** — Clear verdict (PASS / FLAG / BLOCK) with reasoning
6. **Wait for your approval** — Never auto-installs anything

## Installation

1. Copy the entire `repo-security-review` folder to your Claude Code skills directory:

```bash
cp -r skills/repo-security-review ~/.claude/skills/
```

2. Make the recon script executable:

```bash
chmod +x ~/.claude/skills/repo-security-review/scripts/quick-recon.sh
```

3. Restart Claude Code (or start a new session)

## Usage

In Claude Code, say things like:
- `/repo-security-review https://github.com/owner/repo`
- "Review this repo before I install it: [link]"
- "Is this GitHub tool safe?"
- "Security check on this plugin"

## Requirements

- **GitHub CLI (`gh`)** — Must be installed and authenticated (`gh auth login`)
- **Claude Code** — This is a Claude Code skill

## Disclaimer

**USE AT YOUR OWN RISK.**

This skill is a helpful tool, not a guarantee of safety. It can miss things. It can flag things that are actually fine. It's meant to give you *more* information to make decisions, not to make decisions for you.

Specifically:
- A "PASS" verdict means no obvious red flags were found — it does NOT mean the code is guaranteed safe
- This skill cannot detect sophisticated or novel attack vectors
- The known-entities list reflects the author's judgment and may be incomplete or outdated
- Always use your own judgment before installing any third-party code

**The author makes no warranties and accepts no liability for any damages resulting from use of this skill.**

## How It Fits the "Figuring Out AI" Theme

One of the barriers to building an AI OS is the need to install and integrate various tools, plugins, and repos from the community. If you're non-technical, this can feel risky — you're essentially running code you can't fully understand.

This skill is meant to lower that barrier by giving you a structured way to vet tools before adding them to your toolkit. It won't eliminate the risk, but it can help you make more informed decisions.

## Files

```
repo-security-review/
├── README.md              # This file
├── SKILL.md               # The skill definition (what Claude reads)
├── references/
│   ├── scan-patterns.md   # Grep patterns for risky code
│   ├── known-entities.md  # Trusted authors/orgs
│   └── report-template.md # Report structure
└── scripts/
    └── quick-recon.sh     # GitHub API reconnaissance script
```

## Contributing

Found a pattern that should be flagged? Know a trusted entity that should be added? Open a PR or start a discussion.
