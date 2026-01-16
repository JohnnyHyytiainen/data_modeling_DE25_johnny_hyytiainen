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

