# Scalability

Describe growth in workload and resources, then measure whether accepted service quality holds. Scaling does not require microservices, sharding, caching, or a cloud migration by default.

## Requirement Fields

- Workload shape: requests, concurrency, data volume, key distribution, and burst/steady duration.
- Resource model: fixed or scalable CPU, memory, storage, replicas, and cost limits.
- User/caller latency, throughput, error, and consistency thresholds.
- Saturation, queueing, backpressure, dependency limits, and recovery behavior.
- Test environment, measurement method, evidence, and owner.

Derive targets from product needs; arbitrary sample numbers are not requirements. Inspect the full affected path, measure representative load, and obtain approval before material architecture, state, dependency, or deployment changes.
