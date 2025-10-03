/*
  Warnings:

  - A unique constraint covering the columns `[nama]` on the table `fakultas` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nama]` on the table `program_studi` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nama]` on the table `universitas` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[akronim]` on the table `universitas` will be added. If there are existing duplicate values, this will fail.

*/
-- CreateIndex
CREATE UNIQUE INDEX "fakultas_nama_key" ON "fakultas"("nama");

-- CreateIndex
CREATE UNIQUE INDEX "program_studi_nama_key" ON "program_studi"("nama");

-- CreateIndex
CREATE UNIQUE INDEX "universitas_nama_key" ON "universitas"("nama");

-- CreateIndex
CREATE UNIQUE INDEX "universitas_akronim_key" ON "universitas"("akronim");
