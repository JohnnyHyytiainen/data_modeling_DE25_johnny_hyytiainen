# Lecture 07 notes. Normalization.

## Database Normalization
**(Databas normalisering)**

- Om jag alltid använder Surrogate Keys (id 1, 2, 3...) i alla dina tabeller (vilket man oftast gör i moderna system), då är du automatiskt klar med 2NF. Detta är för att din PK bara har en del. Det finns ingen 'halv nyckel' att snylta på. 

- 1):  2NF via "Surrogate Keys" (Fuskkoden)  
```
Teorin: 2NF säger "Inga attribut får bero på bara halva nyckeln (om du har en sammansatt nyckel)"

Hack: Jag använder student_id, class_id etc. (Surrogate Keys). Jag har aldrig sammansatta nycklar.

Resultat: Eftersom att jag inte har sammansatta nycklar, kan jag omöjligen bryta mot 2NF.
``` 

- 2): 3NF är bara "SoC" för data.

- 3NF handlar om Transitiva Beroenden. Det låter krångligt, men det är exakt: "Var sak för sig"    

**Python-exempel (SoC):** 
```
Jag skriver inte en funktion create_student() som också hårdkodar skolans adress och rektorns namn inuti sig. Varför? För om rektorn byter namn måste jag skriva om student-funktionen. Det är "Bad Practice"
``` 

- **Databas-exempel (3NF):** Tänk dig tabellen Student:
```
student_id (PK)

student_name

class_name

classroom_location <-- Här bryter jag mot SoC (3NF)!

Varför? classroom_location har inget med Studenten att göra. Det har med Klassen att göra. Om klassen byter rum, måste jag uppdatera 30 studenter i onödan.

Lösningen (SoC): Bryt ut Class till en egen tabell/funktion. Länka dem med ett ID.

Nu har jag Student (med class_id).

Och Class (med classroom_location).

Boom. 3NF uppnådd. 
```