---
name: mcaf-ui-ux
description: "Define or refine UI engineering guidance, design-system handoff, accessibility, and frontend technology decisions. Use for concrete UI delivery or design-policy changes."
metadata:
  compatibility: "Requires repository access when UI docs, component guidance, or design system rules live in the repo."
---

# MCAF: UI/UX

Read root/local `AGENTS.md`, supplied designs, existing components/tokens, target devices, and the user flows involved.

## Workflow

1. Preserve the requested design and accepted product behavior. Use the established stack and design system; new architecture or dependencies need approval.
2. Make interactions, loading/empty/error states, keyboard navigation, semantics, labels, contrast, and responsive behavior explicit where the flow needs them.
3. Connect design choices to implementable components and acceptance criteria. Avoid ad hoc variants or speculative navigation/product changes.
4. Review the complete affected UI and tests before verification. For visible changes, inspect rendered behavior at the relevant viewports; source/CSS checks do not prove layout.
5. Report the UI or policy changes, rendered evidence where applicable, and remaining usability/accessibility gaps.

## References

- For design handoff and component consistency: [UI engineering](references/ui-ux.md).
- Only when choosing technology: [selection criteria](references/recommended-technologies.md); verify current support from official sources.
