/*Objective: Create a procedure to copy table data and insert it into new table using cursor
Author Name: Krushna Dilip Gund
Rno: 58
PRN Number: UCS21M1058
Batch: AS3
*/






delimiter //
create procedure stud_proc()
begin
declare vfinish int default 0;
declare r int;
declare i int;
declare n varchar(20);
declare c varchar(20);
declare g varchar(20);
declare stud_cursor cursor for select * from student;
declare continue handler for not found set vfinish=1;
open stud_cursor;
getdata : loop
fetch stud_cursor into r,i,n,c,g;
if vfinish=1 then leave getdata;
end if;
insert into result values(r,i,n,c,g);
end loop getdata;
close stud_cursor;
end
//

/*

 mysql> desc student;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| rno   | int         | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| dept  | varchar(20) | YES  |     | NULL    |       |
| grade | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql>create table result(rno int,age int,name varchar(20),dept varchar(20),grade varchar(20));
Query ok,0 rows affected(0.68 sec)


mysql> select * from student;
+------+------+---------+----------+-------+
| rno  | age  | name    | dept     | grade |
+------+------+---------+----------+-------+
|   47 |   19 | Tushar  | computer | A     |
|   15 |   19 | rushi   | ECE      | B     |
|   14 |   19 | swapnil | ECE      | B     |
|    1 |   19 | sarthak | ECE      | A     |
|   40 |   19 | yash    | IT       | A     |
|   44 |   19 | Ganesh  | Mech     | A     |
|   43 |   19 | chetan  | comp     | A     |
|   50 |   19 | kaushal | comp     | B     |
+------+------+---------+----------+-------+
8 rows in set (0.00 sec)

mysql> select * from result;
Empty set (0.00 sec)


mysql> source /home/krish/kg.sql;
Query OK, 0 rows affected (0.22 sec)

mysql> call stud_proc();
    -> //
Query OK, 0 rows affected (1.68 sec)

mysql> select * from result;
    -> //
+------+------+---------+----------+-------+
| rno  | age  | name    | dept     | grade |
+------+------+---------+----------+-------+
|   47 |   19 | Tushar  | computer | A     |
|   15 |   19 | rushi   | ECE      | B     |
|   14 |   19 | swapnil | ECE      | B     |
|    1 |   19 | sarthak | ECE      | A     |
|   40 |   19 | yash    | IT       | A     |
|   44 |   19 | Ganesh  | Mech     | A     |
|   43 |   19 | chetan  | comp     | A     |
|   50 |   19 | kaushal | comp     | B     |
+------+------+---------+----------+-------+
8 rows in set (0.00 sec)


*/






