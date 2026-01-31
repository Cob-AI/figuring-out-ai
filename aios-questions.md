# AI Operating System (AI OS) - Questions and Concerns

## ICP / Fit

What's the most efficient way that a team or company might disqualify themselves as a fit for an AI OS?

Would volume of sales activity, product-market-fit, team size, tech stack, or industry be potential disqualification filters? What about team capacity or technical expertise?

**Scenarios:**
- What about if the founder is involved in virtually every sales call?
- What if it's a 50 or 500 or 5000 person org?
- What if it's a services business? What are the implications for client or contractor collaboration?

What are some examples of AI OS' that work well that **aren't** markdown and git-based? (note: so far, just about all the buzz I've heard has been around markdown and git-centred AI OS', so the questions and concerns in this guide are heavily influenced by this model)

---

## Tool Stack and File Types

**Questions:**
- AI OS considerations for MS vs Google shops?
- Recommended tools to use/avoid? (e.g. email management, calendar management, call recording and management, marketing suite, CRM, versioning/backup, database, etc.)
- When to use: Doc vs Notion vs markdown? Excel vs markdown vs database? What are the implications of trying to plug the AI OS into each of these filetypes?
- How are specialty file types handled? (Images, PDFs, Audio, Video, CAD files for engineering/construction/design)

---

## Understanding Trade-offs

- How to think about the balance between human vs AI ease of use, ease of live and async collaboration, and observability/auditability?
- How does the answer to this question vary if we're talking read vs edit vs 'create new doc', or if we change the type of work (e.g. working with spreadsheet style data vs meeting minutes vs company positioning docs), or depending on workflow?
- How to balance giving the AI OS powerful capabilities (e.g. widespread tool use; broad approvals) while protecting the company from prompt injection attacks, or poor AI judgement? 

**For example:**
- I want AI to reliably find the information it needs (e.g. markdown files with YAML frontmatter and structured JSON objects seems to be the recommended way to do this), but worry about a drop in the quality and productivity of the human-driven work if we turned our working documents into markdown files.
- I'm extremely concerned about having AI work on existing spreadsheets because of the difficulty in catching errors; but I'm also extremely concerned about turning spreadsheets into markdown and losing the UI that allows humans to quickly interpret the data, manipulate the data, update the data, and spot issues, etc.
- A lot of important context tends to be found in email inboxes, but email inboxes seem to be a common vector for prompt injection attacks.

---

## Memory / Learning / Execution Considerations

- "Every human/AI edit compounds" → What's the recommended mechanism to log these learnings? And have them be retrieved/integrated into the go-forward system? In particular, without filling folders/the database with low value context, and crowding out the high value context?
- I've found that sometimes Claude Code listens to my instructions, and sometimes it just really doesn't want to (e.g. it kept insisting on taking accessibility screenshots of a webpage despite very clear instructions to the contrary). I'm concerned about the risk of building a system where accuracy and quality are important, and where the system generates tons of content that may be difficult to reliably quality control (whether for technical or practical reasons)
- I'm also often surprised by the kinds of tasks AI reliably excels at, the ones where it's consistently struggled, and also the degree to which an otherwise reliable system has become unreliable post-compaction. 

Tl;dr: I'm just generally quite concerned about an AI OS' quality and reliability of execution.

---

## Security Considerations

- Prompt injection risk
- AI-driven "catastrophic deletions/overwrites"
- Indirect GTM concerns (e.g. how do government and large enterprises feel about their data being handled so intensively by LLMs behind the scenes)
- With respect to git versioning: To what degree can I be confident that AI will reliably commit to git every single time we might want it to?

---

## Setup and Maintenance

- What kind of expertise, time commitment, and/or budget tend to be required (rough orders of magnitude) for legacy startups, mid-market, and enterprise teams to implement and maintain/bug-fix these systems?
- What's the most efficient way to run experiments and stress-test/validate the system's fit? (I'm thinking minimum valuable experiments)
- What tend to be the slam dunk use cases/workflows?
- What principles or guidelines might someone follow to identify low-hanging-fruit AI use cases and workflows (and conversely, to proactively flag the poor fit ones)
- What tips/techniques/skills/tools are there for refactoring a company's data and knowledge architecture for AI-native operations? What are the common pitfalls with using AI to clean up folders/files/data? (e.g. I've learned the hard way to be wary of using generative AI for this directly, and that deterministic tools like AI-generated scripts are a safer bet)
- How feasible is it stress test the experience of using an AI OS in a production environment without putting real company files/data at risk?
- How narrow vs broad does the AI OS implementation need to be to generate the intended productivity gains?
- If my implementation is narrow, presumably that means I'm going to be having to spin up micro projects (and, micro repos) way more frequently. Things can get messy quickly. How do I manage all of this?
- How does the implementation and maintenance effort change if I'm running all, some, or none of the AI OS locally?
- Effort to come up with and maintain all the YAML/JSON objects (and any other connective tissue in the 'context graph')?
- Effort to transition my messy folders and docs to structured files with JSON objects?
- How do I systematically prevent AI output from cluttering my directories?
- What are the common missteps when implementing something like this? (Curious both from the perspective of a small 1-3 person team, midmarket, and enterprise)
- How robust/fragile is the context graph, typically?

---

## Quality

**Theoretical vs. Actual Quality**: In theory, AI can produce high-quality outputs. In practice, to what extent can we realistically manage the following risks (both at the file and directory levels):

- Important context getting missed
- Inaccurate context getting added
- Too much context leading to context/token bloat
- Small hard-to-detect edits being made—wording swaps (e.g. Victor Sower's example of key language being replaced with generic phrasing)

How to think about the potential impact and severity of these risks over the short and long term?

---

## Organizational Change Management

- When end users and management experience friction points, what's typically the reason?
- How does the complexity of the overall system change as you shift from a locally hosted OS, to a cloud system, to a system that requires enterprise-grade controls?
- If we build the AI OS, and later decide it's no longer suiting our needs, how challenging/expensive is it to revert to a more traditional operating system?

---

## Project Delivery

What's the best way to approach project workflows with a markdown-based, git hosted AI OS? For example:

- **PM workflows**: Task tracking, status updates, resource allocation, risk registers, lessons learned
- **Project team collaboration**: How does an AI OS work when team members have varying technical comfort levels?
- **Client-facing project work**: How do you work effectively with external stakeholders (clients, contractors) where ease of use and collaboration capabilities are important?
- **Cross-functional dependencies**: PM inherently involves coordinating across functions - what's the experience of using an AI OS when not everyone is "on the system"?

---

## Models / Tokens / Cost

- How much of the AI OS can be run using existing subscriptions (e.g. Claude Code, ChatGPT Codex, MS Copilot + Power Automate)?
- Is it recommended to use open source models? If so which ones, and how? (e.g. hosting, harness, etc.)
- What are the short, medium, and long term licensing and API cost considerations?
- How is it likely to impact cost of doing business for a start-up vs scale-up?
