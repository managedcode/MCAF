# Runtime Exception Handling

This reference concerns runtime errors. For maintainability-policy exceptions, use [limits and exceptions](limits-and-exceptions.md).

## Inspect the Failure Contract

- Distinguish invalid input, authorization rejection, domain failure, cancellation, and infrastructure faults.
- Preserve the established caller-visible error contract and state invariants.
- Catch at a boundary that can recover, translate, or add useful context; do not swallow failures.
- Preserve diagnostic cause/stack information and release resources reliably.
- Retry only an understood transient and safely repeatable operation.
- Exclude secrets, sensitive data, and internal stack details from public responses.

Use a custom exception only when callers need a distinct semantic type or structured context. Do not create a speculative platform/domain hierarchy.

For HTTP error formats, preserve the accepted API contract. [RFC 9457 Problem Details](https://www.rfc-editor.org/rfc/rfc9457.html) supersedes RFC 7807; adopting or changing that public format still needs approval. For ASP.NET Core behavior, consult [official error handling](https://learn.microsoft.com/en-us/aspnet/core/fundamentals/error-handling) for the repository's framework version.

Review success and failure paths and meaningful regression tests before planned verification.


