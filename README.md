# Figuring Out AI (As a Non-Technical Person)

## Introduction

I've created this repo as a place where I can document my journey to figure out how to build an AI OS that actually works the way I'd want. The goal being to hopefully learn from the experience of others so that I'm not learning so many damned lessons the hard way, and to hopefully create along the way a resource that others find similarly useful. 

Think of it as a sort of open-source AI Operating System-focussed blog/community/tool stack.

## Why an AI Operating System, specifically?

As a non-technical person, the possibility of being able to talk to an AI and have it create or do whatever I can imagine feels like a real-life superpower. So far, Claude Code has been the first AI tool I've used that's felt like a genuine (if still flawed) general pupose AI agent. As a result, I've now spent hundreds of hours in Claude Code working on projects, creating and editing documents, automating workflows, manipulating data, and asking it boatloads of questions. Sometimes I get amazing results, and other times I end up spending more time trying and failing to get it to do what I want than it would have taken me to just do the thing manually in the first place. (aka lots of excitement + occasional moments where I want to pull my hair out)

That said, despite being a fairly early adopter and heavy user of AI tech, and despite hearing

The past few months I've been hearing lots of chatter about building 'AI Operating Systems' using Claude Code that give people the kind of superpowers that got me excited about AI in the first place. In fact, it's because of how darn excited I am about this, and how big a deal I think it is, that I've created this blog to help guide my adoption of the tech.

So why haven't I done it yet?

Before I explain my concerns, or how I'm thinking through my next steps here, let me attempt to define what an AI OS (imo) even is.

## What is an 'AI OS'?

Think 'talking to ChatGPT', except in addition to it's training data, it has access to all the proprietary context that a human employee would have access to with which to do high quality work, and is able to do just about anything a human can do with a computer (at least, that's the vision, and where I believe the tech is headed).

My back of napkin definition: An AI OS is a system where AI has native access to all the relevant context, tools, and skills it needs to complete the kinds of projects, tasks, and activities on a computer that a human might otherwise be able to do. 

For example, this might include answering user questions, automating and executing workflows, and manipulating data and artifacts, coaching and mentoring, etc. Though in practice, current AI models aren't set up for success to do all (arguably, most) of the work a human might be capable of doing, and so whether something's an AI OS has less to do with the volume or types of tasks it's given, or the quality at which it's able to complete them (who said every OS has to be a 'good' OS?), and more to do with the context, tools, and skills it has access to. I.e. when we ask it to get things done, it can attempt the job without much if any manual configuration (and in the perfect world, it rocks it).

Described another way, an AI OS is what I imagine when I think of 'AI-native company operations' - for example what [Victor Sowers](https://www.linkedin.com/in/victorsowers/) describes as [The Knowledge Pyramid That Unlocks Agentic Growth](https://www.linkedin.com/pulse/knowledge-pyramid-unlocks-agentic-growth-victor-sowers-qxoje/); his [Newsletter Automation Workflow](https://www.linkedin.com/posts/victorsowers_automating-newsletters-activity-7414329242412576768-FyRw?utm_source=share&utm_medium=member_desktop&rcm=ACoAAASWCnsBqOvOFPero66gJ5RiBUTSWxkmQog) being an example of the kinds of capabilities an AI OS might enable. It's also what I imagine when [Jacob Dietle](https://www.linkedin.com/in/jacob-dietle/) [talks about building a Context OS](https://jacobdietle.substack.com/), or [Jordan Crawford](https://www.linkedin.com/in/jordancrawford/) talks about having a goal of running 100% of his business by voice.

It's also what I imagine when people say they've built an automated system for AI to manage their inbox and calendar and be their executive coach and help them out with daily questions and activities and generally speaking just get things done for them. For example, It's what I'm imagining [Alex Finn](https://x.com/AlexFinn) potentially has when he describes his [OpenClaw (prev. Clawdbot) implementation](https://x.com/AlexFinn/status/2016963034246500437?s=20). And how well do the best of these systems actually work in practice? That's part of what I'm trying to figure out.

Hopefully that gives people a sense of what I'm talking about when I say 'AI OS'. If it's still not clear, encourage you to browse the content of some of the people I shared. And for the folks who have a better way of framing all this, I'd love to learn from you.

## So why haven't I built an AI OS, yet?

A few reasons for this, but one of the big ones has been my uncertainty about whether the benefits I'd get from implementing an AI OS will really outweight the opportunity cost of building and maintaining it (appreciate that this calculation will change person by person, and team by team). This is especially the case when I think of the effort, complexity, unknown unknowns, and "march of 9s" that I've experienced with many of the other agentic AI projects I've worked on.

That said, the decision I'm trying to make here is less about whether I'll adopt an AI OS in general (I'm sold on this being the future to a substantial degree), and more about understanding how to scope and sequence and time the project. The alternative for me being to keep doing what I have been - which is using AI (in particular, Claude Code) on a project by project, task by task, and micro workflow by micro workflow basis - until the tech improves enough to make it worth the effort (which I suspect could be 2 months, or 12 months out).

## Building an AI OS with eyes wide open

I'd love nothing more than to implement an epic AI OS that torques my productivity - I just need to build my confidence in whether it's the right decision at this time. And I know many others feel the same.

That said, I'm publishing my top AI OS questions and concerns in the hopes of accomplishing two things:

1. Hopefully folks find the document useful when evaluating their own AI adoption priorities and timelines (aka learn from my mistakes + and the questions I wish I'd asked earlier).
2. Crowdsource some quality answers to the questions I and many others are grappling with.

The measure of success: Can I help myself and others make better decisions here more quickly

---

## What's in This Repo

### Documents

- **[AI OS Questions](aios-questions.md)** — My most pressing questions and concerns about implementing an AI OS
  - [Join the discussion](https://github.com/Cob-AI/figuring-out-ai/discussions/1)
- [Guide to Building with AI (as a Non-Developer) - August 1, 2025](https://open.substack.com/pub/therevenueleadershippodcast/p/ai-digest-guest-post?utm_campaign=post-expanded-share&utm_medium=web)

### Skills (for Claude Code)

- **[Repo Security Review](skills/repo-security-review/)** — Review GitHub repos for security risks before installing them. Designed for non-technical users who want to safely explore open-source AI tools without blindly trusting code they can't read. *Note: I'm not a security engineer. Rely on this skill at your own risk.*

---

## How to Participate

If you'd like to participate in the discussion, or just follow along:

1. **Star this repo** to follow updates
2. **Head to the [AI OS Questions Discussion](https://github.com/Cob-AI/figuring-out-ai/discussions/1)** to share your experiences or answer questions
3. **Have a document you'd like to add?** Open a PR or start a discussion

---

## Credits

Shoutout to a few of the people whose content has shaped my thinking on this:
- [Victor Sowers](https://www.linkedin.com/in/victorsowers/)
- [Jacob Dietle](https://www.linkedin.com/in/jacob-dietle/)
- [Jordan Crawford](https://www.linkedin.com/in/jordancrawford/)
- [Alex Finn](https://x.com/AlexFinn)
