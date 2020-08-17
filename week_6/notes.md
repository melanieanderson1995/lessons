##Thursday 13 Aug
* Foreign keys
  * Foreign key is a key used to link two tables together
  * Field or collection of fields in one table that refers to the primary key in another table
  * Table containing foreign key is child table, table containing primary key is parent table
  * e.g. persons: [PersonID = 1, LastName = hansen, Age = 30] orders: [OrderID = 1, OrderNumber = 24562, PersonID = 1]
    * PersonID in the parent table is the primary key, personID in the child table is the foreign key
    * Foreign key constraint is used to prevent actions that would destroy links between tables
    * Foreign key prevents invalid data from being inserted into the foreign key column, MUST be one of the values contained in parent column
    * SQL creates a foreign key on the PersonID column when child table is created
      * CREATE TABLE Orders ( OrderID int NOT NULL, OrderNumber int NOT NULL, personID int, PRIMARY KEY (OrderID), FOREIGN KEY (PersonID) REFERENCES Persons(PersonID));
    * To allow naming of foreign key constraint and for defining a foreign key constraint on multiple columns use the following syntax
      * CREATE TABLE Orders ( OrderID int NOT NULL, OrderNumber int NOT NULL, PersonID int, PRIMARY KEY (OrderID), CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES persons(PersonID));
    * To create foreign key constraint on the PersonID column when the Orders table is already created
      * ALTER TABLE Orders ADD FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
    * To allow naming of a foreign key constraint and for defining a foreign key constraint on multiple columns use
      * ALTER TABLE orders ADD CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID) REFERENCES Persons(PersonID);
    * To drop a foreign key constraint
      * ALTER TABLE Orders DROP FOREIGN KEY FK_PersonOrder;
  1. Go to form page for new user
  2. Put in username email password
  3. Save that as parameters
  4. In controller we create new using the parameters
  5. Save that to database
  6. Create new user object
  7. On our listings table, each listing will have a userid associated with it for the poster, userid is the foreign key because thats same id user has on user table
* RESTful
  * Renaming to fit naming conventions
  * /login = sessions/new
  * /signup = user/new
  * /sign_out = sessions/destroy
  * Go into ERBs and update them
* BCrypt is a gem that encrypts passwords
  * encrypted_password = BCrypt::Password.create(password)
* TRUNCATE TABLE users RESTART IDENTITY CASCADE;
  * Truncates table with foreign key
