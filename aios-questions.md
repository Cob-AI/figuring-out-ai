# AI OS / Context Engineering Questions

## The Core Tensions I'm Trying to Resolve

1. **Human vs. Machine Usability**: How do I get a safe and productive AI OS without sacrificing the ease of use, collaboration capabilities, and observability/auditability that my colleagues and I are looking for?

2. **AI Efficiency Paradox**: AI can process and produce vastly more information than I can review. How do I maintain meaningful quality control when the volume of inputs/outputs exceeds my practical ability to audit them?

3. **"The March of Nines"**: How might I get a reliable sense of the level of effort and risk involved in implementing, maintaining, and getting value from an AI OS when the space of unknown unknowns is so vast? Which operators are in the thick of this and can share their experiences?

---

## ICP / Fit

What's the most efficient way that I might disqualify myself as a fit for an AI OS?

I wonder whether number of clients, volume of sales activity, product-market-fit, team size, tech stack, or industry might be effective disqualification filters?

What are the implications for human-to-human, AI-to-AI, and human-to-AI collaboration in these various scenarios?

**Examples:**
- What about if the founder is involved in virtually every sales call, anyway?
- What if it's a 50 or 500 or 5000 person org?
- What if it's a services business? What are the implications for client or contractor collaboration?
- How feasible is it really for a team or department at a mid-size or large MS or Google shop to implement and maintain an AI OS and have it work and be a positive experience for people?
- How do you implement a (relatively) safe, reliable AI OS if you use MS or Google as your productivity suite?

---

## Tool Stack

**Example categories:**
- Productivity suite (e.g. Google vs MS vs hybrid vs neither)
- Email
- Calendar management
- Call recording/management (e.g. Teams vs Google Meet vs Fireflies)
- Marketing suite (e.g. Hubspot vs …)
- CRM (e.g. Attio vs Coffee CRM vs Hubspot or Salesforce vs other)
- Versioning/backup (e.g. Google/MS cloud backup vs GitHub vs MS Azure DevOps)
- Database (e.g. markdown vs spreadsheets vs Postgres)
- Markdown vs docs
- Etc.

**Questions:**
- What tools are required vs nice to have?
- What popular tools just don't work and should be avoided?
- Are MS and Google productivity suites recommended? If so, is there a way for Claude Code to work effectively (read/write) with Google Workspace files? MS calendar/sharepoint/Teams/Planner/inbox/etc (e.g. via community MCP)?
- What tools work in theory, but are a pain to work with in practice (e.g. MS on any given day)?
- Which of these answers, if any, aren't particularly situation dependent?

---

## File Stack

- How much flex is there in terms of file types? (e.g. Google Doc vs docx vs markdown, or Google Sheets vs xlsx vs markdown)
- How are specialty file types handled? (Images, PDFs, Audio, Video, CAD files for engineering/construction/design)

---

## Understanding Trade-offs

- How to think about the balance between human vs AI ease of use, ease of live and async collaboration, and observability/auditability?
- How does the answer to this question vary if we're talking read vs edit vs 'create new doc', or if we change the type of work (e.g. working with spreadsheet style data vs meeting minutes vs company positioning docs), or workflow?

**For example:**
- I take extensive meeting notes, and often pull out subtle strategic insights that an LLM would not realistically think of
- My notes documents have very particular formatting and colour coding that help them scale across the client relationship, without losing their easy scanability, or the ability to quickly spot important context and action items (which I colour 'red'). How much of this would I have to give up if I transitioned to a markdown file system with git versioning? Do I even need to transition to a markdown file system?
- I'm extremely concerned about having AI work on existing spreadsheets because of the difficulty in catching errors; but I'm also extremely concerned about turning spreadsheets into markdown and losing the UI that allows humans to quickly interpret the data, manipulate the data, update the data, and spot issues, etc.

---

## Memory / Learning / Execution Considerations

