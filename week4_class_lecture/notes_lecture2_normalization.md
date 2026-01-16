# Week 4 lecture notes for lecture 2/2 2026/01/16.

## Normalization:

- (Read through the slides first in the PDF)

### Think of a database for ICA.
- Kund köper någonting i kassan. Från kassan skickas data till någon typ av databas.
- Syftet med databasen är att lagra data ofc.
- **DB1 = OLTP (Online transactional processing)** (3NF)
- **DB2 = OLAP (Online analytical processing)** (Dimensional modeling)
  
  - Från DB1 <- (kassa DBn raw data) rengörs datan och när datan är clean skickas den rena datan till DB2.

  - INSERT DATA --> DB1 --> CLEAN DB1 DATA --> DB2 (SELECT/JOINS/ETC) --> Data vidare till Data scientists/Data analysists.

## Normalization:

- 2NF == Enbart inom den table som det handlar om och enbart den tablen. Den MÅSTE vara beroende av HELA den tablen(om det är t.ex composite keys) och inte bara en del.


- 3NF innebär att du t.ex har en table med lärare_kurs_id(PK), lärare_id, kurs_id, kurs_namn
  - lärare_kurs_id(PK) -> lärare_id (lärare_id är beroende av lärare_kurs_id)
  - lärare_kurs_id(PK) -> kurs_id (kurs_id är beroende av lärare_kurs_id)
  - MEN HÄR bryter jag mog 3NF genom att:
    - lärare_kurs_id(pk) -> kurs_id -> kurs_namn **KURS_NAMN** är beroende av kurs_id som är beroende av lärare_kurs_id.
    - **DETTA ÄR INTE OKEJ OCH BRYTER MOT 3NF** 
    - **DU FÅR EJ HA NÅGONTING SOM INTE ÄR BEROENDE UTAV NÅGOT SOM ÄR BEROENDE AV PK**

- Vill jag uppnå 3NF bör jag ha en till table med relevant data som är kopplad till lärare_kurs_id som innehåller t.ex kurs_namn ... ... ... 