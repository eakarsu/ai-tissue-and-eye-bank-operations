import { NextRequest, NextResponse } from "next/server";
import { prisma } from "@/lib/prisma";
import { requireUser } from "@/lib/api-auth";
import { recordMetadata } from "@/lib/record-policy";
import { records } from "@/lib/record-store";
import { deterministicInsights } from "@/lib/deterministic-insights";
export const dynamic = "force-dynamic";
// Authenticated deterministic insights over the caller's own records (no provider call).
export async function GET(request: NextRequest) {
  const user = await requireUser();
  if (!user) return NextResponse.json({ error: "Unauthorized" }, { status: 401 });
  const entity = request.nextUrl.searchParams.get("entity") || "";
  if (!recordMetadata[entity]) return NextResponse.json({ error: "Unknown entity" }, { status: 404 });
  const client = records(prisma, entity) as unknown as { findMany: (a: unknown) => Promise<Record<string, unknown>[]> };
  const rows = await client.findMany({ orderBy: [{ createdAt: "desc" }], take: 500 });
  return NextResponse.json({ insight: deterministicInsights(rows, entity) });
}
