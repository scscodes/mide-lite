---
name: security
description: Cross-cutting application security rules
globs: []
alwaysApply: false
tags: [security]
---

# Security

## Inputs & Boundaries
- Validate and sanitize all external inputs; reject by default.
- Enforce timeouts and size limits on network/file inputs.
- Prefer allow-lists over deny-lists.

## Secrets & Identity
- Never log secrets/PII; redact at source; scope logs by trace IDs.
- Load secrets from environment/manager; never commit.
- Principle of least privilege for creds, network, FS.

## Output & Transport
- Encode at sink (HTML/URL/SQL params); avoid dynamic eval.
- Use TLS; set CSP/HSTS where applicable.

## Dependencies & Surface
- Pin/scan dependencies; patch promptly; remove unused.
- Avoid risky primitives: eval, Function constructor, unsafe deserialization.

## Storage & Keys
- Use parameterized queries; never string-concat SQL.
- Encrypt sensitive-at-rest where required; manage keys separately.

## When in Doubt
1. Reduce attack surface.
2. Fail closed; add explicit allow paths.
3. Prefer boring, audited solutions.

