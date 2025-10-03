-- CreateEnum
CREATE TYPE "kategori" AS ENUM ('Wajib', 'Pilihan');

-- CreateTable
CREATE TABLE "universitas" (
    "id" TEXT NOT NULL,
    "nama" VARCHAR(100) NOT NULL,
    "akronim" VARCHAR(60),
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),

    CONSTRAINT "universitas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "fakultas" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "nama" VARCHAR(60) NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_universitas" TEXT NOT NULL,

    CONSTRAINT "fakultas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "program_studi" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "nama" VARCHAR(60) NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_fakultas" TEXT NOT NULL,

    CONSTRAINT "program_studi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "profil_lulusan" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "deskripsi_inggris" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,

    CONSTRAINT "profil_lulusan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capaian_pembelajaran_lulusan" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "deskripsi_inggris" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,

    CONSTRAINT "capaian_pembelajaran_lulusan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "bahan_kajian" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "nama" VARCHAR(60) NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "deskripsi_inggris" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,

    CONSTRAINT "bahan_kajian_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mata_kuliah" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "akronim" VARCHAR(10) NOT NULL,
    "nama" VARCHAR(60) NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "deskripsi_inggris" TEXT NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,
    "id_jenis_mk" TEXT NOT NULL,

    CONSTRAINT "mata_kuliah_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "jenis_mata_kuliah" (
    "id" TEXT NOT NULL,
    "nama" VARCHAR(50) NOT NULL,
    "urutan" INTEGER NOT NULL,

    CONSTRAINT "jenis_mata_kuliah_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "capaian_pembelajaran_mata_kuliah" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "deskripsi_inggris" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,

    CONSTRAINT "capaian_pembelajaran_mata_kuliah_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sub_capaian_pembelajaran_mata_kuliah" (
    "id" TEXT NOT NULL,
    "kode" VARCHAR(10) NOT NULL,
    "deskripsi" TEXT NOT NULL,
    "deskripsi_inggris" TEXT NOT NULL,
    "bobot" INTEGER NOT NULL,
    "indikator" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_cpmk" TEXT NOT NULL,

    CONSTRAINT "sub_capaian_pembelajaran_mata_kuliah_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "dosen" (
    "id" TEXT NOT NULL,
    "nip" VARCHAR(18) NOT NULL,
    "nidn" VARCHAR(18),
    "nama" VARCHAR(100) NOT NULL,
    "email" VARCHAR(225) NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,

    CONSTRAINT "dosen_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kaprodi" (
    "id" TEXT NOT NULL,
    "tahun_mulai_menjabat" INTEGER NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,
    "id_dosen" TEXT NOT NULL,

    CONSTRAINT "kaprodi_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "akun" (
    "id" UUID NOT NULL,
    "nama" VARCHAR(255) NOT NULL,
    "email" VARCHAR(225) NOT NULL,
    "avatar_url" VARCHAR(225),
    "id_google" VARCHAR(225),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_prodi" TEXT NOT NULL,

    CONSTRAINT "akun_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "kurikulum" (
    "id" TEXT NOT NULL,
    "nama" VARCHAR(50) NOT NULL,
    "id_prodi" TEXT NOT NULL,
    "id_ta" TEXT NOT NULL,

    CONSTRAINT "kurikulum_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "tahun_ajaran" (
    "kode" VARCHAR(5) NOT NULL,
    "nama" VARCHAR(20) NOT NULL,

    CONSTRAINT "tahun_ajaran_pkey" PRIMARY KEY ("kode")
);

-- CreateTable
CREATE TABLE "detail_mata_kuliah" (
    "id" TEXT NOT NULL,
    "sks_teori" INTEGER NOT NULL,
    "sks_praktek" INTEGER NOT NULL,
    "kategori" "kategori" NOT NULL,
    "semester" INTEGER NOT NULL,
    "created_by" UUID,
    "updated_by" UUID,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3),
    "id_mk" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,

    CONSTRAINT "detail_mata_kuliah_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pl_cpl" (
    "id" TEXT NOT NULL,
    "id_pl" TEXT NOT NULL,
    "id_cpl" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,

    CONSTRAINT "pl_cpl_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cpl_bk" (
    "id" TEXT NOT NULL,
    "id_cpl" TEXT NOT NULL,
    "id_bk" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,

    CONSTRAINT "cpl_bk_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cpl_mk" (
    "id" TEXT NOT NULL,
    "id_cpl" TEXT NOT NULL,
    "id_mk" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,

    CONSTRAINT "cpl_mk_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mk_bk" (
    "id" TEXT NOT NULL,
    "id_mk" TEXT NOT NULL,
    "id_bk" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,

    CONSTRAINT "mk_bk_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cpl_cpmk" (
    "id" TEXT NOT NULL,
    "id_cpl" TEXT NOT NULL,
    "id_cpmk" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,

    CONSTRAINT "cpl_cpmk_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "mata_kuliah_prasyarat" (
    "id" TEXT NOT NULL,
    "id_mk" TEXT NOT NULL,
    "id_mk_syarat" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,

    CONSTRAINT "mata_kuliah_prasyarat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "pengampu_mata_kuliah" (
    "id" TEXT NOT NULL,
    "tahun" INTEGER NOT NULL,
    "id_mk" TEXT NOT NULL,
    "id_kurikulum" TEXT NOT NULL,
    "id_dosen" TEXT NOT NULL,

    CONSTRAINT "pengampu_mata_kuliah_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "fakultas_kode_key" ON "fakultas"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "program_studi_kode_key" ON "program_studi"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "profil_lulusan_kode_key" ON "profil_lulusan"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "bahan_kajian_kode_key" ON "bahan_kajian"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "bahan_kajian_nama_key" ON "bahan_kajian"("nama");

-- CreateIndex
CREATE UNIQUE INDEX "mata_kuliah_kode_key" ON "mata_kuliah"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "mata_kuliah_akronim_key" ON "mata_kuliah"("akronim");

-- CreateIndex
CREATE UNIQUE INDEX "jenis_mata_kuliah_nama_key" ON "jenis_mata_kuliah"("nama");

-- CreateIndex
CREATE UNIQUE INDEX "capaian_pembelajaran_mata_kuliah_kode_key" ON "capaian_pembelajaran_mata_kuliah"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "sub_capaian_pembelajaran_mata_kuliah_kode_key" ON "sub_capaian_pembelajaran_mata_kuliah"("kode");

-- CreateIndex
CREATE UNIQUE INDEX "dosen_nip_key" ON "dosen"("nip");

-- CreateIndex
CREATE UNIQUE INDEX "dosen_nidn_key" ON "dosen"("nidn");

-- CreateIndex
CREATE UNIQUE INDEX "kurikulum_nama_key" ON "kurikulum"("nama");

-- CreateIndex
CREATE UNIQUE INDEX "tahun_ajaran_nama_key" ON "tahun_ajaran"("nama");

-- AddForeignKey
ALTER TABLE "universitas" ADD CONSTRAINT "universitas_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "universitas" ADD CONSTRAINT "universitas_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fakultas" ADD CONSTRAINT "fakultas_id_universitas_fkey" FOREIGN KEY ("id_universitas") REFERENCES "universitas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fakultas" ADD CONSTRAINT "fakultas_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fakultas" ADD CONSTRAINT "fakultas_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "program_studi" ADD CONSTRAINT "program_studi_id_fakultas_fkey" FOREIGN KEY ("id_fakultas") REFERENCES "fakultas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "program_studi" ADD CONSTRAINT "program_studi_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "program_studi" ADD CONSTRAINT "program_studi_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "profil_lulusan" ADD CONSTRAINT "profil_lulusan_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "profil_lulusan" ADD CONSTRAINT "profil_lulusan_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "profil_lulusan" ADD CONSTRAINT "profil_lulusan_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capaian_pembelajaran_lulusan" ADD CONSTRAINT "capaian_pembelajaran_lulusan_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capaian_pembelajaran_lulusan" ADD CONSTRAINT "capaian_pembelajaran_lulusan_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capaian_pembelajaran_lulusan" ADD CONSTRAINT "capaian_pembelajaran_lulusan_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bahan_kajian" ADD CONSTRAINT "bahan_kajian_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bahan_kajian" ADD CONSTRAINT "bahan_kajian_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "bahan_kajian" ADD CONSTRAINT "bahan_kajian_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_kuliah" ADD CONSTRAINT "mata_kuliah_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_kuliah" ADD CONSTRAINT "mata_kuliah_id_jenis_mk_fkey" FOREIGN KEY ("id_jenis_mk") REFERENCES "jenis_mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_kuliah" ADD CONSTRAINT "mata_kuliah_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_kuliah" ADD CONSTRAINT "mata_kuliah_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capaian_pembelajaran_mata_kuliah" ADD CONSTRAINT "capaian_pembelajaran_mata_kuliah_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capaian_pembelajaran_mata_kuliah" ADD CONSTRAINT "capaian_pembelajaran_mata_kuliah_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "capaian_pembelajaran_mata_kuliah" ADD CONSTRAINT "capaian_pembelajaran_mata_kuliah_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_capaian_pembelajaran_mata_kuliah" ADD CONSTRAINT "sub_capaian_pembelajaran_mata_kuliah_id_cpmk_fkey" FOREIGN KEY ("id_cpmk") REFERENCES "capaian_pembelajaran_mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_capaian_pembelajaran_mata_kuliah" ADD CONSTRAINT "sub_capaian_pembelajaran_mata_kuliah_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sub_capaian_pembelajaran_mata_kuliah" ADD CONSTRAINT "sub_capaian_pembelajaran_mata_kuliah_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dosen" ADD CONSTRAINT "dosen_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dosen" ADD CONSTRAINT "dosen_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "dosen" ADD CONSTRAINT "dosen_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kaprodi" ADD CONSTRAINT "kaprodi_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kaprodi" ADD CONSTRAINT "kaprodi_id_dosen_fkey" FOREIGN KEY ("id_dosen") REFERENCES "dosen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kaprodi" ADD CONSTRAINT "kaprodi_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kaprodi" ADD CONSTRAINT "kaprodi_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "akun" ADD CONSTRAINT "akun_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kurikulum" ADD CONSTRAINT "kurikulum_id_prodi_fkey" FOREIGN KEY ("id_prodi") REFERENCES "program_studi"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "kurikulum" ADD CONSTRAINT "kurikulum_id_ta_fkey" FOREIGN KEY ("id_ta") REFERENCES "tahun_ajaran"("kode") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_mata_kuliah" ADD CONSTRAINT "detail_mata_kuliah_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_mata_kuliah" ADD CONSTRAINT "detail_mata_kuliah_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_mata_kuliah" ADD CONSTRAINT "detail_mata_kuliah_created_by_fkey" FOREIGN KEY ("created_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "detail_mata_kuliah" ADD CONSTRAINT "detail_mata_kuliah_updated_by_fkey" FOREIGN KEY ("updated_by") REFERENCES "akun"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pl_cpl" ADD CONSTRAINT "pl_cpl_id_pl_fkey" FOREIGN KEY ("id_pl") REFERENCES "profil_lulusan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pl_cpl" ADD CONSTRAINT "pl_cpl_id_cpl_fkey" FOREIGN KEY ("id_cpl") REFERENCES "capaian_pembelajaran_lulusan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pl_cpl" ADD CONSTRAINT "pl_cpl_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_bk" ADD CONSTRAINT "cpl_bk_id_cpl_fkey" FOREIGN KEY ("id_cpl") REFERENCES "capaian_pembelajaran_lulusan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_bk" ADD CONSTRAINT "cpl_bk_id_bk_fkey" FOREIGN KEY ("id_bk") REFERENCES "bahan_kajian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_bk" ADD CONSTRAINT "cpl_bk_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_mk" ADD CONSTRAINT "cpl_mk_id_cpl_fkey" FOREIGN KEY ("id_cpl") REFERENCES "capaian_pembelajaran_lulusan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_mk" ADD CONSTRAINT "cpl_mk_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_mk" ADD CONSTRAINT "cpl_mk_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mk_bk" ADD CONSTRAINT "mk_bk_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mk_bk" ADD CONSTRAINT "mk_bk_id_bk_fkey" FOREIGN KEY ("id_bk") REFERENCES "bahan_kajian"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mk_bk" ADD CONSTRAINT "mk_bk_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_cpmk" ADD CONSTRAINT "cpl_cpmk_id_cpl_fkey" FOREIGN KEY ("id_cpl") REFERENCES "capaian_pembelajaran_lulusan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_cpmk" ADD CONSTRAINT "cpl_cpmk_id_cpmk_fkey" FOREIGN KEY ("id_cpmk") REFERENCES "capaian_pembelajaran_mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "cpl_cpmk" ADD CONSTRAINT "cpl_cpmk_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_kuliah_prasyarat" ADD CONSTRAINT "mata_kuliah_prasyarat_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_kuliah_prasyarat" ADD CONSTRAINT "mata_kuliah_prasyarat_id_mk_syarat_fkey" FOREIGN KEY ("id_mk_syarat") REFERENCES "mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "mata_kuliah_prasyarat" ADD CONSTRAINT "mata_kuliah_prasyarat_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pengampu_mata_kuliah" ADD CONSTRAINT "pengampu_mata_kuliah_id_mk_fkey" FOREIGN KEY ("id_mk") REFERENCES "mata_kuliah"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pengampu_mata_kuliah" ADD CONSTRAINT "pengampu_mata_kuliah_id_kurikulum_fkey" FOREIGN KEY ("id_kurikulum") REFERENCES "kurikulum"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "pengampu_mata_kuliah" ADD CONSTRAINT "pengampu_mata_kuliah_id_dosen_fkey" FOREIGN KEY ("id_dosen") REFERENCES "dosen"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
