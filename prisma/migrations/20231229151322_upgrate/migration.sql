/*
  Warnings:

  - You are about to drop the column `userId` on the `Form` table. All the data in the column will be lost.
  - You are about to drop the `FormSubmissions` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[name,userID]` on the table `Form` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `userID` to the `Form` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "FormSubmissions" DROP CONSTRAINT "FormSubmissions_formId_fkey";

-- DropIndex
DROP INDEX "Form_name_userId_key";

-- AlterTable
ALTER TABLE "Form" DROP COLUMN "userId",
ADD COLUMN     "userID" TEXT NOT NULL;

-- DropTable
DROP TABLE "FormSubmissions";

-- CreateTable
CREATE TABLE "FormSubmitions" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "formID" INTEGER NOT NULL,
    "content" TEXT NOT NULL,

    CONSTRAINT "FormSubmitions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Form_name_userID_key" ON "Form"("name", "userID");

-- AddForeignKey
ALTER TABLE "FormSubmitions" ADD CONSTRAINT "FormSubmitions_formID_fkey" FOREIGN KEY ("formID") REFERENCES "Form"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
