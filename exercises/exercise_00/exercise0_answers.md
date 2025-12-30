# Question 0 - Library bookly.
- **Question: a) Identify the entities and attributes for each entity**

- **Answer: a) Entities = Member, Borrow, Book**
    - **Entity: Member**
    - Attributes: member_id, member_name, phone
    - **Entity: Borrow**
    - Attributes: borrow_id, borrow_date, member_id, book_id
    - **Entity: Book**
    - Attributes: book_id, title, author, ISBN_nr, copy_nr


- **Question: b) Determine the relationship between member and books**
  - **Answer: b)**
    - One and only one Member Borrows zero to many Books

- **Question: c) Draw a conceptual ERD using crow foots notation.** 
  - **Answer: c)**
![Library bookly CDM using crows foot notation](/exercises/exercise_00/exercise_0_question_0_CDM.png)


# Question 1 - Conceptual ERD(CDM) to words.
- This is an ERD conceptual diagram that a database designer and the business stakeholders agreed upon in a car rental company called Carent.
![question CDM](/exercises/exercise_00/exercise_0_question_1_CDM.png)

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


# Question 4. Theoretical questions

- Q4 a): What is a conceptual data model and why is it important?
  - **Answer a):** 
    - A Conceptual data model or CDM is important to get a top down(high level) overview over what is needed and to conceptualize the "flow". It is a business focused "blueprint" that shows the key entities like, customer-order-product and their relationships (One-many(1:N), one-one(1:1), many-many(N:M / N:N), many-one.(N:1)). It defines ***WHAT*** data matters without going in to too much technical detail for stakeholders. It is a crucial component for getting stakeholders and the technical part of the team aligned. It simplifies the complexity, it gives a foundation for the DB design, it provides a clear framework for defining terms to ensure data quality and it captures the business rules and aligns the business teams and IT teams to get everyone on the same page.

- Q4 b): Storing age in a database, is that a good or a bad idea and why?
  - **Answer b):**
    - You CAN store age in a DB. It is not the best idea to do but you can do it. Here is why it isnt the best idea(read: BAD idea)
      - Age is volatile, depending on how you messure age it gets outdated fast. Every day that passes means +1 day. Are you supposed to update an ENTIRE database day by day? I don't think so, that would be a nightmare and not cost effective at all.
      - Storing age in a database violates database normalization. What you **SHOULD** do instead if you want to store the age is store the date of birth since that is STATIC(doesn't change. Think of static ip vs dynamic ip)
      - Storing age by date of birth(DOB) offers you more flexibility, meaning that you could easily filter/sort by the date of birth > 18 to filter out everyone that is not of age for example.

- Q4 c): What are the three types of data structures, and how do they differ?
- Q4 d): Give examples of how each data structure is used in real world applications
  - **Answer c+d):**
    - There are three main data types. They are: Structured, Semi-structured and unstructured. They are primarily different in their schema(organization, how they are organized.)
      - **Structured data** has a fixed predefined schema that fits into tables with rows and columns neatly.(Think Relational databases, csv files(SQL tables). Spreadsheets or transaction records. They are easy to search and easy to analyze with tools like SQL. They are more rigid and not as flexible).  
      Structured data is used everyday by, retail and e-commerce, the finance sector, in the healthcare sector, in the logistics sector to mention a few. Basically you can see it as this, any system that requires precise and organized records with defined fields uses structured data because it maintains its consistency and enables powerful analysis over time.   
      - **Semi-structured data** is not as organized and rigid as structured data but it still has some organized properties. (Think json, Key:value pairs, or XML files).  
      Semi-structured data is used daily as well by e-commerce, DevOps, IoT, the healthcare sector to mention a few. Since this data structure is a bit more flexible than structured data it is used in many sectors mentioned above. To name a few with examples: E-commerce uses semi-structured data for product listings using JSON/XML format where different products have varying details(think pants has colors/sizes, or a mouse with its sensor specs etc). Social media, comments from users, their different interactions or their posts are usually stored in JSON format or NoSQL DBs. IoT uses semi-structured data for example sensor readings they as well use JSON files or other types of log files. The healthcare sector uses semi structured data for example patient records that needs to be a bit more flexible as well as structured data.  
      - **Unstructured data** is none of the other two mentions. The biggest difference here is when you compare to Structured data and unstructured data. Unstructured data lacks any predefined format or schema. This type of data is not a good fit for RDBMs even though the largest category of data is represented in this section and it is growing very fast. Unstructured data is a lot more challenging to store and to analyze, it comes from many sources, think emails, social media content, text documents, transcripts. So basically: Audio, Video, Photos, Text documents.

      - **Special mentions and how they differ:** IoT-data(Internet of Things) should also be mentioned since IoT-data is in all three categories above.
        - Structured data offers efficiency, accuracy and makes it easy to analyse and of course ease of use and access.  
        - Semi-structured data offers more flexibility, vs structured data and its easier to scale. It is also easier for humans to read and understand without deeper knowledge in different coding languages. To use a quote I found online "Human-Readable & Machine-Parsable: Offers a balance where humans can understand it (tags, labels) and machines can process it efficiently (JSON, XML)".  
        - Unstructured data, isn't something im very knowing of unless its using the data in video/audio format as an end user. But from my limited undestanding unstructured data can often provide tons of context, nuances and details that are missed in structured data that is when its analyzed properly. Unstructured data can provide hidden insights in form of patterns, sentiments and connections. It can be collected a lot faster and easier than both structured and semi-structured data and it also easier and cheaper to store since it has more options compared to structured data that is very rigid compared to unstructured.


- Q4 e): What is cardinality in data modeling and why is it important?
  - **Answer e):**



- Q4 f): What are the three types of data structures and how are they different from each other?
  - **Answer f):** 
    - I am assuming that this question asks about CDM, LDM and PDM (Conceptual data model, Logical data model and Physical data model) and NOT Hierarchical, Network and Relational since we are focusing on CDM, LDM and PDM models in this course.  

      - **CDM** Conceptual data model refers to a high level model. Think if a map of the subway system, it is not 1:1 in scale with all the turns, how far out it goes in the city etc. It is as the C says its CONCEPTUAL. It is meant to give everyone viewing it an overview over the system(a birds eye view of the system). It focuses on showing the relationships between the different entities with its most basic attributes to give the overall structure of the data. It steers clear of the more intricate technical details and focuses on the key data requirements and the relationships that connect them.

      - **LDM** Logical data model. This is an evolution of the CDM, more technical and gives you a more comprehensive exploration of the data elements, their attributes and their relationships. A LDM is primarily meant to show the structure of the data in a way that is easily understood and useful for data architects and business analysts. They offer more detail than the conceptual model which wouldn't be that useful for a stakeholder meeting where its more focus on the business aspect of it all and not the technical side of it.

      - **PDM** Physical data model. This is the last step in the evolution chain. CDM -> LDM -> PDM. If CDM is for business and non technical people with the overview, LDM is for the technical people with more details such as (PK, FK, SK, NK, UK, data types, NN values etc) the Physical data model is that and more. I like to think of it like this: LDM's are for humans while PDM's are for machines. The key difference between the physical model vs logical model is that:
        - The physical model contains more specified information vs the logical model.
        - The physical model contains primary keys(PK), foreign keys(FK), data types(domain constraints)


