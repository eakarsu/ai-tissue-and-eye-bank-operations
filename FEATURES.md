# Tissue and Eye Bank Operations

Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage.

## Implemented records

- **Tissue Bank Program**: name, facility, registration Number, coordinator, reporting Start, reporting End, status.
- **Tissue Donor**: name, donor Code, recovered At, consent Evidence, eligibility Evidence, status.
- **Tissue Recovery**: title, tissue Type, quantity, recovered At, recovery Team, status.
- **Tissue Lot**: title, lot Number, tissue Type, processed At, storage Location, status.
- **Tissue Processing**: title, process Name, performed At, operator, evidence, status.
- **Tissue Test**: title, sampled At, test Name, result Text, laboratory, evidence, status.
- **Quarantine Review**: title, reviewed At, reviewer, disposition, rationale, status.
- **Tissue Distribution**: title, shipped At, recipient, quantity, receipt, status.
- **Tissue Adverse Event**: title, observed At, description, investigator, response, status.
- **Operational Task**: title, owner, priority, start At, due At, done, notes, status.
- **Rule Version**: title, jurisdiction, version, effective At, expires At, source Url, requirement Text, status.
- **Document Requirement**: title, category, required By, source Reference, evidence Reference, review Notes, status.

## AI workflows

- Consent record extraction: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Eligibility evidence gaps: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Processing packet comparison: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Quarantine review preparation: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Distribution traceability review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Adverse event chronology: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Evidence completeness review: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.
- Operations handoff draft: source-linked draft, saved history, three real AI input suggestion styles and three complete fictional examples.

## Calculations

- Tissue lot downstream trace: Walk declared donor/lot/distribution relationships to list potentially affected downstream records. No recall notices are sent.
- Tissue Bank Program evidence checklist: Check source presence against an explicitly supplied document list; reviewer assesses adequacy.
- Operational deadline queue: Compute overdue items from entered dates and completed flags; no external notifications.

## Workspace features

Role-based login and account management; validated create/edit/delete; required parent and sibling relationships; search and pagination; atomic JSON imports; CSV/JSON exports; optimistic concurrency; two independent human reviews; immutable source-text uploads with independent review; dated task calendar; aggregate reports; searchable audit trail; model catalog and administrator AI settings; configured HTTPS connectors with approval, idempotency and receipt checks.

## Integration boundaries

A finite working scope, not every conceivable feature. No production regulator, insurer, carrier, court, university or clinical integration is preconfigured. Source uploads support text/CSV/JSON/Markdown, not OCR/PDF parsing. AI produces drafts and cannot authorize clinical handling, adjudicate rights, select recipients or jurors, establish eligibility, certify regulatory compliance or send submissions. Live external execution requires a configured adapter and independent human approval of the current record. Calculations use supplied rules and units; example rules are fictional.
