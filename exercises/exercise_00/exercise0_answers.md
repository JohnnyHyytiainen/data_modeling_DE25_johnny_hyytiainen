# Question 0 - Library bookly.
- **Question: a) Identify the entities and attributes for each entity**

- **Answer: a) Entities = Member, Book**
    - **Entity: Member**
    - Attributes: membership_id, name, contact_info
    - **Entity: Book**
    - Attributes: title, author, isbn


- **Question: b) Determine the relationship between member and books**

- **Answer: b)**
    - A Member BORROWS a Book

- **Question: c) Draw a conceptual ERD using crow foots notation.** 

- **Answer: c)**
![Library bookly CDM using crows foot notation](/exercises/exercise_00/exercise_0_question_0_CDM.png)


# Question 1 - Conceptual ERD(CDM) to words.
- This is an ERD conceptual diagram that a database designer and the business stakeholders agreed upon in a car rental company called Carent.
![question CDM](/exercises/exercise_00/e0_q1_car_rental.png)

- Q1 a): Describe the entities in this conceptual ERD.
  - **Answer: Customer entity, Rental entity and a Car Entity.**

- Q1 b): Write out the relationship labels.
  - **Answer:**
    - **-|--- = One** 
    - **}-|--- = One or many**
    - **Places and Involves** 

- Q1 c): Describe the relationship between the entities one-to-many, one-to-one and many-to-many)

  - **Answer:**
    - One Customer to one or many Rental
      - Customer 1:M Rental
    - One Car to one or many Rental
      - Rental M:1 Car

- Q1 d): Define the relationship statement for example: "A customer can have one or more Rentals"
  - **Answer:**
    - A customer PLACES one or many Rentals.
    - A car is INVOLVED in one or many Rentals.


# Question 2 - University management system.
- A university needs a system to manage students, courses and professors.
  * Each student can enroll in multiple courses.
  * Each course is taught by one professor.
  * A teacher can teach multiple courses.

- Q2 a): Identify entities and their relationships.
  - **Answer a):**
    - Entities: Professor, Student, Course
      - Relationships: A professor teaches a Course. A student enrolls in a Course that is taught by a Professor.

- Q2 b): Come up with possible attributes for the entities
  - **Answer b):**
    - **Attributes**
      - Professor: name, employee_id, department
      - Course: course_name, course_id, points
      - Student: name, student_id, email

- Q2 c): Draw conceptual ERD with cardinalities
  - **Answer c):** See exercise_0_question_2_ERD.mmd and .png
    - **Professor ||--|{ Course }|--|{ Student**
    - **(Professor 1:N Course M:N Student)**
![question 2 CDM](/exercises/exercise_00/exercise_0_question_2_ERD.png)


- Q2 d): Define business rules (e.g. a student can enroll in max 4 courses)
  - **Answer d):**
    - A student must achieve course points of 300 to graduate.
    - A student cannot graduate while having more than 100 points in courses with failing grade.
    - A professor must continue their reasearch while teaching their specific subject.


# Question 3 - Onshop
- An e-commerce platform Onshop manages customers, orders and products.
  - A customer can place multiple orders.
  - Each order contains multiple products.
  - A product can belong to multiple categories.

- Q3 a): Identify key entities and their attributes (ex, customer_name, order_date)
  - **Answer a):** 
    - **Entities**:
      - Customer, Order, Product and Category.
    - **Attributes**:
      - Customer: name, address, email
      - Order: order_number, order_date
      - Product: product_name, price
      - Category: category_name

- Q3 b): Sketch the conceptual ERD (CDM).
  - **Answer b):**
  - **Customer ||--|{ Order }|--|{ Product }|--|{ Category**
  - (Customer 1:N Order M:N Product N:M Category)
![question 3 CDM](/exercises/exercise_00/exercise_0_question_3_ERD.png)

- Q3 c): Define business rules.
  - **Answer c):**
    - Only ONE customer can order one or more products per order number.
    - The customer is NOT limited in how much said customer wants to order, if the product is in stock, it can be ordered.
    - Add inventory balance column in Product table to keep track and make it update in real time.
    - Add 'out of stock' warning in the UX.
