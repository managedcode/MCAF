---
name: mcaf-human-review-planning
description: "Plan a human review for a large AI-generated code drop by reading the target area, tracing the natural user and system flows, identifying the riskiest boundaries, and prioritizing the files a human should inspect first. Use when the codebase is too large to review line-by-line and you need a practical review sequence plus a prioritized file list."
compatibility: "Requires repository read access; may write a `HUMAN_REVIEW_PLAN.md` file under docs, or to an exact docs path the user specifies, when the user asks for a saved review plan."
---

# MCAF: Human Review Planning

## Trigger On

- a large AI-generated code drop needs a human review plan
- the reviewer cannot inspect every line and needs prioritization
- the user asks which files are highest risk before doing manual review
- the user names a generated folder and wants a saved review plan for it

## Do Not Use For

- normal small pull-request review
- automated bug finding without creating a human review sequence

## Inputs

- the target folder, feature area, or bounded context under review
- the main user journeys or operational flows involved
- any known architecture context, adjacent entities, or existing system rules
- any exact output path the user wants for the saved plan

## Workflow

1. Read enough of the target area and its immediate boundaries to understand the generated code before planning review.
2. Map the natural flow of operations first:
   - sign up or authentication
   - create
   - update
   - register or configure
   - execute primary business action
   - complete, archive, or finalize
3. Use that flow to derive the most efficient human review sequence.
4. Use the reviewer's domain knowledge as a force multiplier:
   - compare the generated code against known architecture and existing entities
   - look for places where the new feature should behave like nearby existing flows
   - prioritize boundaries where generated code may drift from established system rules
5. Identify high-risk review zones:
   - entry points and orchestration layers
   - persistence and state transitions
   - cross-boundary integrations
   - permissions, validation, and invariants
   - side effects such as email, payments, jobs, or notifications
6. Produce two separate outputs:
   - prioritized review flow
   - prioritized files or modules to inspect
7. Present both outputs in chat.
8. If the user asks for a durable artifact, save the plan to the exact docs path they requested; otherwise use `docs/<area>/HUMAN_REVIEW_PLAN.md`.

## Deliver

- a prioritized human review sequence
- a prioritized list of files or modules to inspect first
- both sections presented separately in chat
- a saved `HUMAN_REVIEW_PLAN.md` when requested

## Validate

- the plan is grounded in actual code reading, not only the folder names
- the review order follows actual user or system flows
- high-risk files are explained, not only listed
- priorities account for likely mismatch against existing architecture or analogous entities
- the plan helps a human skip low-value line-by-line review
- the saved plan is readable without extra chat context

## Load References

- read `references/review-plan-format.md` for the output shape
- read `references/risk-signals.md` when deciding what deserves human attention first

## Example Requests

- "Plan a human review for this 40K-line AI-generated feature."
- "I cannot review every file. Tell me what to inspect first."
- "Trace the signup-to-completion flow and save a HUMAN_REVIEW_PLAN.md."
- "Look through the generated folder, give me two separate prioritized review lists, and save them under docs for this area."