- **"Every human/AI edit compounds"** → What's the recommended mechanism to log these learnings? And have them be retrieved/integrated into the go-forward system? In particular, without filling folders/the database with low value context, and crowding out the high value context?
- I've found that sometimes Claude Code listens to my instructions, and sometimes it just really doesn't want to (e.g. it kept insisting on taking accessibility screenshots of a webpage despite very clear instructions to the contrary). I'm concerned about the risk of building a system that generates tons of content that's difficult to verify (whether for technical or practical reasons) where accuracy and quality are important.
- I'm especially concerned about situations where it's hard to catch when the AI strays from the process or starts hallucinating
- I'm also often surprised by the kinds of tasks AI reliably excels at, the ones where it's consistently struggled, and also the degree to which an otherwise reliable system has become unreliable post-compaction. As a result, I'm just generally concerned about quality and reliability of execution.

---

## Security Considerations

- Prompt injection risk
- AI-driven "catastrophic deletions/overwrites"
- Indirect GTM concerns (e.g. how do government and large enterprises feel about their data being handled so intensively by LLMs behind the scenes)
- In the case of a git versioning system:
  - To what degree can I be confident that AI will reliably commit to git every single time we might want it to?
  - How do I structure my repo(s)?

---

## Setup and Maintenance

- What's the most efficient way to run experiments and stress-test/validate the model fit? (I'm thinking modular/minimum delightful development)
- How narrow vs broad does the AI OS implementation need to be to work effectively as intended?
- If my implementation is narrow, presumably that means I'm going to be having to spin up micro projects (and, micro repos) way more frequently. Things can get messy quickly. How do I manage all of this?
- How does the implementation and maintenance effort change if I'm running all, some, or none of the AI OS locally?
- Effort to come up with and maintain all the YAML/JSON objects?
- Effort to transition from messy folders and docs to structured docs with JSON objects?
- How do I systematically prevent AI output files from cluttering my directories?
- What are the common missteps when implementing something like this? (Curious both from the perspective of a small 1-3 person team, midmarket, and enterprise)
- What kind of expertise, time commitment, and/or budget are required to implement and maintain the system?

---

## Quality

**Theoretical vs. Actual Quality**: In theory, AI can produce high-quality outputs. In practice, to what extent can we realistically manage the following risks (both at the file and directory levels):

- Important context getting missed
- Inaccurate context getting added
- Too much context leading to context/token bloat
- Small hard-to-detect edits being made—wording swaps (e.g. Victor Sower's example of key language being replaced with generic phrasing)

How to think about the potential impact and severity of these risks over the short vs long term?

---

## Team Adoption

- How do you get a team to actually use this? What's the learning curve?
- What does resistance look like, and how do practitioners handle it?

---

## Exit Strategy / Portability

- If I build on this and it doesn't work out, how much of the learnings are transferable vs. sunk cost?

---

## Failure Modes

- What are the common frustration points when implementing and living with an AI OS?
- Where do things tend to work well? And what doesn't tend to work well?

---

## Time to Value

- How much time/cost/effort does it typically take to see meaningful returns vs. just being in "setup mode"?

---

## Project Management (PM) Workflows

What's the best way to approach project management workflows with an AI OS? For example:

- **PM workflows**: Task tracking, status updates, resource allocation, risk registers, lessons learned
- **Project team collaboration**: How does an AI OS work when team members have varying technical comfort levels?
- **Client-facing project work**: How do you work effectively with external stakeholders (clients, contractors) where ease of use and collaboration capabilities are important?
- **Cross-functional dependencies**: PM inherently involves coordinating across functions - what's the experience of using an AI OS when not everyone is "on the system"?

---

## Models / Tokens / Cost

- How much of the AI OS can be run using existing subscriptions (e.g. Claude Code, ChatGPT Codex)?
- Is it recommended to use open source models? If so which ones, and how? (e.g. hosting, harness, etc.)
- What are the short, medium, and long term licensing and API cost considerations?
- How is it likely to impact cost of doing business for a start-up (pre and post PMF)?
