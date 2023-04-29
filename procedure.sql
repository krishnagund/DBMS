/*
Objective: Procedure to update book status 
Author Name: Gund krushna Dilip
Rno: 58
PRN Number: UCS21M1058
Batch: AS3
*/


Delimiter $$
create procedure update_status(in rn int(3),in b int(3),in dr date)
Begin 
Declare I date;
Declare R date;
Declare temp int(2);
update Stud set DoR=dr where rno=rn and bid=b;
select DoI into I from Stud where rno=rn and bid=b;
set temp=DATEDIFF(dr,I);
if (temp<30) then
update Book_Status set fine_amount=0,Status='R' where rno=rn and bid=b;
elseif (temp>30 and temp<45) then
update Book_Status set fine_amount=temp*5,Status='R' where rno=rn and bid=b;
elseif (temp>45) then
update Book_Status set fine_amount=temp*10,Status='R' where rno=rn and bid=b;
end if;
end $$
Delimiter ;


/*
 mysql> use librarry;
Database changed

mysql> create table Book_Status(rno int,bid int,status varchar(20),fine_amount int);
Query OK, 0 rows affected (1.50 sec)
mysql> desc Book_Status;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| rno         | int         | YES  |     | NULL    |       |
| bid         | int         | YES  |     | NULL    |       |
| status      | varchar(20) | YES  |     | NULL    |       |
| fine_amount | int         | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
4 rows in set (0.10 sec)

mysql> create table Stud(rno int,bid int,DoI date,DoR date);
Query OK, 0 rows affected (0.81 sec)
mysql> desc Stud;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| rno   | int  | YES  |     | NULL    |       |
| bid   | int  | YES  |     | NULL    |       |
| DoI   | date | YES  |     | NULL    |       |
| DoR   | date | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> show tables;
+--------------------+
| Tables_in_librarry |
+--------------------+
| Book_Status        |
| Stud               |
+--------------------+
2 rows in set (0.01 sec)

mysql> insert into Book_Status values(53,108,'A',0);
Query OK, 1 row affected (0.22 sec)

mysql> select * from Book_Status;
+------+------+--------+-------------+
| rno  | bid  | status | fine_amount |
+------+------+--------+-------------+
|    1 |  100 | A      |           0 |
|   47 |  101 | A      |           0 |
|   48 |  102 | A      |           0 |
|   49 |  103 | A      |           0 |
|   50 |  104 | A      |           0 |
|   51 |  105 | A      |           0 |
|   52 |  106 | A      |           0 |
|   53 |  107 | A      |           0 |
|   54 |  108 | A      |           0 |
+------+------+--------+-------------+
9 rows in set (0.00 sec)


mysql> select * from Stud;
+------+------+------------+------------+
| rno  | bid  | DoI        | DoR        |
+------+------+------------+------------+
|    1 |  100 | 2023-01-12 | 2023-02-12 |
|   47 |  101 | 2023-02-10 | 2023-03-12 |
|   48 |  102 | 2023-02-01 | 2023-02-05 |
|   49 |  103 | 2023-04-01 | 2023-02-03 |
|   50 |  104 | 2022-02-01 | 2023-04-01 |
|   51 |  105 | 2022-02-02 | 2023-04-04 |
|   52 |  106 | 2022-02-02 | 2023-04-04 |
|   53 |  107 | 2022-01-01 | 2023-04-04 |
|   54 |  106 | 2022-02-02 | 2023-04-04 |
+------+------+------------+------------+


mysql> source /home/krish/procedure.sql;
Query OK, 0 rows affected, 3 warnings (0.57 sec)

mysql> call S1(45,101,'2023-03-12');
Query OK, 1 row affected (0.01 sec)

output:
mysql> select * from Book_Status;
+------+------+--------+-------------+
| rno  | bid  | status | fine_amount |
+------+------+--------+-------------+
|    1 |  101 |  R      |          135 |
|    47 |  102 | R      |         830 |
|    48 |  103 | R      |           0 |
|    49 |  104 | R      |         200 |
|    50 |  105 | R      |         100 |
|    51 |  106 | R      |        3660 |
|    52 |  111 | R      |           0 |
|    53 |    1 | R      |        1250 |
|    54 |  201 | R      |        1525|
+------+------+--------+-------------+
9 rows in set (0.00 sec)
