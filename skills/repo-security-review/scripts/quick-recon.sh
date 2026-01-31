#!/bin/bash
# Quick reconnaissance script for GitHub repos
# Usage: ./quick-recon.sh owner/repo

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 owner/repo"
    exit 1
fi

REPO="$1"
OWNER=$(echo "$REPO" | cut -d'/' -f1)
REPO_NAME=$(echo "$REPO" | cut -d'/' -f2)

echo "=== Security Recon: $REPO ==="
echo ""

# Check if gh is authenticated
if ! gh auth status &>/dev/null; then
    echo "ERROR: GitHub CLI not authenticated. Run: gh auth login"
    exit 1
fi

echo "--- Owner Info ---"
gh api "users/$OWNER" --jq '{
    login: .login,
    type: .type,
    created_at: .created_at,
    public_repos: .public_repos,
    followers: .followers
}' 2>/dev/null || echo "Could not fetch owner info (may be org)"

echo ""
echo "--- Repo Info ---"
gh api "repos/$REPO" --jq '{
    name: .name,
    description: .description,
    stars: .stargazers_count,
    forks: .forks_count,
    open_issues: .open_issues_count,
    license: .license.spdx_id,
    created_at: .created_at,
    updated_at: .updated_at,
    archived: .archived,
    default_branch: .default_branch
}'

echo ""
echo "--- Contributors ---"
CONTRIB_COUNT=$(gh api "repos/$REPO/contributors?per_page=1" -i 2>/dev/null | grep -i "link:" | grep -oP 'page=\K[0-9]+(?=>; rel="last")' || echo "1")
echo "Total contributors: $CONTRIB_COUNT"

echo ""
echo "--- Recent Commits ---"
gh api "repos/$REPO/commits?per_page=5" --jq '.[] | {
    date: .commit.author.date,
    author: .commit.author.name,
    message: .commit.message | split("\n")[0]
}'

echo ""
echo "--- Security Issues ---"
SECURITY_ISSUES=$(gh api "search/issues?q=repo:$REPO+label:security" --jq '.total_count' 2>/dev/null || echo "0")
echo "Open security-labeled issues: $SECURITY_ISSUES"

echo ""
echo "--- Package Files ---"
gh api "repos/$REPO/contents" --jq '.[].name' 2>/dev/null | grep -E "package\.json|requirements\.txt|pyproject\.toml|Cargo\.toml|go\.mod|Gemfile" || echo "No standard package files in root"

echo ""
echo "=== Recon Complete ==="
