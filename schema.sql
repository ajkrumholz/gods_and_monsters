CREATE TABLE "public.gods" (
	"id" serial NOT NULL,
	"name" serial(255) NOT NULL,
	"age" serial NOT NULL,
	"immortal" serial NOT NULL,
	"created_at" serial NOT NULL,
	"updated_at" serial NOT NULL,
	CONSTRAINT "gods_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.monsters" (
	"id" serial NOT NULL,
	"god_id" integer NOT NULL,
	"name" VARCHAR(255) NOT NULL,
	"strength_rank" FLOAT NOT NULL,
	"flying" BOOLEAN NOT NULL,
	"created_at" DATETIME NOT NULL,
	"updated_at" DATETIME NOT NULL,
	CONSTRAINT "monsters_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "monsters" ADD CONSTRAINT "monsters_fk0" FOREIGN KEY ("god_id") REFERENCES "gods"("id");



