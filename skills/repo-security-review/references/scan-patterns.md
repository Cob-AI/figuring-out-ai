# Security Scan Patterns Reference

Grep patterns organized by category for the static pattern scan phase.

## HIGH Priority: Code Execution Patterns

### JavaScript/TypeScript
```bash
# Dynamic evaluation (search individually)
Grep pattern: "eval\s*\("
Grep pattern: "new\s+Function\s*\("
Grep pattern: "setTimeout\s*\([^,]+,"  # with string arg
Grep pattern: "setInterval\s*\([^,]+," # with string arg

# Process spawning
Grep pattern: "child_process"
Grep pattern: "spawn\s*\("
Grep pattern: "exec\s*\("
Grep pattern: "execSync"
Grep pattern: "execFile"
```

### Python
```bash
# Dynamic evaluation
Grep pattern: "exec\s*\("
Grep pattern: "eval\s*\("
Grep pattern: "compile\s*\("
Grep pattern: "__import__\s*\("

# Process spawning
Grep pattern: "subprocess"
Grep pattern: "os\.system\s*\("
Grep pattern: "os\.popen"
Grep pattern: "commands\."
```

## HIGH Priority: Network Patterns

```bash
# HTTP clients
Grep pattern: "fetch\s*\("
Grep pattern: "axios"
Grep pattern: "requests\."
Grep pattern: "urllib"
Grep pattern: "http\.request"
Grep pattern: "https\.request"

# WebSocket
Grep pattern: "WebSocket"
Grep pattern: "ws://"
Grep pattern: "wss://"

# Hardcoded IPs (potential C2)
Grep pattern: "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}"

# Base64 URLs (obfuscation)
Grep pattern: "atob\s*\("
Grep pattern: "btoa\s*\("
Grep pattern: "base64"
```

## MEDIUM Priority: File System Patterns

```bash
# File writes
Grep pattern: "writeFile"
Grep pattern: "writeFileSync"
Grep pattern: "fs\.write"
Grep pattern: "open\s*\([^)]+['\"]w"

# Directory operations
Grep pattern: "mkdir"
Grep pattern: "rmdir"
Grep pattern: "rimraf"

# Home directory access
Grep pattern: "os\.homedir"
Grep pattern: "process\.env\.HOME"
Grep pattern: "~/"
Grep pattern: "\$HOME"
Grep pattern: "expanduser"

# Dangerous paths
Grep pattern: "\.bashrc"
Grep pattern: "\.zshrc"
Grep pattern: "\.profile"
Grep pattern: "\.claude/"
Grep pattern: "\.config/"
```

## MEDIUM Priority: Credential Patterns

```bash
# Environment variables
Grep pattern: "process\.env"
Grep pattern: "os\.environ"
Grep pattern: "getenv"
Grep pattern: "dotenv"

# Secret keywords
Grep pattern: "API_KEY"
Grep pattern: "SECRET"
Grep pattern: "PASSWORD"
Grep pattern: "TOKEN"
Grep pattern: "CREDENTIAL"

# Keychain
Grep pattern: "keychain"
Grep pattern: "keytar"
Grep pattern: "credential-store"
```

## HIGH Priority: Obfuscation Indicators

```bash
# Long base64 (>50 chars of base64 alphabet)
Grep pattern: "[A-Za-z0-9+/=]{50,}"

# Hex sequences
Grep pattern: "\\x[0-9a-fA-F]{2}(\\x[0-9a-fA-F]{2}){10,}"

# String char-by-char construction
Grep pattern: "String\.fromCharCode"
Grep pattern: "chr\s*\(\s*\d+\s*\)"
```

## Install Script Patterns

```bash
# npm lifecycle scripts (check package.json)
Grep pattern: "preinstall"
Grep pattern: "postinstall"
Grep pattern: "prepare"

# Python setup hooks (check setup.py)
Grep pattern: "cmdclass"
Grep pattern: "install_requires"
```

## Context Modifiers

When a pattern is found, check context to adjust severity:

| Context | Severity Adjustment |
|---------|---------------------|
| In `test/` or `__tests__/` | Lower by 1 level |
| In `node_modules/` or `vendor/` | Note but deprioritize |
| In `dist/` or `build/` | Expected if source exists |
| Hardcoded strings only | Lower than dynamic input |
| Behind user confirmation | Lower by 1 level |

## Binary Detection

```bash
# Find non-text files in source repo
find . -type f ! -name "*.md" ! -name "*.txt" ! -name "*.json" \
  -exec file {} \; | grep -v "text"
```

Binaries in a source repo (not in releases/) are red flags.
