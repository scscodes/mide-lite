---
name: parallel-testing-strategy
description: Multiple agents develop comprehensive testing strategy from different perspectives
tags: [workflows, testing, strategy, parallel, quality]
---

# Parallel Testing Strategy

Comprehensive testing strategy development with multiple agents working on different testing aspects simultaneously.

Use contracts: `.mide-lite/contracts/StepOutput.schema.json` (per step) and `.mide-lite/contracts/WorkflowOutput.schema.json` (final aggregation). Supervisor orchestrates.

## Overview

This workflow leverages multiple specialized agents to develop a comprehensive testing strategy from different perspectives, ensuring thorough test coverage and quality assurance.

## When to Use

- New feature development
- Major system changes
- Quality improvement initiatives
- Pre-release testing planning
- Testing framework updates

## Testing Perspectives

### Unit Testing (Implementer)
- Component-level testing
- Testable code design
- Mock and stub strategies
- Test automation

### Integration Testing (Architect)
- System integration points
- API testing strategies
- Database integration
- External service integration

### Security Testing (Security Specialist)
- Vulnerability testing
- Penetration testing
- Security compliance testing
- Authentication testing

### Performance Testing (Performance Engineer)
- Load testing strategies
- Stress testing scenarios
- Performance benchmarks
- Scalability testing

### User Testing (Documentation Specialist)
- User acceptance testing
- Usability testing
- User scenario testing
- End-to-end testing

## Expected Outcomes

- **Comprehensive Strategy**: All testing aspects covered
- **Test Coverage Analysis**: Gaps identified and addressed
- **Testing Roadmap**: Phased testing implementation plan
- **Quality Metrics**: Testing success criteria defined
- **Automation Strategy**: Test automation recommendations

## Phases

- unit-testing (implementer) → StepOutputContract
- integration-testing (architect) → StepOutputContract
- security-testing (security-specialist) → StepOutputContract
- performance-testing (performance-engineer) → StepOutputContract
- user-testing (documentation-specialist) → StepOutputContract
- testing-synthesis (supervisor) → StepOutputContract

Final: WorkflowOutputContract aggregating all step outputs.

 
