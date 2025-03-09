- [Week 08 - Working with Tables](#week-08---working-with-tables)
  - [I. How Tables are Created](#i-how-tables-are-created)
    - [A. Creating a Table](#a-creating-a-table)
    - [B. Column Names](#b-column-names)
    - [C. Data Type](#c-data-type)
    - [D. Primary Keys](#d-primary-keys)
  - [II. Constraints](#ii-constraints)
    - [A. `NOT NULL`](#a-not-null)
    - [B. `UNIQUE`](#b-unique)
    - [C. `DEFAULT`](#c-default)
    - [D. `CHECK`](#d-check)
    - [E. Foreign Keys](#e-foreign-keys)
    - [F. Indexes / Indices (?)](#f-indexes--indices-)
  - [III. Adding Rows to a Table](#iii-adding-rows-to-a-table)
  - [IV. Deleting Rows from a Table](#iv-deleting-rows-from-a-table)
  - [V. Updating Rows](#v-updating-rows)
  - [VI. Altering the Table](#vi-altering-the-table)


# Week 08 - Working with Tables

For the most part, we have used the `SELECT` statement for extracting data from the database. The `SELECT` statement, with its various clauses, is often referred to as the **DQL—the Data Query Language**.

SQL does much more than allow you to select data. Among other things, it allows you to *manipulate* the data.

The three main operations in SQL in data manipulation are:

1. `INSERT` statements are how you add data into a table
2. `UPDATE` statements allow you to change existing data in a table.
3. `DELETE` is used to delete one or more rows from a table.

Collectively, these statements are part of what is called the **DML - Data Manipulation Language**

Also, there are other statements which does not manipulate the data, but the actual database structures such as **tables** and **views**

- `CREATE` is used to create a new table, view, or other objects in the database.
- `DROP` is used to remove a `CREATE`d object
- `ALTER` will allow you to make changes to an existing object
- `TRUNCATE` can be used to "reset" a table. Which means deleting all the rows and restarting the counter (auto-numbering) if there's any

Collectively, these statements are part of what is called the **DDL - Data Definition Language**

## I. How Tables are Created

### A. Creating a Table

A database table is created with a `CREATE TABLE` statement, for example:

```
CREATE TABLE customers (
  id INT identity(1,1) PRIMARY KEY NONCLUSTERED,
  email NVARCHAR(60) NOT NULL UNIQUE CHECK(email LIKE '%_@_%'),
  familyname NVARCHAR(40) NOT NULL,
  givenname NVARCHAR(40) NOT NULL,
  gender CHAR(1),
  street VARCHAR(64),
  town VARCHAR(48),
  state VARCHAR(3),
  postcode CHAR(4) CONSTRAINT ck_customers_postcode CHECK (postcode like '[0-9][0-9][0-9][0-9]'),
  dob date CHECK(dob<=dateadd(year,-18,current_timestamp)),
  phone char(10)	CONSTRAINT ck_customers_phone CHECK (phone like '[01][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'),
  spam bit default 0,
  height decimal(4,1),
  registered date NOT NULL
);
```

The preceding details generally define the columns in the table. They follow this pattern:

`name type [constraints etc ...]`

**Constraints** are additional rules which *constrain* (limit) which values are valid for that column.
Constraints and other properties can be added in three ways:

1. Added inline with the definition of the column.
2. Added separately in the `CREATE TABLE` statement, typically at the end
3. Added after the table has been created, with a separate statement

> [!NOTE]
> To remove a table, SQL gets a little pedantic. You might think that you can "delete" a table, but that will not work. `DELETE` is reserved for rows within a table. Instead, you `DROP` the table.

```
DROP TABLE <table_name>;
DROP TABLE IF EXISTS <table_name>;
```

### B. Column Names

Column names should not interfere with the SQL language and should avoid special characters such as spaces or hyphens, unless you opt to use double quotes. 

Column names should be distinct, you can't have two columns with the same name.

There are no *special names*. For example, naming a column as "id" does not make it a primary key. It's up to the developer to think of a suitable name. There are also no special positions. You may define columns in any order that you like.

### C. Data Type

In SQL, there are three main data types and some variations between types:

| Numbers | Dates | Strings |
| --- | --- | --- |
| `integer`, `decimal()`, `float` | `date`, `datetime` | `char()`, `varchar()` |

There may be other data types, such as **Boolean** (true/false value) or `BLOB` (binary data)

| Type | Description |
| --- | --- |
| `INT` | a.k.a. INTEGER: A whole number, in this case, ranging between -2,147,483,648 to 2,147,483,647 |
| `DECIMAL(4, 1)` | a.k.a. NUMERIC: This is a decimal with a fixed number of decimal places. The example notation here means "up to 4 digits, including one fixed decimal place |
| `VARCHAR(60)` | A string which can stretch to a maximum of 60 characters long |
| `CHAR(4)` | A string which is fixed at four characters, If you enter fewer than four characters, it will be padded with spaces |
| `BOOLEAN` | A value which is either `true` or `false` |
| `DATE` | A date without a time |
| `TIMESTAMP` | a.k.a. `DATETIME`: A date which includes the time down to a tiny part of a second |
 
### D. Primary Keys

A primary key is the unique identifier for each row in the table. It does not need to have a particular name, and it does not have to be the first column.

In principle, any column with unique values, such as the customer's email address, *might* have qualified as a primary key. A good primary key, however, has the following features:

1. guaranteed to be unique
2. are never `NULL`
3. are unlikely to change

> [!TIP]
> It's the last feature that makes the email address a bad candidate for primary key. It's possible for a customer to change their email address.

Generally, there are two types of a primary key:

1. Natural Primary Key - which represents real data. For example, the customer's email address or a country's unique two or three letter code.
2. Surrogate Primary Key - has no intrinsic value, an arbitrary code which tells us nothing else about the data.

A primary key may be defined:

inline, along with the column definition
```
CREATE TABLE sometable (
  id INT PRIMARY KEY,
  ...
);
```

or as a separate expression within `CREATE TABLE`
```
CREATE TABLE sometable (
  id INT,
  ...
  PRIMARY KEY (id)
);
```

This second variation allows the use of `composite/compound` primary keys
```
CREATE TABLE deck (
  suit VARCHAR(7),
  value VARCHAR(5),
  ...
  PRIMARY KEY (suit, value)
)
```

> [!TIP]
> When defining numeric surrogate primary keys, it makes sense to have them auto-generated. It varies per DBMS. In MSSQL, it's `identity()`, where the first parameter is the number you want to start with, and the 2nd parameter tells how much to increment per new record

```
CREATE TABLE customers (
  id INT identity(1, 1) PRIMARY KEY,
  ...
);
```

---

## II. Constraints

A **constraint** is any rule which limits what constitutes a valid value. Generally, if you attempt to enter a value which violates the constraint, the DBMS will raise an error and won't let you.

The first constraint is the data type itself. If you define a column as a number, then you can't put a string in it.

The data type also includes additional constraints such as the length of a string or the precision of a number.

1. `NOT  NULL` which states that the column cannot be empty
2. `UNIQUE` which will disallow duplicate values in the column
3. `DEFAULT` which will automatically supply a value for a new row if a value was not specified
4. `CHECK` which is a custom rule
5. Foreign Keys which should match a value from another table


### A. `NOT NULL`

The second constraint you might encounter is `NOT NULL`. This means what it looks like: the data cannot be `NULL`; in other words, a value is required at all times.

A column which may contain a value is sometimes said to be **nullable**

> [!IMPORTANT]
> Having a nullable column does not mean that you do not actually need the value. For example, you can't ship an order to a customer unless you know their address. Being nullable simply means that you can gather this information at a later date, and not necessarily immediately upon adding the row.

### B. `UNIQUE`

There's no reason two customers can't have the same date of birth, but you wouldn't expect them to have exactly the same email address. SQL neither knows nor cares about what any of this means, so you need to tell the DBMS about this yourself.

Marking a column as `UNIQUE` causes the DBMS to ensure that a new email address cannot be the same as one for another customer. 

### C. `DEFAULT`

Technically, this is regarded as a constraint, though you might be forgiven for wondering whether that's right

### D. `CHECK`

The preceding constraints are fairly broad and involve some basic properties of SQL data. Sometimes, you need a constraint which can be regarded simply as specific your environment. This is sometimes referred to as a **business rule**.

The `CHECK` constraint is a general-purpose miscellaneous constraint which allows you to use anything which SQL understands. It takes this form:

```
CHECK (condition)
```

The preceding condition looks exactly like a `WHERE` clause. In essence, it means that if you were looking for a match `(WHERE ...)`, then this one should be included. With the constraint, all values (except `NULL`, of course, which is not a value) should match.

```
-- match 4 digits
CHECK (postcode like '[0-9][0-9][0-9][0-9]')

-- birth date before (up to) date of death:
CHECK (born <= died)
```

### E. Foreign Keys

A **foreign key** is also a type of constraint. In this case, it requires that the value in one table must match a value in the other table. It takes this form:

```
column type REFERENCES table(column)
```

Each column must have a data type, and the referenced column must have exactly the same type. You will notice that the preceding form does not actually use the term "foreign key"

> [!NOTE]
> Foreign key is defined in the table which references the other - from the "child" table to the "parent" table, not the other way around

### F. Indexes / Indices (?)

As a rule, the SQL standard doesn't tell the DBMS how to do its job, and, among other things, it leaves internal storage and organization up to the software.

One of the consequences is that data may not be stored in any particularly useful order; it's probably stored in a way that's fastest and most efficient for the software. That's why you can't be sure what order the results of a `SELECT` statement will come in unless you force it with an `ORDER BY` clause.

To create an index, the SQL statement is:

```
CREATE INDEX name ON table(columns);
```

> [!TIP]
> Best practice is to add an index on columns frequently searched and sorted for

## III. Adding Rows to a Table

To add rows, use the `INSERT` statement:

```
INSERT INTO table(columns)
  VALUES (values);
```

for example:
```
INSERT INTO customers (givenname, familyname, email, registered)
  VALUES 
    ('Nandor', 'de Laurentis', 'relentless@alqolnidar.com', current_timestamp),
    ('Laszlo', 'Cravensworth', 'jackiedaytona@phoenix.az', current_timestamp),
    ('Nadja', 'Antipaxos', 'nadja@antipaxos.gr', current_timestamp),
    ('Colin', 'Robinson', 'callme@colinrobinson.org', current_timestamp)
  ;
```

When it comes to the columns list, there are some rules:

1. All `NOT NULL` columns *must* be included, unless they have `DEFAULT` constraint
2. The values must match the column in number (count) and in respective types
3. SQL really does not care if you get the actual values wrong, such as, swapping `givenname` and `familyname`, as long as the values are compatible
  
---

## IV. Deleting Rows from a Table

```
DELETE 
   FROM table;
```

When this preceding statement is executed, it will delete **all** rows, that's why it's important to always(!) use `DELETE` with a `WHERE` clause

```
DELETE 
  FROM table
  WHERE ...;
```

As a safeguard, SQL allows the use of **transactions**:

```
BEGIN TRANSACTION;
DELETE FROM customers;
SELECT * FROM customers;
ROLLBACK;
SELECT * FROM customers;
```

A **transaction** is a group of statements which allows you to reverse any changes, using `ROLLBACK`. If you want to keep the changes, you use `COMMIT` instead. 

---

## V. Updating Rows

To change values on an existing row, use the `UPDATE` statement:

```
UPDATE table
SET column = value
WHERE ...
```

> [!IMPORTANT]
> Similar to the `DELETE` statement, always (!) use a `WHERE` clause on `UPDATE` statements, unless you want your change to be applied on the entire table

---

## VI. Altering the Table

Once you have a table and started populating it, you may discover that you need to make changes to the table. It might be too late to drop the table and recreate it, but you can use the `ALTER` statement to make some changes after the event.

Typical changes are:
- adding new columns
- dropping existing columns
- adding an index
- changing the column's data type

```
--  Add Column
ALTER TABLE customers
ADD country VARCHAR(60);

--  Drop Columns
ALTER TABLE customers
DROP COLUMN town, state, postcode;

--  Add Foreign Key
ALTER TABLE customers
ADD townid INT REFERENCES towns(id);

--  Add Check Constraint
ALTER TABLE saleitems
ADD CHECK (quantity>0);

--  Drop Constraint
ALTER TABLE customers
DROP CONSTRAINT ck_customers_postcode;

--  Add NOT NULL constraint
ALTER TABLE saleitems
ALTER COLUMN quantity SET NOT NULL;

-- Add Default
ALTER TABLE salesitems
ALTER COLUMN quantity SET DEFAULT 1;

```

---