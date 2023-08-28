# SQL
A repository meant to store things I have learn about SQL via practice. 

## Primary Key 
Unique values for each row of the column and value cannot be NULL.

```sql
id INT,
name VARCHAR(50),
age INT,
PRIMARY KEY (id, name);     /* can be combination of one or more */
```
## Foreign Key
Prevents actions that would destroy the link between tables
```sql
CREATE TABLE temp (
    cust_id INT;
    FOREIGN KEY (cust_id) REFERENCES customer(id);      /* Kis column ko Foreign key banana chaahte hain, aur kis table ki primary key ko refer karte hue */
);
```

## Default
Gives default values as specified to those elements which do not have explicitly provided values.
```sql
salary INT DEFAULT 25000,
```

## Check Constraint
Used to limit the value range that can be placed in a column. 
If you define a CHECK constraint on a column it will allow only certain values for this column.
```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);
```
If you define a CHECK constraint on a table it can limit the values in certain columns based on values in other columns in the row.
```sql
CREATE TABLE Persons (
    ID int NOT NULL,
    Age int,
    CHECK (Age>=18)
);
```

## DISTINCT
DISTINCT clause is used to remove duplicate records from the table and fetch only the unique records. The DISTINCT clause is only used with the SELECT statement. 
```sql
SELECT DISTINCT expressions  
FROM tables  
[WHERE conditions];
```

## WHERE Clause
Used to add conditions for filtering in Select statement. 
```sql
SELECT * FROM students WHERE marks >= 80 AND city="Lucknow";
SELECT * FROM students WHERE marks >= 80 OR city="Lucknow";
SELECT * FROM students WHERE marks BETWEEN 80 AND 90;   /* both values inclusive */
SELECT * FROM students WHERE city IN ("Delhi", "Mumbai"); /* also can use "NOT IN" */
```

## Limit 
Sirf shuru ke kuch rows dikhata hai, as specified by the limit.
```sql
SELECT * FROM students WHERE marks >= 80 LIMIT 3;   /* prints only 3 rows */
```

## Order
Sort data in ascending or descending order.
```sql

```