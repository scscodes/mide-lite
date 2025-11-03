---
name: security-threat-assessment
description: Multi-agent security analysis with parallel threat modeling
tags: [workflows, security, threat-modeling, parallel]
---

# Security Threat Assessment

Comprehensive multi-agent security analysis with parallel threat modeling across all system layers.

Use contracts: `.mide-lite/contracts/StepOutput.schema.json` (per step) and `.mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

## Overview

This workflow conducts a thorough security assessment by analyzing threats from multiple perspectives simultaneously, providing comprehensive coverage of potential security risks.

## When to Use

- Regular security audits
- Before major releases
- After security incidents
- Compliance requirements
- New feature security review

## Threat Analysis Perspectives

### External Threats (Security Specialist)
- Attack surface analysis
- External vulnerability scanning
- Threat intelligence assessment
- Public exposure evaluation

### Internal Threats (Security Specialist)
- Insider threat assessment
- Access control review
- Privilege escalation analysis
- Internal network security

### Code Vulnerabilities (Debugger)
- Static code analysis
- Common vulnerability patterns
- Input validation issues
- Authentication/authorization flaws

### Infrastructure Security (DevOps Engineer)
- Server hardening review
- Network security configuration
- Deployment security practices
- Monitoring and logging

### Data Protection (Security Specialist)
- Data classification review
- Privacy compliance assessment
- Encryption implementation
- Data retention policies

## Expected Outcomes

- **Threat Landscape**: Comprehensive map of potential threats
- **Vulnerability Inventory**: Prioritized list of security issues
- **Risk Assessment**: Risk levels and impact analysis
- **Mitigation Roadmap**: Actionable security improvements
- **Compliance Status**: Regulatory compliance assessment

## Phases

- external-threats (security-specialist) → StepOutputContract
- internal-threats (security-specialist) → StepOutputContract
- code-vulnerabilities (debugger) → StepOutputContract
- infrastructure-security (devops-engineer) → StepOutputContract
- data-protection (security-specialist) → StepOutputContract
- threat-synthesis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
