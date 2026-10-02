export interface PageConfig {
  label: string;
  href: string;
  description: string;
  entities: string[];
  workflows: string[];
}

export interface EntityConfig {
  name: string;
  label: string;
  fields: Array<{ name: string; kind: "string" | "number" | "boolean" | "date" }>;
}

export interface WorkflowConfig {
  slug: string;
  title: string;
  description: string;
  prompt: string;
  fields: string[];
}

export const appConfig = {
  "slug": "ai-tissue-and-eye-bank-operations",
  "title": "Tissue and Eye Bank Operations",
  "tagline": "Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage.",
  "accent": "rose"
};
export const pages: PageConfig[] = [
  {
    "label": "Intake & registers",
    "href": "/registers",
    "description": "Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage.",
    "entities": [
      "TissueBankProgram",
      "TissueDonor",
      "TissueRecovery"
    ],
    "workflows": [
      "consent-record-extraction",
      "eligibility-evidence-gaps"
    ]
  },
  {
    "label": "Operational records",
    "href": "/workflow",
    "description": "Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage.",
    "entities": [
      "TissueLot",
      "TissueProcessing",
      "TissueTest"
    ],
    "workflows": [
      "processing-packet-comparison",
      "quarantine-review-preparation"
    ]
  },
  {
    "label": "Review & delivery",
    "href": "/delivery",
    "description": "Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage.",
    "entities": [
      "QuarantineReview",
      "TissueDistribution",
      "TissueAdverseEvent"
    ],
    "workflows": [
      "distribution-traceability-review",
      "adverse-event-chronology"
    ]
  },
  {
    "label": "Tasks & requirements",
    "href": "/operations",
    "description": "Assignments, versioned rules and document requirements.",
    "entities": [
      "OperationalTask",
      "RuleVersion",
      "DocumentRequirement"
    ],
    "workflows": [
      "evidence-completeness-review",
      "operations-handoff-draft"
    ]
  }
];
export const entities: Record<string, EntityConfig> = {
  "TissueBankProgram": {
    "name": "TissueBankProgram",
    "label": "Tissue Bank Program",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "facility",
        "kind": "string"
      },
      {
        "name": "registrationNumber",
        "kind": "string"
      },
      {
        "name": "coordinator",
        "kind": "string"
      },
      {
        "name": "reportingStart",
        "kind": "date"
      },
      {
        "name": "reportingEnd",
        "kind": "date"
      },
      {
        "name": "status",
        "kind": "string"
      }
    ]
  },
  "TissueDonor": {
    "name": "TissueDonor",
    "label": "Tissue Donor",
    "fields": [
      {
        "name": "name",
        "kind": "string"
      },
      {
        "name": "donorCode",
        "kind": "string"
      },
      {
        "name": "recoveredAt",
        "kind": "date"
      },
      {
        "name": "consentEvidence",
        "kind": "string"
      },
      {
        "name": "eligibilityEvidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "TissueRecovery": {
    "name": "TissueRecovery",
    "label": "Tissue Recovery",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "tissueDonorId",
        "kind": "string"
      },
      {
        "name": "tissueType",
        "kind": "string"
      },
      {
        "name": "quantity",
        "kind": "number"
      },
      {
        "name": "recoveredAt",
        "kind": "date"
      },
      {
        "name": "recoveryTeam",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "TissueLot": {
    "name": "TissueLot",
    "label": "Tissue Lot",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "tissueDonorId",
        "kind": "string"
      },
      {
        "name": "lotNumber",
        "kind": "string"
      },
      {
        "name": "tissueType",
        "kind": "string"
      },
      {
        "name": "processedAt",
        "kind": "date"
      },
      {
        "name": "storageLocation",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "TissueProcessing": {
    "name": "TissueProcessing",
    "label": "Tissue Processing",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "tissueLotId",
        "kind": "string"
      },
      {
        "name": "processName",
        "kind": "string"
      },
      {
        "name": "performedAt",
        "kind": "date"
      },
      {
        "name": "operator",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "TissueTest": {
    "name": "TissueTest",
    "label": "Tissue Test",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "tissueLotId",
        "kind": "string"
      },
      {
        "name": "sampledAt",
        "kind": "date"
      },
      {
        "name": "testName",
        "kind": "string"
      },
      {
        "name": "resultText",
        "kind": "string"
      },
      {
        "name": "laboratory",
        "kind": "string"
      },
      {
        "name": "evidence",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "QuarantineReview": {
    "name": "QuarantineReview",
    "label": "Quarantine Review",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "tissueLotId",
        "kind": "string"
      },
      {
        "name": "reviewedAt",
        "kind": "date"
      },
      {
        "name": "reviewer",
        "kind": "string"
      },
      {
        "name": "disposition",
        "kind": "string"
      },
      {
        "name": "rationale",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "TissueDistribution": {
    "name": "TissueDistribution",
    "label": "Tissue Distribution",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "tissueLotId",
        "kind": "string"
      },
      {
        "name": "shippedAt",
        "kind": "date"
      },
      {
        "name": "recipient",
        "kind": "string"
      },
      {
        "name": "quantity",
        "kind": "number"
      },
      {
        "name": "receipt",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "TissueAdverseEvent": {
    "name": "TissueAdverseEvent",
    "label": "Tissue Adverse Event",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "tissueLotId",
        "kind": "string"
      },
      {
        "name": "observedAt",
        "kind": "date"
      },
      {
        "name": "description",
        "kind": "string"
      },
      {
        "name": "investigator",
        "kind": "string"
      },
      {
        "name": "response",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "OperationalTask": {
    "name": "OperationalTask",
    "label": "Operational Task",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "owner",
        "kind": "string"
      },
      {
        "name": "priority",
        "kind": "string"
      },
      {
        "name": "startAt",
        "kind": "date"
      },
      {
        "name": "dueAt",
        "kind": "date"
      },
      {
        "name": "done",
        "kind": "boolean"
      },
      {
        "name": "notes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "RuleVersion": {
    "name": "RuleVersion",
    "label": "Rule Version",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "jurisdiction",
        "kind": "string"
      },
      {
        "name": "version",
        "kind": "string"
      },
      {
        "name": "effectiveAt",
        "kind": "date"
      },
      {
        "name": "expiresAt",
        "kind": "date"
      },
      {
        "name": "sourceUrl",
        "kind": "string"
      },
      {
        "name": "requirementText",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  },
  "DocumentRequirement": {
    "name": "DocumentRequirement",
    "label": "Document Requirement",
    "fields": [
      {
        "name": "title",
        "kind": "string"
      },
      {
        "name": "category",
        "kind": "string"
      },
      {
        "name": "requiredBy",
        "kind": "date"
      },
      {
        "name": "sourceReference",
        "kind": "string"
      },
      {
        "name": "evidenceReference",
        "kind": "string"
      },
      {
        "name": "reviewNotes",
        "kind": "string"
      },
      {
        "name": "status",
        "kind": "string"
      },
      {
        "name": "tissueBankProgramId",
        "kind": "string"
      }
    ]
  }
};
export const workflows: WorkflowConfig[] = [
  {
    "slug": "consent-record-extraction",
    "title": "Consent record extraction",
    "description": "Consent record extraction using selected tissue bank program records and supplied evidence.",
    "prompt": "Consent record extraction for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "eligibility-evidence-gaps",
    "title": "Eligibility evidence gaps",
    "description": "Eligibility evidence gaps using selected tissue bank program records and supplied evidence.",
    "prompt": "Eligibility evidence gaps for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "processing-packet-comparison",
    "title": "Processing packet comparison",
    "description": "Processing packet comparison using selected tissue bank program records and supplied evidence.",
    "prompt": "Processing packet comparison for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "quarantine-review-preparation",
    "title": "Quarantine review preparation",
    "description": "Quarantine review preparation using selected tissue bank program records and supplied evidence.",
    "prompt": "Quarantine review preparation for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "distribution-traceability-review",
    "title": "Distribution traceability review",
    "description": "Distribution traceability review using selected tissue bank program records and supplied evidence.",
    "prompt": "Distribution traceability review for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "adverse-event-chronology",
    "title": "Adverse event chronology",
    "description": "Adverse event chronology using selected tissue bank program records and supplied evidence.",
    "prompt": "Adverse event chronology for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "evidence-completeness-review",
    "title": "Evidence completeness review",
    "description": "Evidence completeness review using selected tissue bank program records and supplied evidence.",
    "prompt": "Evidence completeness review for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  },
  {
    "slug": "operations-handoff-draft",
    "title": "Operations handoff draft",
    "description": "Operations handoff draft using selected tissue bank program records and supplied evidence.",
    "prompt": "Operations handoff draft for Tissue and Eye Bank Operations. Operational scope: Maintain donor consent/eligibility evidence, processing lots, quarantine/release records, distribution and adverse-event linkage. Specific AI scope: Check document completeness and reconcile conflicting donor records. Produce an editable, source-linked draft for the responsible professional. Distinguish observations, missing evidence and proposed next actions. Do not invent facts, decide legal eligibility, authorize clinical release, profile individuals, submit externally or invent calibrated probabilities. Use supplied rule versions only. For translation preserve identifiers, dates, names and numbers and mark uncertain terms.",
    "fields": [
      "objective",
      "sourceContext",
      "applicableRules",
      "knownDiscrepancies",
      "constraints",
      "requestedOutput",
      "optionalReviewerNotes",
      "optionalAdditionalEvidence"
    ]
  }
];
export function findPage(href:string){return pages.find(p=>p.href===href);}
