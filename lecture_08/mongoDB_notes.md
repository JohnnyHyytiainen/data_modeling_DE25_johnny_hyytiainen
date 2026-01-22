# nagivating in mongoDB
(cheatsheet composed by LLM and NOT ME)

**MongoDB "Survival Kit"**. 

Eftersom du kommer från SQL-världen har jag lagt upp den som en "översättningstabell". Det är oftast det snabbaste sättet att få det att klicka.

Kopiera in detta i dina `lecture_notes.md`!

### 1. Grunderna (Hitta runt)

| SQL | MongoDB | Kommentar |
| --- | --- | --- |
| `SHOW DATABASES;` | `show dbs` | Listar alla databaser. **Obs:** En tom DB syns inte förrän du sparar data i den. |
| `USE yrkesco_db;` | `use yrkesco_db` | Byter databas. Om den inte finns, skapas den automatiskt när du skriver data. |
| `SHOW TABLES;` | `show collections` | Listar alla collections (tabeller) i nuvarande databas. |

---

### 2. CRUD (Create, Read, Update, Delete)

Antag att vi jobbar med en collection som heter `students`.

#### **C**reate (Skapa)

* **En rad:**
```javascript
db.students.insertOne({ name: "Johnny", age: 32, role: "Data Engineer" })

```


* **Flera rader:**
```javascript
db.students.insertMany([
    { name: "Sara", age: 25 },
    { name: "Nils", age: 28, skills: ["Python", "SQL"] } ]) <--- // Notera arrayen!

```



#### **R**ead (Läsa)

* **SELECT * FROM students;**
```javascript
db.students.find()

```


* **Gör det läsbart (Pretty Print):**
```javascript
db.students.find().pretty()

```


* **Filtrera (WHERE name = 'Johnny'):**
```javascript
db.students.find({ name: "Johnny" })

```


* **Hämta bara en (LIMIT 1):**
```javascript
db.students.findOne({ name: "Johnny" })

```



#### **U**pdate (Uppdatera)

* **UPDATE students SET age = 33 WHERE name = 'Johnny';**
```javascript
// VIKTIGT: Du måste använda $set, annars skriver du över HELA dokumentet!
db.students.updateOne(
    { name: "Johnny" },   // Filter (Vem?)
    { $set: { age: 33 } } // Update (Vad?)
)

```



#### **D**elete (Ta bort)

* **DELETE FROM students WHERE name = 'Nils';**
```javascript
db.students.deleteOne({ name: "Nils" })

```



---

### 3. De vanligaste operatorerna (WHERE-klausuler)

När du ska filtrera data inuti `.find({ ... })`.

| Operator | Betydelse | Exempel |
| --- | --- | --- |
| `$eq` | Equal (`=`) | `{ age: { $eq: 25 } }` (oftast skriver man bara `{ age: 25 }`) |
| `$gt` | Greater Than (`>`) | `{ age: { $gt: 30 } }` |
| `$lt` | Less Than (`<`) | `{ age: { $lt: 20 } }` |
| `$gte` / `$lte` | `>=` / `<=` | `{ age: { $gte: 18 } }` |
| `$in` | IN (`IN (...)`) | `{ role: { $in: ["Dev", "Admin"] } }` |

---

### Pro-Tips för ikväll

1. **Tab completion:** Tryck `Tab` i terminalen/konsolen. Mongo är ganska bra på att gissa vad du vill göra.
2. **`cls`:** Om du kör i Mongo-shell och skärmen blir kladdig, skriv `cls` för att rensa (precis som i Windows-terminalen).
3. **Glömt `$set`?** Det är det vanligaste misstaget i början.
* `db.coll.update({name: "A"}, {age: 10})` -> **TAR BORT** namnet och ersätter hela objektet med *bara* `{age: 10}`.
* Använd alltid `{ $set: { ... } }` om du bara vill ändra ett fält.

