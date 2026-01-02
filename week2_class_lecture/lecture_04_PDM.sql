CREATE TABLE "Book" (
  "ISBN_nr" TEXT PRIMARY KEY,
  "title" "TEXT(75)" NOT NULL,
  "author" "TEXT(50)" NOT NULL
);

CREATE TABLE "BookCopy" (
  "book_id" INTEGER PRIMARY KEY,
  "ISBN_nr" "TEXT(50)",
  "copy_nr" INTEGER NOT NULL
);

CREATE TABLE "BorrowItem" (
  "borrow_item_id" INTEGER PRIMARY KEY,
  "borrow_id" INTEGER,
  "item_nr" SMALLINT NOT NULL,
  "book_id" INTEGER
);

CREATE TABLE "Borrow" (
  "borrow_id" INTEGER PRIMARY KEY,
  "borrow_date" "DATETIME" NOT NULL,
  "member_id" INTEGER
);

CREATE TABLE "Member" (
  "member_id" integer PRIMARY KEY,
  "first_name" "VARCHAR(50)" NOT NULL,
  "last_name" "VARCHAR(50)" NOT NULL,
  "address" "VARCHAR(75)" NOT NULL,
  "phone" "VARCHAR(50)" NOT NULL
);

COMMENT ON COLUMN "BorrowItem"."borrow_item_id" IS 'this is a surrogate key combining borrow_id and book_id';

COMMENT ON TABLE "Member" IS 'Business rule: a person can be a member without borrowing a book';

ALTER TABLE "BookCopy" ADD FOREIGN KEY ("ISBN_nr") REFERENCES "Book" ("ISBN_nr");

ALTER TABLE "BorrowItem" ADD FOREIGN KEY ("borrow_id") REFERENCES "Borrow" ("borrow_id");

ALTER TABLE "BorrowItem" ADD FOREIGN KEY ("book_id") REFERENCES "BookCopy" ("book_id");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("member_id") REFERENCES "Member" ("member_id");
