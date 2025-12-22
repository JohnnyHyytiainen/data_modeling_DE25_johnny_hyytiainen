# Logical and physical models.

**logical data model(LDM)**
- The key difference between a logical model vs conceptual model is that:
    - The conceptual model only contains the entities and relationships.
    - The conceptual model models the "real world" in broad strokes. It reflects the real world in general terms.

- The **difference** between a **logical model** and the conceptual model is that **the logical model is more specialized**. A logical model also contains the attributes for the entitys.
    - It shows the general picture as the conceptual model shows BUT more in depth and specialized.

- In the logical model you have SPECIFIED which attributes the entities SHOULD have.


**physical data model(PDM)** 
- The key difference between the physical model vs logical model is that:
    - The physical model contains more specified information vs the logical model.
    - The physical model contains primary keys(PK), foreign keys(FK), data types(domain constraints)

- domain is defined in physical data models. Example:
    - Primary key(PK)
    - Foreign key(FK)
    - Varchar(50), varchar(100), varchar(255), INTEGER, Bigint etc etc.


## Logical data model(LDM) example:

![logical data model(LDM) example](/lecture_04/ezecream_logical_data_model.png)



## Physical data model(PDM) example:

![physical data model(PDM) example](/lecture_04/ezecream_physical_data_model2.0.png)




## Logical data model(LDM) and Physical data model(PDM)
- How to think:

- **LDM**
  - Entities -> tables
  - Attribute -> columns
  - Relations -> Primary Key(PK) / Foreign Key(FK) + bridge tables.
  - Normalization/structure ("Does this look like a sensible database?)

- **PDM**
  - Data Types - Text(string/varchar), int, timestamptz, numeric, etc.
  - Constraints - Not null(NN), Unique, Check, Foreign key, on delete, etc.
  - Index (and why)
  - performance and storage(prestanda/lagring)

## Easy way to conceptualize and understand it.

- **LDM are for humans**
  - Example: If I an explain LDM for a friend. Good.
- **PDM are for the database**
  - If I can run PDM in postgres without it screaming(errors). Even better!


## The 'golden' translation (What I should be able to do in my sleep.)
- **1):**
  - 1:N (One-to-many relationship) in LDM is -> FK in PDM.
    - LDM: A customer has many orders.
    - PDM: orders.customer_id is a FK -> customers.id + NOT NULL if every order MUST have a customer.

- **2):**
  - M:N (Many-to-many relationship) in LDM is -> BRIDGETABLE in PDM.
    - LDM: Students <--> Courses.
    - PDM: Enrollments(student_id, course_id) with COMPOSITE PK (or Surrogate Key + Unique Constraint)

- **3):** 
  - Optionality in LDM -> NULL/NOT NULL in PDM.
    - LDM: One Order can have 0.. 1 coupon
    - PDM: coupon_id is NULL'able

- **4):**
  - 'Business rules' in LDM -> constraints in PDM.
    - LDM: quantity MUST be >(greater than) 0
    - PDM: CHECK (quantity > 0)

- **5):**
  - 'UNIQUE in real life' -> UNIQUE in PDM.
    - email, social_security_number etc: UNIQUE.
    - **Think: You would rather stop duplicates at the door when trying to enter than try to clean up afterwards like a crime scene cleaner (or try to find, dig them up, brush away all the dust and clean them as an archeologist)**

## Quick checklist.

- **LDMs SHOULD have:**
  - All entitys + relationships + cardinality
  - PK marked (Conceptually -> 'id')
  - Bridgetable for N:M / M:N (Many-to-many N and M are interchangeable) or at least a note about it.

- **PDMs SHOULD have:**
  - Exakt DATA TYPES
  - PK/FK + ON DELETE-way of thinking
  - NOT NULL where its mandatory
  - UNIQUE on natural keys 
  - 1-3 IMPORTANT indexes (Do not exaggerate with index)
  
  

## Remember, when to use natural keys vs surrogate keys:

**Product Table (Natural Key): SKU (example: 'T-SHIRT-RED-L').**  

**Customer Table (Natural Key): EmailAddress (example: 'john.doe@example.com').**  

**Data Warehouse (Surrogate Key): CustomerID (example: 1001, 1002) that never changes, even if the email changes.** 
