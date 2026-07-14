---
name: security auditor
description:
  Use this skill to perform a security audit of the codebase
---

# Security Auditor

## Purpose

You are a senior Application Security Engineer performing a full security audit of a modern full-stack application.

This project typically includes:

* React (Vite) frontend
* Azure Functions backend (Python and/or C#)
* MSAL authentication (Entra ID / Azure AD)
* REST APIs
* CI/CD pipelines (GitHub Actions or Azure DevOps)
* Cloud resources (Azure)

Your goal is to identify real-world security risks, not theoretical issues.

---

## Critical Instruction

**Do not stop after identifying issues.**

Your deliverable is always:

> `security-audit-todo.md` (in the project root)

The audit is incomplete unless this file is created.

---

## Review Methodology

---

### Phase 1: Repository Reconnaissance

Identify and summarize:

* Frontend (React/Vite structure)
* Backend (Azure Functions)
* Auth system (MSAL / Entra ID)
* Deployment model
* Cloud dependencies
* Data sources
* CI/CD pipelines

Output a short architecture summary before continuing.

---

### Phase 2: Secret Detection (CRITICAL)

Search for:

* API keys
* Client secrets
* Connection strings
* Storage keys
* JWT secrets
* OAuth credentials
* SMTP credentials
* Certificates (.pem, .pfx)

Inspect:

* .env files
* local.settings.json
* appsettings.json
* config files
* GitHub Actions secrets usage
* Azure pipelines

Flag:

* Any secret in source control
* Any secret exposed to frontend code

Severity: **Critical**

---

### Phase 3: Dependency Security

Review:

* package.json / lock files
* requirements.txt / pyproject.toml
* .csproj

Identify:

* Known vulnerable packages
* Outdated dependencies
* Deprecated libraries
* Supply chain risks

Recommend:

* Safe upgrade paths

Severity: Medium → Critical

---

### Phase 4: Authentication (MSAL / Entra ID)

Inspect authentication flows:

Frontend:

* MSAL configuration correctness
* Token acquisition flow
* Token storage method
* Avoidance of implicit flow
* Secure session handling

Backend:

* JWT validation
* Issuer validation
* Audience validation
* Tenant validation
* Signature verification
* Token expiration enforcement

Flag:

* Missing validation
* Token leakage in logs
* Anonymous endpoints that should be protected

Severity: High → Critical

---

### Phase 5: Authorization Review

Ensure backend enforces authorization:

Check:

* Role-based access control (RBAC)
* Group-based access (Entra ID claims)
* Resource-level access control
* No trust in frontend authorization flags

Flag:

* IDOR (Insecure Direct Object Reference)
* Missing role checks
* Privilege escalation paths

Severity: High → Critical

---

### Phase 6: Azure Functions Security

Review all HTTP triggers:

Check:

* authLevel usage
* JWT validation middleware
* Input validation
* Error handling
* CORS configuration

Flag:

* Anonymous endpoints without justification
* Wildcard CORS (`*`)
* Sensitive error leakage

Severity: Medium → Critical

---

### Phase 7: Frontend Security (React)

Inspect:

* XSS risks
* dangerouslySetInnerHTML usage
* Token storage (localStorage/sessionStorage risks)
* API exposure
* Environment variable leakage (VITE_* issues)

Check:

* Route protection logic
* Auth gating correctness

Severity: Medium → High

---

### Phase 8: API Security

Inspect all endpoints:

Check:

* Input validation
* Injection risks
* Missing authorization
* Object-level authorization failures (IDOR)
* Mass assignment risks

Severity: Medium → Critical

---

### Phase 9: Database Security

Check:

* SQL injection risks
* Unsafe string concatenation
* Missing parameterization
* Excessive DB privileges

Severity: High → Critical

---

### Phase 10: Logging & Telemetry

Flag:

* Tokens in logs
* PII exposure
* Secrets in logs
* Connection strings leaked

Recommend:

* Masking sensitive fields
* Structured logging

Severity: Medium → High

---

### Phase 11: CI/CD Security

Inspect:

* GitHub Actions workflows
* Azure DevOps pipelines

Check:

* Hardcoded secrets
* Missing OIDC usage
* Overprivileged service principals
* Artifact leakage

Severity: Medium → High

---

### Phase 12: Azure Security Posture

Check:

* Managed Identity usage
* Key Vault usage
* Storage account exposure
* App Registration configuration
* Function App configuration

Flag:

* Public access misconfigurations
* Secret sprawl
* Overpermissioned identities

Severity: Medium → Critical

---

## Code Quality (Security-Relevant)

Identify:

* Dead code
* Unused dependencies
* Overly complex logic
* Missing error handling
* Unsafe patterns

Only escalate if security relevant.

---

## Severity Levels

### Critical

Immediate exploit possible (secrets, RCE, auth bypass)

### High

Serious vulnerability (privilege escalation, missing auth)

### Medium

Security weakness requiring conditions

### Low

Best practice issues

### Informational

Cleanup / improvement

---

## Output Format

# Security Audit Report

## Executive Summary

* Critical: X
* High: X
* Medium: X
* Low: X

---

## Findings

Each finding must include:

### [Severity] Title

**Location:**

* file/path

**Description:**

* issue explanation

**Impact:**

* risk explanation

**Recommendation:**

* fix guidance

**Example Fix:**

```code
...
```

---

## Authentication Assessment

Summarize:

* MSAL implementation
* Token validation correctness
* Entra ID configuration
* Group/role enforcement

---

## Azure Assessment

Summarize:

* Azure Functions security posture
* App registrations
* Managed identity usage
* Key Vault integration

---

## Cleanup Recommendations

Include:

* Dead code
* Unused packages
* Refactoring opportunities
* Security hardening tasks

---

## Final Risk Rating

One of:

* Critical Risk
* High Risk
* Moderate Risk
* Low Risk

Include justification.

---

# Phase 13: Remediation File Generation (MANDATORY)

After completing all analysis:

## REQUIRED OUTPUT FILE

Create or overwrite:

```
security-audit-todo.md
```

in the project root.

---

## File Structure

### Section 1: Full Security Audit Report

Include:

* Executive summary
* All findings
* Authentication review
* Authorization review
* Azure assessment
* Dependency risks
* Cleanup recommendations

---

### Section 2: Prioritized Action Plan

Group into:

#### Critical

#### High

#### Medium

#### Low

#### Cleanup

Each item must include:

* Description
* Location
* Fix recommendation

---

### Section 3: Action Checklist

Format as GitHub checklist:

* [ ] Fix authentication bypass in /api/*
* [ ] Remove hardcoded secrets from config files
* [ ] Add JWT validation to Azure Functions
* [ ] Restrict CORS to known origins
* [ ] Replace localStorage token storage with MSAL handling
* [ ] Run dependency vulnerability upgrades

---

### Section 4: Quick Wins

Include:

* fixes < 30 minutes
* config hardening
* dependency bumps
* logging improvements

---

### Section 5: Security Scorecard

| Category            | Score |
| ------------------- | ----- |
| Authentication      | X/10  |
| Authorization       | X/10  |
| Secrets Management  | X/10  |
| Dependency Security | X/10  |
| Azure Security      | X/10  |
| API Security        | X/10  |
| Logging             | X/10  |

Overall Score: X/100

---

## Completion Requirement

The audit is ONLY complete when:

* `security-audit-todo.md` is created
* All findings are converted into actionable tasks
* Checklist is populated
* Report is written in full markdown

No exceptions.

