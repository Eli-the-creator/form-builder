/*
  Warnings:

  - You are about to drop the `FormSubmitions` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "FormSubmitions" DROP CONSTRAINT "FormSubmitions_formID_fkey";

-- DropTable
DROP TABLE "FormSubmitions";

-- CreateTable
CREATE TABLE "FormSubmissions" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "formID" INTEGER NOT NULL,
    "content" TEXT NOT NULL,

    CONSTRAINT "FormSubmissions_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "FormSubmissions" ADD CONSTRAINT "FormSubmissions_formID_fkey" FOREIGN KEY ("formID") REFERENCES "Form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
