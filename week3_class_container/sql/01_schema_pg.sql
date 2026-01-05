-- Stoppa direkt om något failar (så du inte får 40 följdfel)
\set ON_ERROR_STOP on

-- (Sandbox-mode) Rensa så du kan köra filen om och om igen
DROP TABLE IF EXISTS "BorrowItem" CASCADE;
DROP TABLE IF EXISTS "Borrow" CASCADE;
DROP TABLE IF EXISTS "BookCopy" CASCADE;
DROP TABLE IF EXISTS "Member" CASCADE;
DROP TABLE IF EXISTS "Book" CASCADE;

CREATE TABLE "Book" (
  "ISBN_nr"  TEXT PRIMARY KEY,
  "title"    VARCHAR(75) NOT NULL,
  "author"   VARCHAR(50) NOT NULL
);

CREATE TABLE "Member" (
  "member_id"  INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "first_name" VARCHAR(50) NOT NULL,
  "last_name"  VARCHAR(50) NOT NULL,
  "address"    VARCHAR(75) NOT NULL,
  "phone"      VARCHAR(50) NOT NULL
);

COMMENT ON TABLE "Member"
IS 'Business rule: a person can be a member without borrowing a book';

CREATE TABLE "Borrow" (
  "borrow_id"   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "member_id"   INTEGER NOT NULL REFERENCES "Member" ("member_id"),
  "borrow_date" TIMESTAMP NOT NULL,
  "return_date" TIMESTAMP NULL
);

CREATE TABLE "BookCopy" (
  "book_id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "ISBN_nr" TEXT NOT NULL REFERENCES "Book" ("ISBN_nr"),
  "copy_nr" INTEGER NOT NULL,
  UNIQUE ("ISBN_nr", "copy_nr")
);

CREATE TABLE "BorrowItem" (
  "borrow_item_id" INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "borrow_id"      INTEGER NOT NULL REFERENCES "Borrow" ("borrow_id"),
  "book_id"        INTEGER NOT NULL REFERENCES "BookCopy" ("book_id"),
  "item_nr"        SMALLINT NOT NULL,
  UNIQUE ("borrow_id", "item_nr")
);

COMMENT ON COLUMN "BorrowItem"."borrow_item_id"
IS 'Surrogate key for borrow item row (not a composite key).';
