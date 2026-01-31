# Known Entities Reference

Trusted organizations and authors for author trust scoring.

## Tier 1: First-Party / Verified Organizations

Auto-PASS on author trust dimension (still scan code):

| Entity | Type | Notes |
|--------|------|-------|
| anthropics | Organization | Claude/Anthropic official |
| google | Organization | Google official |
| microsoft | Organization | Microsoft official |
| github | Organization | GitHub official |
| openai | Organization | OpenAI official |
| vercel | Organization | Vercel official |
| meta | Organization | Meta/Facebook official |

## Tier 2: Established Open Source Authors

High trust, reduce author scrutiny:

| Entity | Type | Known For |
|--------|------|-----------|
| karpathy | Individual | AI researcher, Tesla, OpenAI |
| sindresorhus | Individual | npm ecosystem maintainer |
| tj | Individual | Express.js, Koa |
| kentcdodds | Individual | Testing Library, React |
| dan_abramov | Individual | Redux, React core |
| steipete | Individual | iOS/Mac developer tools |
| yyx990803 | Individual | Vue.js creator |

## Tier 3: Recognized Community Projects

Established projects with community governance:

| Project | Notes |
|---------|-------|
| lodash | Utility library |
| moment | Date library (now legacy) |
| axios | HTTP client |
| prettier | Code formatter |
| eslint | Linter |

## Red Flag Indicators

### Account Age
- < 30 days: HIGH scrutiny
- 30-90 days: MEDIUM scrutiny
- > 1 year: Normal scrutiny

### Star Patterns
- High stars + new account: Suspicious (star-buying)
- High stars + few contributors: Verify authenticity
- Zero stars + active commits: Legitimate new project

### Contributor Patterns
- Single contributor: Higher code review scrutiny
- Many contributors + active issues: Healthy project
- No issues allowed: Why? (red flag)

## Verification Steps

When an author claims affiliation:
1. Check if username matches known handles
2. Verify org membership via `gh api orgs/{org}/members`
3. Cross-reference with official docs/websites
4. Check commit signing if available

## Notes on Forks

- Fork of trusted repo: Check diff from original
- Fork with minimal changes: Usually safe
- Fork with significant additions: Full review needed
