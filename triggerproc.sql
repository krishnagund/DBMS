delimiter $$
create trigger reserve_rating before insert on Reserve
for each row 
begin
call update_Sailer(new.sid);
end $$
delimiter ;


delimiter $$
create procedure update_Sailer(in a int)
begin
update Sailer set srating =srating+1 where sid=a;
end $$
delimiter ;


/*
mysql> create table Boat(bid int,bname varchar(20),bcolor varchar(20));
Query OK, 0 rows affected (1.57 sec)

mysql> desc Boat;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| bid    | int         | YES  |     | NULL    |       |
| bname  | varchar(20) | YES  |     | NULL    |       |
| bcolor | varchar(20) | YES  |     | NULL    |       |
+--------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> insert into Boat values(100,'kaushal','red');
Query OK, 1 row affected (0.18 sec)

mysql> insert into Boat values(101,'adesh','black');
Query OK, 1 row affected (0.11 sec)

mysql> select * from Boat;
+------+---------+--------+
| bid  | bname   | bcolor |
+------+---------+--------+
|  100 | kaushal | red    |
|  101 | adesh   | black  |
|  102 | krishna | white  |
|  103 | tushar  | blue   |
+------+---------+--------+
4 rows in set (0.00 sec)

mysql> create table Sailer(Sid int,Sname varchar(20),srating int);
Query OK, 0 rows affected (1.34 sec)

mysql> desc Sailer;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Sid     | int         | YES  |     | NULL    |       |
| Sname   | varchar(20) | YES  |     | NULL    |       |
| srating | int         | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> insert into Sailer values(111,'kaushal',0);
Query OK, 1 row affected (0.18 sec)

mysql> insert into Sailer values(112,'adesh',0);
Query OK, 1 row affected (0.22 sec)

mysql> select * from Sailer;
+------+---------+---------+
| Sid  | Sname   | srating |
+------+---------+---------+
|  111 | kaushal |       0 |
|  112 | adesh   |       0 |
|  113 | krishna |       0 |
|  114 | tushar  |       0 |
+------+---------+---------+
4 rows in set (0.00 sec)

create table Reserve(bid int,sid int,dor date);
Query OK, 0 rows affected (0.97 sec)

mysql> desc Reserve;
+-------+------+------+-----+---------+-------+
| Field | Type | Null | Key | Default | Extra |
+-------+------+------+-----+---------+-------+
| bid   | int  | YES  |     | NULL    |       |
| sid   | int  | YES  |     | NULL    |       |
| dor   | date | YES  |     | NULL    |       |
+-------+------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> source /home/krish/triggerproc.sql;
Query OK, 0 rows affected (0.32 sec)

Query OK, 0 rows affected (0.15 sec)

mysql> insert into Reserve values(100,111,'2023-03-03');
Query OK, 1 row affected (0.19 sec)

mysql> insert into Reserve values(101,112,'2023-03-05');
Query OK, 1 row affected (0.17 sec)

mysql> select * from Sailer;
+------+---------+---------+
| Sid  | Sname   | srating |
+------+---------+---------+
|  111 | kaushal |       1 |
|  112 | adesh   |       1 |
|  113 | krishna |       0 |
|  114 | tushar  |       0 |
+------+---------+---------+
4 rows in set (0.00 sec)

mysql> insert into Reserve values(100,111,'2023-03-05');
Query OK, 1 row affected (0.19 sec)

mysql> select * from Sailer;
+------+---------+---------+
| Sid  | Sname   | srating |
+------+---------+---------+
|  111 | kaushal |       2 |
|  112 | adesh   |       1 |
|  113 | krishna |       0 |
|  114 | tushar  |       0 |
+------+---------+---------+
4 rows in set (0.00 sec)

*/






