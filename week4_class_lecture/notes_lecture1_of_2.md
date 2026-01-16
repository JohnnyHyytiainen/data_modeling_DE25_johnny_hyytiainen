# Week 4 lecture notes for lecture 1/2 2026/01/15

## Normalization (Will be using the LDM we made during week 2. 'example_library_logical_model.png')


- Talking over this weeks lectures and topics and topics for next week(week 5).

- Todays (2026-01-15) topics include.
  - repeat docker implementation (Will probably spin up a container for the LDM we did during week 2)
  - 07_normalization.
 
 ### Theory:
 - How to think when it comes to data modeling and databases. Taking our lab as an example -> YrkesCo.  

- **Step 1: the theoretical part.**
  - Understand the business requirements.  

     - Create the data models.  
       - Create the CDM(conceptual model)
       - Create the LDM(logical model) -> Requires 3NF and composite entities. **(Normalization!)**  
       - Create the PDM(physical model)  

- **Step 2: The implementation** (From the blueprint to a real DataBase)
  - Setup of the real Database (SQLite3, DuckDB, PostgreSQL, etc etc)  

    - Choose the server(computer) --> (for the lab we're using the **docker container** as the server and not on our computer that is why we're using docker commands and psql commands. Just to be able to share the container so its replicable)  

    - Install the DB program(PostgreSQL for example)  
    - Create the DB(DBs) example: yrkco_db  
    - Create the schema(skol_info)
    - Tables (student, kurs, program, klass, lärare etc etc)  
       - Include keys, column constraints and what else is required from **step 1** (The business requirements)  



- **Step 3: Validation part** (Do some testing queries just to show that it works properly and as expected)  
- **Validate a subset of tables**
- **Show that this works in a certain table:**
    - INSERT OPERATION works if the data fullfills all the column constraints.  

    - INSERT OPERATION fails if the data doesnt fullfill all column constraints.