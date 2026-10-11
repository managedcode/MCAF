# ML Feasibility

Use feasibility work to answer whether the available data and operating constraints can support the accepted product outcome. Do not assume ML is necessary or prescribe a universal study duration.

## Define the Decision

- Product outcome, affected users, cost of incorrect output, and measurable success.
- Simpler rules/manual/non-ML baseline and why a model might improve it.
- Unknowns, evidence needed, allowed data/environment, budget, and exit condition.

## Inspect Data and Context

- Sources, permissions, retention, ownership, lineage, and representative production coverage.
- Label availability/quality or evaluation method when labels do not exist.
- Missingness, imbalance, outliers, feature/label distributions, joins, and leakage risks.
- Time/entity-aware splits when random splitting would leak information.
- Integration constraints: input/output contract, latency, cost, compute, and operational ownership.
- Harm, privacy, bias, uncertainty, and human-review requirements.

Use [data exploration](data-exploration.md) for unresolved data questions and [responsible AI](responsible-ai.md) for relevant harm analysis.

## Experiments

Start with a justified baseline and hypotheses. Record dataset/split versions, transforms, parameters, environment, evaluation code, results, limitations, and the next concrete question. Compare candidates on the same meaningful evaluation conditions.

Exploration may be lighter than production delivery, but must not silently waive repository gates for shipped code. Keep experimental artifacts and readiness claims explicit.

## Outcome

Recommend proceed, obtain specific missing evidence, or reconsider the approach. Explain the supporting results, unresolved limitations, integration assets, cost/risk, and required next decision. Changing the accepted product scope or architecture needs user approval.
