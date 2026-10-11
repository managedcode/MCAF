# Active Security Testing Boundaries

A baseline code review does not authorize active scanning or attacks against a live system.

Before active testing, establish the authorized target/environment, allowed techniques, credentials, data restrictions, time/load limits, owner, and stop condition. Use an isolated test or sandbox environment where practical.

- Keep WAFs, rate limits, and other protections enabled unless the system owner explicitly approves a scoped change. A test request alone does not authorize disabling them.
- Do not perform denial-of-service, destructive actions, credential phishing, or interactions with uninvolved users.
- Keep test data and credentials within the agreed boundary; do not expose customer data in evidence.
- Stop when the agreed limit is reached or unexpected service/data impact occurs, and report the concrete result.
- Coordinate reproducibility through the agreed environment/version rather than forbidding necessary incident fixes.
- Report findings and untested areas accurately. Technical review is not certification or approval to deploy.

These rules constrain an explicitly authorized active test; they do not add an approval step to ordinary read-only source inspection.
