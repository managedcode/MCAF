---
name: mcaf-nfr
description: "Capture or refine non-functional requirements such as accessibility, reliability, scalability, maintainability, performance, and compliance. Use when a feature or architecture change needs explicit quality attributes and trade-offs."
compatibility: "Requires repository access when NFRs are documented in feature docs, ADRs, or architecture docs."
---

# MCAF: Non-Functional Requirements

## Trigger On

- a feature or architecture change needs explicit quality attributes
- a team is using vague words like "fast", "reliable", or "secure" without measurable meaning
- docs, ADRs, and tests are out of sync on quality expectations

## Do Not Use For

- generic architecture or feature writing with no quality-attribute decision
- loading all NFR references at once

## Inputs

- the changed feature, boundary, or rollout path
- the quality attributes that materially affect it
- current docs, ADRs, tests, and ops expectations

## Workflow

1. Decide which quality attributes materially affect the change.
2. Turn vague goals into explicit requirements, constraints, or testable expectations.
3. Link NFRs to feature docs, ADRs, and verification when they affect design or rollout.
4. Use only the specific reference files that match the active quality attribute.

## Deliver

- explicit NFRs for the changed area
- docs or ADRs that describe measurable quality attributes
- better alignment between architecture, testing, and operations

## Validate

- each chosen NFR is measurable or at least falsifiable
- the selected attributes are the ones that actually drive design trade-offs
- verification and operational expectations are linked where needed

## Load References

- pick only the exact file for the active NFR: accessibility, reliability, performance, scalability, compliance, maintainability, and so on

## Example Requests

- "Make the non-functional requirements explicit for this feature."
- "Turn vague reliability goals into real constraints."
- "Document performance and compliance expectations for this service."
