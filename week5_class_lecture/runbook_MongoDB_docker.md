# Runbook: MongoDB & Docker (Lecture 08 week 5)

## 1. Starta Miljön 

Körs från roten av repot. Detta startar både databasen och GUI:t (Mongo Express).

```bash
docker compose -f docker/docker-compose.yml --env-file docker/.env up -d

```

**Kolla att allt lever:**

```bash
docker ps

```

*(Du ska se `mongodb_lecture_08` och `mongo-express`)*

---

## 2. Gå in i Containern (CLI) 

För att köra MongoDB-kommandon direkt i terminalen (via `mongosh`).

**Alternativ A: Logga in direkt i Mongo Shell**
*(Byt ut `admin` mot din user om du ändrat i .env)*

```bash
docker exec -it mongodb_lecture_08 mongosh -u admin -p

```

*Du kommer bli ombedd att skriva lösenordet. Det syns inte när du skriver.*

**Alternativ B: Gå in i bash först (om du vill se filer)**

```bash
docker exec -it mongodb_lecture_08 bash
# Väl inne skriver du bara:
mongosh -u admin -p

```

---

## 3. Navigera i Mongo Shell (`mongosh`) 

När du väl ser prompten `test>` eller `admin>`, här är dina viktigaste kommandon:

| Kommando | Vad det gör | SQL Motsvarighet |
| --- | --- | --- |
| `show dbs` | Listar alla databaser | `SHOW DATABASES;` |
| `use min_databas` | Byter till (eller skapar) en DB | `USE min_databas;` |
| `show collections` | Listar tabeller | `SHOW TABLES;` |
| `db.users.find()` | Visar allt i 'users' | `SELECT * FROM users;` |
| `cls` | Rensar skärmen | `clear` |
| `exit` | Går ur skalet | `exit` |

---



* **URL:** [http://localhost:8081](https://www.google.com/search?q=http://localhost:8081)
* **Användare/Lösen:** (Det du satte i `.env` för `ME_CONFIG_BASICAUTH...`)

---

## 5. PANIC BUTTON (The "Nuke" Option)
Använd detta om du råkat förstöra datan, scriptet körde dubbelt fel, eller om du bara vill börja om från noll (Tabula Rasa).

**Steg 1: Döda allt och TA BORT datan (Volumes)**

```bash
docker compose -f docker/docker-compose.yml --env-file docker/.env down -v

```

*(Flaggan `-v` är nyckeln här. Den raderar volymen `mongo_data` så databasen glömmer allt.)*

**Steg 2: Starta om på nytt**

```bash
docker compose -f docker/docker-compose.yml --env-file docker/.env up -d

```

---

### Snabba tips för lektionen:

* **Kopiera/Klistra:** I terminalen, markera text för att kopiera, högerklicka för att klistra in (oftast).
* **Pil upp:** Använd pil upp i `mongosh` för att slippa skriva om långa queries.
* **Tab:** Tab-completion funkar även inne i Mongo!