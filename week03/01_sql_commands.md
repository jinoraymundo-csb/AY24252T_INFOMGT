- [A. SQL Server - Database Objects](#a-sql-server---database-objects)
  - [I. Tables](#i-tables)
  - [II. Views](#ii-views)
  - [III. Stored Procedures](#iii-stored-procedures)
  - [IV. Functions](#iv-functions)
  - [V. Indices](#v-indices)
  - [VI. Triggers](#vi-triggers)
- [B. SQL Commands](#b-sql-commands)
  - [I. DDL (Data Definition Language)](#i-ddl-data-definition-language)
  - [II. DQL (Data Query Language)](#ii-dql-data-query-language)
  - [III. DML (Data Manipulation Language)](#iii-dml-data-manipulation-language)
  - [IV. DCL (Data Control Language)](#iv-dcl-data-control-language)
  - [V. TCL (Transaction Control Language)](#v-tcl-transaction-control-language)


# A. SQL Server - Database Objects

In SQL Server, database objects are essential components that allow to store and manage data effectively.
A database object in SQL Server refers to the defined structure that contains data or metadata. These objects can be created, modified, and deleted as needed to support the database operations and apply the business rules of an application.

## I. Tables

The fundamental building blocks of a database, where data is stored in **rows** and **columns** where

- ***each row represents a record***
- ***each column represents a field/attribute/property of a record***

```
CREATE TABLE Crop (
    CropID INT PRIMARY KEY,
    Name VARCHAR (50),
    CropType VARCHAR(20),
    SellingPrice DECIMAL(10, 2)
);

INSERT INTO Crop (CropID, Name, CropType, SellingPrice)
  VALUES
(1, 'Cauliflower', 'Vegetable', 175.00),
(2, 'Melon', 'Fruit', 250.00),
(3, 'Pumpkin', 'Vegetable', 320.00);
```

---

## II. Views

These are **virtual tables** that provide a way to present data from one or more tables, which can simplify complex queries, provide data security (via access restriction to specific columns), and present data in a specific format.

```
CREATE VIEW HighYieldingCrops AS
  SELECT Name, CropType
  FROM Crop
WHERE SellingPrice > 200;
```

---

## III. Stored Procedures

These are precompiled SQL statements that can be executed to perform a specific task, which enables reusable code, contains business logic and can accept parameters. Programming Language libraries have methods to call these.

```
CREATE PROCEDURE GetCropByID
    @CropID INT
AS
BEGIN
    SELECT * FROM Crop WHERE CropID = @CropID;
END;
```

Then to call this stored procedure:

```
EXEC GetCropByID @CropID = 2;
```

---

## IV. Functions

Similar to stored procedures but are more focused on performing calculations and can return a value. They can be **scalar** (a single value)  or table-valued (returns a table)

```
CREATE FUNCTION GetCropCount()
RETURNS INT
AS
BEGIN
    DECLARE @Count = INT;
    SELECT @Count = COUNT(*) FROM Crop;
    RETURN @Count;
END;
```

Then to call this function:

```
SELECT dbo.GetCropCount() AS TotalCrops;
```

---

## V. Indices

These improves query performance by allowing SQL Server (or any DBMS) to find rows more quickly. They can be attached or set on one or a combination of columns in a table.

```
CREATE INDEX IDX_CropName ON Crop (Name);
```

---

## VI. Triggers

Triggers are special types of stored procedures that automatically execute in response to specific events on a table, such as `INSERT`, `UPDATE`, or `DELETE` operations. They are useful for applying business rules or maintaining data integrity.

```
CREATE TRIGGER afterInsert
ON Crop
AFTER INSERT
AS
BEGIN
    PRINT 'Added new Crop';
END;
```

---

# B. SQL Commands

SQL commands are typically categorized into 5 main types. Each with its own purpose for managing databases, and they vary amongst SQL variants (vendors). 

## I. DDL (Data Definition Language)

These are the commands that are used in a.) **defining**, b.) **altering**, and c.) **deleting** database components such as **tables**, **indices** and **schemas**

| Command | Description | Syntax |
| --- | --- | --- |
| `CREATE` | for creating database or objects (table, index, function, views, stored procedures, and triggers) | `CREATE TABLE table_name (column1 data_type, column2 data_type, ..., columnN data_type);` |
| `DROP` | for deleting objects from the database | `DROP TABLE table_name;` |
| `ALTER` | for modifying existing objects in a database | `ALTER TABLE table_name ALTER COLUMN column_name data_type;`
| `TRUNCATE` | Clear or remove all records in a database table | `TRUNCATE TABLE table_name;` |

---

## II. DQL (Data Query Language)

Used for performing queries on a table or a view to fetch data from

| Command | Description | Syntax |
| --- | --- | --- |
| `SELECT` | Retrieve data | `SELECT column1, column2, ..., columnN FROM table_name WHERE condition;` |

```
SELECT CropID, Name FROM Crop WHERE CropType = 'Vegetable';
```

---

## III. DML (Data Manipulation Language)

Commands that modify data stored in a database table

| Command | Description | Syntax |
| --- | --- | --- |
| `INSERT` | Adds new record(s) to a table | `INSERT INTO table_name (column1, column2, ..., columnN) VALUES (value1, value2, ..., valueN);` |
| `UPDATE` | Updates existing record(s) in a table | `UPDATE table_name SET column1 = value1, column2 = value2, ..., columnN = valueN WHERE condition;` |
| `DELETE` | Deletes existing record(s) in a table | `DELETE FROM table_name WHERE condition;` |

---

## IV. DCL (Data Control Language)

Commands that are used to control rights and permissions unto database objects. These vary per database provider.

| Command | Description | Syntax |
| --- | --- | --- |
| `GRANT` | Assigns new privileges to a user account unto database objects | `GRANT privilege_type ON object_type TO user;` |
| `REVOKE` | Removes previously assigned database object privileges to a user account | `REVOKE privilege_type ON object_type object_name FROM user;`

```
GRANT SELECT, UPDATE ON Crop TO farmer;
```

---

## V. TCL (Transaction Control Language)

Transactions group a set of tasks into a **single execution unit**. Each transaction begins with a specific task and ends when all the tasks in the group are successfully completed. If any of the tasks fail, the transaction fails.

| Command | Description | Syntax |
| --- | --- | --- |
| `BEGIN TRANSACTION` | Starts a new transaction | `BEGIN TRANSACTION transaction_name;` |
| `COMMIT` | Saves all changes in a transaction | `COMMIT;` |
| `ROLLBACK` | Unapplies all intended changes made during the transaction | `ROLLBACK;` |
| `SAVEPOINT` | Creates a savepoint within the current transaction | `SAVEPOINT savepoint_name;` |

```
BEGIN TRANSACTION;
UPDATE Crop SET SellingPrice = SellingPrice * 1.10;
SAVEPOINT before_price_update;
UPDATE Crop SET CropType = 'veggies' WHERE CropType = 'vegetable';
ROLLBACK TO SAVEPOINT before_price_update;
COMMIT;
```

---
