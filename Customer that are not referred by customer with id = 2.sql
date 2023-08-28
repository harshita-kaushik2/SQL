Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 
Find the names of the customer that are not referred by the customer with id = 2.
Return the result table in any order.
The result format is in the following example.

Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+


Error I made : SELECT name FROM Customer WHERE referee_id != 2;

However, this query will only return one result:Zack although there are 4 customers not referred by Jane (including Jane herself). All the customers who were referred by nobody at all (NULL value in the referee_id column) don’t show up. But why?

===> Algorithm

MySQL uses three-valued logic -- TRUE, FALSE and UNKNOWN. Anything compared to NULL evaluates to the third value: UNKNOWN. That “anything” includes NULL itself! That’s why MySQL provides the IS NULL and IS NOT NULL operators to specifically check for NULL.

Thus, one more condition 'referee_id IS NULL' should be added to the WHERE clause as below.

Correct Answer : SELECT name FROM Customer WHERE referee_id != 2 OR referee_id IS NULL;

