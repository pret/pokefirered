---
applyTo: "**/*.{c,h,s,inc,json,md,py,ps1,mk}"
description: "Prevent documentation and comment drift"
---
# Documentation Drift Guardrails

When making or reviewing changes, keep code, comments, and docs synchronized.

## Required Checks
- Compare behavioral claims in documentation against the current implementation before finalizing.
- If behavior changed, update the nearest canonical docs in the same change.
- Do not finalize work while known documentation drift remains.
- Ensure comments describe what the code currently does, not legacy behavior.

## Comment Quality Rules
- Prefer concise, factual comments that explain intent or non-obvious logic.
- Remove stale comments that contradict code.
- Avoid vague comments like "fix later" without context.
- Optimize comments for a vibe-coded style: useful to the AI while also being clear to a human reader who may not be familiar with the codebase or even the programming language used, but generally knowledgable about programming concepts and software development best practices.

## Documentation Scope
- Prioritize updating the most user-facing source of truth first (README, docs guides, feature specs).
- Include concrete values and formulas exactly as implemented.
- If numeric tuning exists in code constants, confirm docs use matching values.

## Pull Request Hygiene
- In summaries or review notes, call out any documentation updates made.
- If no doc update was needed, state why the change is docs-neutral.

## Enforcement
- This instruction applies to all repository changes, not only documentation edits.
- Treat documentation drift as a blocking issue that must be resolved before completion.
