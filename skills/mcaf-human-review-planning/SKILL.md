---
name: mcaf-human-review-planning
description: "Plan a human review for a large AI-generated code drop by tracing the natural user and system flows, identifying the riskiest boundaries, and prioritizing the files a human should inspect first. Use when the codebase is too large to review line-by-line and you need a practical review sequence plus a prioritized file list."
compatibility: "Requires repository read access; may write a `HUMAN_REVIEW_PLAN.md` file under docs when the user asks for a saved review plan."
---

# MCAF: Human Review Planning

## Trigger On

- a large AI-generated code drop needs a human review plan
- the reviewer cannot inspect every line and needs prioritization
- the user asks which files are highest risk before doing manual review

## Do Not Use For

- normal small pull-request review
- automated bug finding without creating a human review sequence

## Inputs

- the target folder, feature area, or bounded context under review
- the main user journeys or operational flows involved
- any known architecture context, adjacent entities, or existing system rules

## Workflow

1. Map the natural flow of operations first:
   - sign up or authentication
   - create
   - update
   - register or configure
   - execute primary business action
   - complete, archive, or finalize
2. Use that flow to derive the most efficient human review sequence.
3. Identify high-risk review zones:
   - entry points and orchestration layers
   - persistence and state transitions
   - cross-boundary integrations
   - permissions, validation, and invariants
   - side effects such as email, payments, jobs, or notifications
4. Produce two separate outputs:
   - prioritized review flow
   - prioritized files or modules to inspect
5. If the user asks for a durable artifact, save the plan to `docs/<area>/HUMAN_REVIEW_PLAN.md`.

## Deliver

- a prioritized human review sequence
- a prioritized list of files or modules to inspect first
- a saved `HUMAN_REVIEW_PLAN.md` when requested

## Validate

- the review order follows actual user or system flows
- high-risk files are explained, not only listed
- the plan helps a human skip low-value line-by-line review
- the saved plan is readable without extra chat context

## Load References

- read `references/review-plan-format.md` for the output shape
- read `references/risk-signals.md` when deciding what deserves human attention first

## Example Requests

- "Plan a human review for this 40K-line AI-generated feature."
- "I cannot review every file. Tell me what to inspect first."
- "Trace the signup-to-completion flow and save a HUMAN_REVIEW_PLAN.md."
