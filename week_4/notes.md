## Monday July 27
* Databases
  * Database is simply organized part of a filesystem
    * Optimised for storing and retrieving data
  * Use p ENV in Sinatra files to view built-in ENV variable
  * Common database system is PostgreSQL
    * Server that runs a database, therefore can be started, stopped, and interacted with through an interface "psql"
    * To create database "CREATE DATABASE "your_name_here";" colon is very important!
    * Commands beginning with a \ are psql-specific commands (e.g. connecting to databases using \c)
    * Everything else is part of SQL (e.g. SELECT * FROM ...), so can be used with any SQL-based Relational Database.
    * To connect to database "\c name_of_database"
    * Inspect existing list of tables is \dt
    * Data is stored inside rows of database tables
      * Columns stores a specific data type (e.g. age, name)
      * Row is record (e.g. 17, alex)
      * Every row is given a unique ID
    * Create table: CREATE TABLE name(id SERIAL PRIMARY KEY, url VARCHAR(60))
    * SQL terms
      * SELECT: view and query data
        * "SELECT column_name(s) FROM table_name" : select data from a table
        * "SELECT * FROM table_name" : select all data from a table
        * "SELECT column_name(s) FROM table_name WHERE column operator value" : select only certain data from table
        * "SELECT * FROM table_name": select all data from a table
      * INSERT: add data to a table
        * "INSERT INTO table_name VALUES (value_1, value_2, etc)" : insert new rows into a table
      * UPDATE: update data
        * "UPDATE table_name SET column_name_1 = new_value_1, column_name_2 = new_value_2 etc": Update one or several columns in rows
      * DELETE: delete data
        * "DELETE FROM table_name WHERE column_name = some_value" : Delete rows in a table
      * \l: list databases
      * \du: list roles
      * \c <databasename> : connect to database
      * \dt: list tables in connected database
      * \d <databasename> : list columns on table
      * \q: quit the psql
      * "ALTER TABLE table_name ADD COLUMN new_column_name TYPE;" : Add new column to table
      * "ALTER TABLE table_name DROP COLUMN column_name;" : Drop column in table
      * "ALTER TABLE table_name RENAME column_name TO new_column_name;" : Rename column
      * "ALTER TABLE table_name RENAME TO new_table_name;" : Rename a table
      * http://www.cheat-sheets.org/sites/sql.su/
  * PG gem
    * pg gem makes a PG object available in RUby
    * We can call "connect" on the PG object, passing in the database name
      * This will return an object that we can send a query to, let's call the object "connection"
    * To retrieve bookmarks from the database, we'll call "exec" on the "connection" object, passing in a query string
    * In IRB
      1. require "pg"
      2. connection = PG.connect(dbname: 'bookmark_manager')
      3. result = connection.exec('SELECT * FROM bookmarks')
      4. result.each { |bookmark| p bookmark }
  * TablePlus
    * To connect need 3 things:
      1. Name the connection (Bookmark Manager)
      2. Where it's located (i.e, port it's on, 5432)
      3. Computer's name (melanieanderson)
      4. Database name (bookmark_manager)
  * Testing environments
    * Normal to have multiple environments in applications e.g.
      * Development environment that runs locally so you can click around it and work on it
        * Initially no data, if we run our application locally we can add data
      * Production environment that runs remotely on someone else's computer so other people on the internet can click around it
        * Contains "real" data e.g. Facebook's production environment contains real-life users, posts, comments, etc
      * Test environment that runs locally whenever you run your tests. Exists solely for tests, disappears after they finish
        * Contains no data so we can set up whatever data we need right before we run our tests
      * Staging environment where application runs remotely on someone else's computer at a secret link so you can check it's working before you move it to production
    * TO SET UP A TEST DATABASE
      1. Run psql and create database, use the SQL query saved in db/migrations to create bookmarks table
      2. Environment variable: special kind of constant that tells application something about current environment
        1. Set up Environment Variable as "test" when we run our tests
        2. Set up Bookmark model to use the bookmark_manager database when in the development environment, and bookmark_manager_test when in test database
        * When visiting /bookmarks something like this is printed to logs: {"rvm_bin_path"=>"/Users/sam/.rvm/bin", "TERM_PROGRAM"=>"Apple_Terminal", "GEM_HOME"=>"/Users/sam/.rvm/gems/ruby-2.5.0..."
          * It's a hash (has {} and =>)
          * E.g. PWD key has a value of "/Users/sam/documents/code/bookmark_manager", if we typed pwd into the command line from the bookmark_manager directory we'd get this string
          * E.g. RUBY_VERSION key has a value of "ruby-2.5.0" which is the version we're currently using
          * This object is a way of storing info about the current operating environment
        3. Add ENV['ENVIRONMENT'] = 'test' at top of spec_helper
        4. Do if else to set if ENVIRONMENT == 'test' then dbname bookmark_manager_test (when we run using rspec, the ENV variable is set to 'test' and Bookmark class connects to bookmark_manager_test), else bookmark_manager (ENV is not set so Bookmark class connects to bookmark_manager)
        5. connect unit test to PG.connect(dbname: 'bookmark_manager_test')
        6. Add the test data (connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com')", etc))
          * Tests should always run against an empty database, set up any required test data in the test itself
        7. "Drop" the database between each run of the script using TRUNCATE(clears the bookmarks table)
    * post '/bookmarks' do
      * url = params['url']
        * get the url from the submitted form data (params)
      * connection = PG.connect(dbname: 'bookmark_manager_test')
        * Connect to the test database
      * connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
        * Execute the SQL to insert the new bookmark into the database, url value of url
      * redirect '/bookmarks'
        * Redirect to the bookmarks list (home) page
      * end
    * Any database interaction SHOULD happen in the model
      * When creating class methods like Class.create etc, always refactor tests to use these methods
        * e.g. "connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")" is now equal to "Bookmark.create(url: http://www.makersacademy.com')"
  * USE POST: if you want to type in a password, etc, when you're typing in an input, will never have parameter, you're giving it secret information
  * USE GET: if you want to retrieve information from the server
