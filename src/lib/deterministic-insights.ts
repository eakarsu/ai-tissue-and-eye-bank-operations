// Deterministic operational insights over the bank's own records.
// Operational only — no diagnosis or clinical recommendation. No provider call is made here.
export type InsightRecord = { status?: unknown; [k: string]: unknown };
export function deterministicInsights(records: InsightRecord[], scope: string) {
  const list = records ?? [];
  const held = list.filter((r) => /quarantine|hold/i.test(String(r.status ?? ""))).length;
  const open = list.filter((r) => !/released|closed|distributed/i.test(String(r.status ?? ""))).length;
  const empty = list.filter((r) => r.status === "" || r.status == null).length;
  return {
    aiGenerated: false as const,
    source: "deterministic-fallback",
    label: "Deterministic fallback \u2014 not AI-generated. Computed locally from your own records; verify before acting.",
    scope,
    sections: [
      { title: "Quarantine & release readiness (operational)", detail: `${list.length} record(s) in scope: ${held} on quarantine/hold, ${open} not yet released/closed. A count of 0 means none found in the current records.` },
      { title: "Evidence & status completeness (operational)", detail: `${empty} record(s) have an empty/missing status and are retained in this count rather than dropped; complete the operational status before distribution.` },
      { title: "Distribution traceability queue (operational)", detail: open ? `Work the ${open} open record(s) in due order, confirm lot-to-recipient linkage, and retain the handoff evidence.` : "No open operational records in scope; retain the audit trail and re-run when new records arrive." },
    ],
    metrics: [
      { label: "Records reviewed", value: list.length },
      { label: "Quarantine/hold", value: held },
      { label: "Open records", value: open },
      { label: "Empty-status records", value: empty },
    ],
  };
}
export const INSIGHT_FEATURES = ["quarantine-release-readiness", "evidence-completeness", "distribution-traceability"] as const;
