-- CreateEnum
CREATE TYPE "Role" AS ENUM ('ADMIN', 'MANAGER', 'ANALYST');

-- CreateTable
CREATE TABLE "User" (
    "active" BOOLEAN NOT NULL DEFAULT true,
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "passwordHash" TEXT NOT NULL,
    "role" "Role" NOT NULL DEFAULT 'ANALYST',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AuditLog" (
    "id" TEXT NOT NULL,
    "actorId" TEXT,
    "actorName" TEXT,
    "action" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT,
    "detail" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "AuditLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkflowAnalysis" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "workflow" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "input" JSONB NOT NULL,
    "evidence" JSONB NOT NULL,
    "evidenceHash" TEXT NOT NULL,
    "result" JSONB NOT NULL,
    "model" TEXT NOT NULL,
    "receipt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkflowAnalysis_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordReview" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "RecordReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UsageBucket" (
    "id" TEXT NOT NULL,
    "calls" INTEGER NOT NULL,

    CONSTRAINT "UsageBucket_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IssuedCredential" (
    "token" TEXT NOT NULL,
    "entity" TEXT NOT NULL,
    "entityId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "assertion" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "revokedAt" TIMESTAMP(3),

    CONSTRAINT "IssuedCredential_pkey" PRIMARY KEY ("token")
);

-- CreateTable
CREATE TABLE "DomainArtifact" (
    "id" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "content" TEXT NOT NULL,
    "contentHash" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "approvedBy" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainArtifact_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RecordApproval" (
    "id" TEXT NOT NULL,
    "version" TEXT NOT NULL,

    CONSTRAINT "RecordApproval_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DomainExecution" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "connectorId" TEXT NOT NULL,
    "action" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "result" JSONB,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DomainExecution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WorkSession" (
    "id" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "respondentId" TEXT NOT NULL,
    "subjectEntity" TEXT NOT NULL,
    "subjectId" TEXT NOT NULL,
    "questions" JSONB NOT NULL,
    "answers" JSONB NOT NULL,
    "currentQuestion" TEXT,
    "status" TEXT NOT NULL,
    "deadline" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "WorkSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SessionMedia" (
    "id" TEXT NOT NULL,
    "sessionId" TEXT NOT NULL,
    "questionId" TEXT NOT NULL,
    "actorId" TEXT NOT NULL,
    "contentType" TEXT NOT NULL,
    "bytes" BYTEA NOT NULL,
    "contentHash" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "SessionMedia_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AppSetting" (
    "id" TEXT NOT NULL,
    "value" JSONB NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AppSetting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueBankProgram" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "facility" TEXT NOT NULL,
    "registrationNumber" TEXT NOT NULL,
    "coordinator" TEXT NOT NULL,
    "reportingStart" TIMESTAMP(3) NOT NULL,
    "reportingEnd" TIMESTAMP(3) NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueBankProgram_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueDonor" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "donorCode" TEXT NOT NULL,
    "recoveredAt" TIMESTAMP(3) NOT NULL,
    "consentEvidence" TEXT NOT NULL,
    "eligibilityEvidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueDonor_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueRecovery" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "tissueDonorId" TEXT NOT NULL,
    "tissueType" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "recoveredAt" TIMESTAMP(3) NOT NULL,
    "recoveryTeam" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueRecovery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueLot" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "tissueDonorId" TEXT NOT NULL,
    "lotNumber" TEXT NOT NULL,
    "tissueType" TEXT NOT NULL,
    "processedAt" TIMESTAMP(3) NOT NULL,
    "storageLocation" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueLot_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueProcessing" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "tissueLotId" TEXT NOT NULL,
    "processName" TEXT NOT NULL,
    "performedAt" TIMESTAMP(3) NOT NULL,
    "operator" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueProcessing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueTest" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "tissueLotId" TEXT NOT NULL,
    "sampledAt" TIMESTAMP(3) NOT NULL,
    "testName" TEXT NOT NULL,
    "resultText" TEXT NOT NULL,
    "laboratory" TEXT NOT NULL,
    "evidence" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueTest_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuarantineReview" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "tissueLotId" TEXT NOT NULL,
    "reviewedAt" TIMESTAMP(3) NOT NULL,
    "reviewer" TEXT NOT NULL,
    "disposition" TEXT NOT NULL,
    "rationale" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QuarantineReview_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueDistribution" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "tissueLotId" TEXT NOT NULL,
    "shippedAt" TIMESTAMP(3) NOT NULL,
    "recipient" TEXT NOT NULL,
    "quantity" INTEGER NOT NULL,
    "receipt" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueDistribution_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TissueAdverseEvent" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "tissueLotId" TEXT NOT NULL,
    "observedAt" TIMESTAMP(3) NOT NULL,
    "description" TEXT NOT NULL,
    "investigator" TEXT NOT NULL,
    "response" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TissueAdverseEvent_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OperationalTask" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "owner" TEXT NOT NULL,
    "priority" TEXT NOT NULL,
    "startAt" TIMESTAMP(3) NOT NULL,
    "dueAt" TIMESTAMP(3) NOT NULL,
    "done" BOOLEAN NOT NULL,
    "notes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OperationalTask_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "RuleVersion" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "jurisdiction" TEXT NOT NULL,
    "version" TEXT NOT NULL,
    "effectiveAt" TIMESTAMP(3) NOT NULL,
    "expiresAt" TIMESTAMP(3),
    "sourceUrl" TEXT NOT NULL,
    "requirementText" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "RuleVersion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DocumentRequirement" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "requiredBy" TIMESTAMP(3) NOT NULL,
    "sourceReference" TEXT NOT NULL,
    "evidenceReference" TEXT,
    "reviewNotes" TEXT,
    "status" TEXT NOT NULL DEFAULT 'Draft',
    "tissueBankProgramId" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DocumentRequirement_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE INDEX "WorkflowAnalysis_workflow_createdAt_idx" ON "WorkflowAnalysis"("workflow", "createdAt");

-- CreateIndex
CREATE UNIQUE INDEX "RecordReview_entity_entityId_version_actorId_key" ON "RecordReview"("entity", "entityId", "version", "actorId");

-- CreateIndex
CREATE INDEX "IssuedCredential_entity_entityId_createdAt_idx" ON "IssuedCredential"("entity", "entityId", "createdAt");

-- CreateIndex
CREATE INDEX "DomainArtifact_subjectEntity_subjectId_idx" ON "DomainArtifact"("subjectEntity", "subjectId");

-- CreateIndex
CREATE INDEX "WorkSession_respondentId_createdAt_idx" ON "WorkSession"("respondentId", "createdAt");

-- CreateIndex
CREATE INDEX "SessionMedia_sessionId_idx" ON "SessionMedia"("sessionId");

-- CreateIndex
CREATE INDEX "TissueBankProgram_createdAt_idx" ON "TissueBankProgram"("createdAt");

-- CreateIndex
CREATE INDEX "TissueDonor_createdAt_idx" ON "TissueDonor"("createdAt");

-- CreateIndex
CREATE INDEX "TissueDonor_tissueBankProgramId_idx" ON "TissueDonor"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "TissueRecovery_createdAt_idx" ON "TissueRecovery"("createdAt");

-- CreateIndex
CREATE INDEX "TissueRecovery_tissueBankProgramId_idx" ON "TissueRecovery"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "TissueLot_createdAt_idx" ON "TissueLot"("createdAt");

-- CreateIndex
CREATE INDEX "TissueLot_tissueBankProgramId_idx" ON "TissueLot"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "TissueProcessing_createdAt_idx" ON "TissueProcessing"("createdAt");

-- CreateIndex
CREATE INDEX "TissueProcessing_tissueBankProgramId_idx" ON "TissueProcessing"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "TissueTest_createdAt_idx" ON "TissueTest"("createdAt");

-- CreateIndex
CREATE INDEX "TissueTest_tissueBankProgramId_idx" ON "TissueTest"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "QuarantineReview_createdAt_idx" ON "QuarantineReview"("createdAt");

-- CreateIndex
CREATE INDEX "QuarantineReview_tissueBankProgramId_idx" ON "QuarantineReview"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "TissueDistribution_createdAt_idx" ON "TissueDistribution"("createdAt");

-- CreateIndex
CREATE INDEX "TissueDistribution_tissueBankProgramId_idx" ON "TissueDistribution"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "TissueAdverseEvent_createdAt_idx" ON "TissueAdverseEvent"("createdAt");

-- CreateIndex
CREATE INDEX "TissueAdverseEvent_tissueBankProgramId_idx" ON "TissueAdverseEvent"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "OperationalTask_createdAt_idx" ON "OperationalTask"("createdAt");

-- CreateIndex
CREATE INDEX "OperationalTask_tissueBankProgramId_idx" ON "OperationalTask"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "RuleVersion_createdAt_idx" ON "RuleVersion"("createdAt");

-- CreateIndex
CREATE INDEX "RuleVersion_tissueBankProgramId_idx" ON "RuleVersion"("tissueBankProgramId");

-- CreateIndex
CREATE INDEX "DocumentRequirement_createdAt_idx" ON "DocumentRequirement"("createdAt");

-- CreateIndex
CREATE INDEX "DocumentRequirement_tissueBankProgramId_idx" ON "DocumentRequirement"("tissueBankProgramId");

-- AddForeignKey
ALTER TABLE "TissueDonor" ADD CONSTRAINT "TissueDonor_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueRecovery" ADD CONSTRAINT "TissueRecovery_tissueDonorId_fkey" FOREIGN KEY ("tissueDonorId") REFERENCES "TissueDonor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueRecovery" ADD CONSTRAINT "TissueRecovery_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueLot" ADD CONSTRAINT "TissueLot_tissueDonorId_fkey" FOREIGN KEY ("tissueDonorId") REFERENCES "TissueDonor"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueLot" ADD CONSTRAINT "TissueLot_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueProcessing" ADD CONSTRAINT "TissueProcessing_tissueLotId_fkey" FOREIGN KEY ("tissueLotId") REFERENCES "TissueLot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueProcessing" ADD CONSTRAINT "TissueProcessing_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueTest" ADD CONSTRAINT "TissueTest_tissueLotId_fkey" FOREIGN KEY ("tissueLotId") REFERENCES "TissueLot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueTest" ADD CONSTRAINT "TissueTest_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuarantineReview" ADD CONSTRAINT "QuarantineReview_tissueLotId_fkey" FOREIGN KEY ("tissueLotId") REFERENCES "TissueLot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "QuarantineReview" ADD CONSTRAINT "QuarantineReview_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueDistribution" ADD CONSTRAINT "TissueDistribution_tissueLotId_fkey" FOREIGN KEY ("tissueLotId") REFERENCES "TissueLot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueDistribution" ADD CONSTRAINT "TissueDistribution_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueAdverseEvent" ADD CONSTRAINT "TissueAdverseEvent_tissueLotId_fkey" FOREIGN KEY ("tissueLotId") REFERENCES "TissueLot"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TissueAdverseEvent" ADD CONSTRAINT "TissueAdverseEvent_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OperationalTask" ADD CONSTRAINT "OperationalTask_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "RuleVersion" ADD CONSTRAINT "RuleVersion_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DocumentRequirement" ADD CONSTRAINT "DocumentRequirement_tissueBankProgramId_fkey" FOREIGN KEY ("tissueBankProgramId") REFERENCES "TissueBankProgram"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

