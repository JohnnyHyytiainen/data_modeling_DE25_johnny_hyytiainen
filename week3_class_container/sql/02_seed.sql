-- Seed fil (repeatable sandbox):
-- 1) Rensar tabeller + resetar identity
-- 2) Lägger in 1 bok, 2 kopior, 1 medlem, 1 borrow, 2 borrow items
-- 3) Kör en JOIN som bevisar FK/relational thinking

\set ON_ERROR_STOP on
BEGIN; 


-- Reset: rensa allt och starta om identity-räknare
TRUNCATE "BorrowItem","Borrow","BookCopy","Book","Member"
RESTART IDENTITY CASCADE;

-- Book
INSERT INTO "Book" ("ISBN_nr","title","author")
VALUES ('978-0-123456-47-2','The Data Modeler''s Journey','Ada Lovelace');

-- BookCopy (2x kopior av samma bok)
INSERT INTO "BookCopy" ("ISBN_nr","copy_nr")
VALUES
  ('978-0-123456-47-2', 1),
  ('978-0-123456-47-2', 2);

-- Member
INSERT INTO "Member" ("first_name","last_name","address","phone")
VALUES ('Johnny','Hyytiainen','Stockholm','073-1231239');


-- Borrow (Länka till medlem som precis skapades)
-- För att göra det enkelt i sandbox miljö. Använd 'senaste member_id'
INSERT INTO "Borrow" ("member_id","borrow_date","return_date")
SELECT "member_id", NOW(), NULL
FROM "Member"
ORDER BY "member_id" DESC
LIMIT 1;

-- BorrowItem(Två rader)
INSERT INTO "BorrowItem" ("borrow_id","book_id","item_nr")
SELECT b."borrow_id", bc."book_id", x.item_nr
FROM "Borrow" b
JOIN "BookCopy" bc ON bc."ISBN_nr" = '978-0-123456-47-2'
JOIN (VALUES (1),(2)) AS x(item_nr) ON x.item_nr = bc."copy_nr"
ORDER BY x.item_nr;

-- Visa vem som lånat vad. En bevis join.

SELECT
  m."member_id",
  m."first_name",
  m."last_name",
  b."borrow_id",
  b."borrow_date",
  bk."title",
  bc."copy_nr"
FROM "Borrow" b
JOIN "Member" m ON m."member_id" = b."member_id"
JOIN "BorrowItem" bi ON bi."borrow_id" = b."borrow_id"
JOIN "BookCopy" bc ON bc."book_id" = bi."book_id"
JOIN "Book" bk ON bk."ISBN_nr" = bc."ISBN_nr"
ORDER BY b."borrow_id", bi."item_nr";

COMMIT; 