/*
  Warnings:

  - You are about to drop the `sieges` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
DROP TABLE "sieges";

-- CreateTable
CREATE TABLE "Seat" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "manufacturer_id" INTEGER NOT NULL,
    "name" VARCHAR(512) NOT NULL,
    "slug" VARCHAR(64) NOT NULL,
    "isize" BOOLEAN NOT NULL DEFAULT false,
    "r44" BOOLEAN NOT NULL DEFAULT true,
    "amazon_asin" VARCHAR(24),
    "groupe_age" VARCHAR(10),
    "adac_seat_id" INTEGER,
    "published" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Seat_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Manufacturer" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "name" VARCHAR(128) NOT NULL,
    "slug" VARCHAR(32) NOT NULL,
    "published" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "Manufacturer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Price" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "currency" VARCHAR(3) NOT NULL DEFAULT 'EUR',
    "seat_id" INTEGER NOT NULL,

    CONSTRAINT "Price_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AdacSeat" (
    "id" SERIAL NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "url" VARCHAR(1024) NOT NULL,
    "rating_safety" DOUBLE PRECISION,
    "rating_easeofuse" DOUBLE PRECISION,
    "rating_ergonomics" DOUBLE PRECISION,
    "rating_pollutants" DOUBLE PRECISION,
    "rating_overall" DOUBLE PRECISION,
    "test_date" TIMESTAMP(3),

    CONSTRAINT "AdacSeat_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "seat_manufacturer_id_fkey" FOREIGN KEY ("manufacturer_id") REFERENCES "Manufacturer"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Seat" ADD CONSTRAINT "Seat_adac_seat_id_fkey" FOREIGN KEY ("adac_seat_id") REFERENCES "AdacSeat"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "Price" ADD CONSTRAINT "Price_seat_id_fkey" FOREIGN KEY ("seat_id") REFERENCES "Seat"("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
