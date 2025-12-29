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