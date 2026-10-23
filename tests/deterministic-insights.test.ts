import { test } from "node:test";
import assert from "node:assert/strict";
delete process.env.OPENROUTER_API_KEY;
import { deterministicInsights, INSIGHT_FEATURES } from "../src/lib/deterministic-insights";
test("operational insights are labelled aiGenerated:false with sections preserving zero/empty", () => {
  const r = deterministicInsights([{ status: "Quarantine" }, { status: "" }, { status: "Released" }], "TissueLot");
  assert.equal(r.aiGenerated, false);
  assert.match(r.label, /not AI-generated/);
  assert.equal(r.sections.length, 3);
  assert.ok(r.sections.every((s) => s.title && s.detail !== undefined));
  assert.equal(r.metrics.find((m) => m.label === "Empty-status records")?.value, 1);
  assert.equal(deterministicInsights([], "TissueLot").metrics[0].value, 0);
  assert.ok(INSIGHT_FEATURES.length >= 2 && INSIGHT_FEATURES.length <= 3);
});
