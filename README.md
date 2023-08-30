# SQL


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
Used to add conditions for filtering in Select statement. It can be used with SELECT, UPDATE, DELETE statements. 
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
Sort data in ascending or descending order. If no keyword is specified after the column based on which we have to sort the records, in that case, the sorting will be done by default in the ascending order.
```sql
SELECT ColumnName1,...,ColumnNameN FROM TableName  ORDER BY ColumnName ASC; 
SELECT ColumnName1,...,ColumnNameN FROM TableName  ORDER BY ColumnName DESC;  
SELECT ColumnName1,...,ColumnNameN FROM TableName  ORDER BY ColumnName;    /* if not mentioned ASC/DESC default ASC */
```

## Aggregate Function
Used to perform the calculations on multiple rows of a single column of a table. It returns a single value.

### Count
```sql
SELECT COUNT(*) FROM PRODUCT_MAST WHERE RATE>=20; 

SELECT COMPANY, COUNT(*) FROM PRODUCT_MAST GROUP BY COMPANY;  
Output:
Com1    5
Com2    3
Com3    2

SELECT COMPANY, COUNT(*) FROM PRODUCT_MAST GROUP BY COMPANY COUNT(*)>2;   
Output:
Com1    5
Com2    3
```

### Sum
```sql
SELECT SUM(COST) FROM PRODUCT_MAST WHERE QTY>3;  
```
### Avg
```sql
SELECT AVG(COST) FROM PRODUCT_MAST;  
```

### Min and Max
 
```sql
SELECT MIN(RATE) FROM PRODUCT_MAST;  
SELECT MAX(RATE) FROM PRODUCT_MAST;  
```

## Group By Clause
Jo jo element likha hai for Select woh saare use karne hain for Group By, warna error. 
```sql
SELECT city AVG(marks) FROM student GROUP BY city;
```

## Having Clause
HAVING Clause is used to filter the records from the groups based on the given condition in the HAVING Clause. Those groups who will satisfy the given condition will appear in the final result. HAVING Clause can only be used with SELECT statement.

```sql
SELECT Age, COUNT(Roll_No) AS No_of_Students 
FROM Student GROUP BY Age
HAVING COUNT(Roll_No) > 1 
```

#### Difference between WHERE and HAVING
- WHERE Clause is used to filter the records from the table based on the specified condition. HAVING Clause is used to filter record from the groups based on the specified condition.

- WHERE Clause can be used without GROUP BY Clause. HAVING Clause cannot be used without GROUP BY Clause

- WHERE Clause implements in row operations. HAVING Clause implements in column operation

- WHERE Clause cannot contain aggregate function. HAVING Clause can contain aggregate function

- WHERE Clause can be used with SELECT, UPDATE, DELETE statement. HAVING Clause can only be used with SELECT statement.

- WHERE Clause is used before GROUP BY Clause. HAVING Clause is used after GROUP BY Clause