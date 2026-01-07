# docker 'grundregler'
- Docker bryr sig inte om "kurs" vs "ditt projekt". Docker bryr sig om namn, portar och volymer.

## Grundregel: 1 projekt = 1 mapp  
- Skapa en ny mapp för allt du vill leka med under lektionen/etc.
- I den mappen lägger du lärarens grejer: docker-compose.yml, ev. Dockerfile, ev. .env.




--------------------------------------------------------------

# Docker

## Egna notes kring docker:
- **Vad är docker?**
  - Ett verktyg/plattform som gör det lätt att bygga images och köra containers.
- Container
  - en container är den isolerade körningen (process + filsystem + nätverk) som Docker startar.
  - Det går att skala och "kopiera" tusentals gånger och dela ut för andra att jobba med i exakt samma "klimat"

### **Eget exempel/metafor och förklaring**
- Tänk dig att du är imperiet ifrån Star Wars. En container är dina stormtroopers. Stormtroopers är identiska, dom kommer allihopa med det du behöver så som skydd(armor), blaster-rifles, träning och du kan deploya(sätta ut) alla stormtroopers vart du vill i hela världen. Det är bokstavligen vad containers är, dom packar upp nästan allt(inte kernel) din app(Stormtrooper i detta exempel) behöver för att köras så den fungerar EXAKT likadant oavsett vad för OS eller dator som din vän på andra sidan jorden använder.

  - **Dockerfile**(ritningen/instructions to build Image). Det här är instruktionerna klonfabriken på Kamino(min laptop) fick. "Ta en klon, utrusta honom med body armor, utrusta han med en blaster, träna honom till att missa allt han skjuter på"
  - **I min kod är det här filen där det står** `FROM python:3.11` och `RUN pip install pandas`. (Min dockerfile dvs)

  - **Docker Image**(Klon mallen, read-only template för att skapa din container). Det här är den färdiga mallen som ligger fryst i en tank. Den gör ingenting, den bara är, det är en "snapshot" av hur en stormtrooper ska se ut. Du bygger den med kommandot: `docker build -t my-trooper`.

  - **Docker Container**(Den levande stormtroopern/The running instance of docker Image). Det här är när jag trycker på 'Start'. Klonen vaknar, kliver ut ur tanken och börjar jobba(skjuta dvs). Jag kan spinna upp 10, 559, eller 10 000 identiska stormtroopers (Containers) från en enda mall (Image). Det gör du med `docker run --name tk-421 my-trooper`. (TK-421 = namnet på en stormtrooper)

- Alltså. Med Docker så slipper man problemet med "Den fungerar på min dator!". Med stormtrooper exemplet -> Om stormtroopern(appen/programmet/etc) kan andas och skjuta på min laptop(Kamino) så kommer den kunna andas och skjuta exakt likadant på molnet/servern/vart som helst.