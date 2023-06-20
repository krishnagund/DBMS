delimiter //
create function final_result3(R1 int) 
 returns int deterministic
 begin
 declare fmarks integer;
 declare grade varchar(20);
 declare stud_name varchar(20);
 select marks.total_marks,marks.name into fmarks,stud_name from marks where marks.roll_no=R1;/*This line retrieves the total_marks and name values from the stud_marks table based on the provided roll_in parameter and assigns them to the variables fmarks and stud_name, respectively.*/
 call proc_result(fmarks,@grade);/* this procedure call give input marks and take their class output*/
 insert into result values(R1,stud_name,@grade);
 return R1;
 end //
 delimiter ;
/* 
+----------------+
| Tables_in_ass5 |
+----------------+
| marks          |
| result         |
+----------------+
2 rows in set (0.00 sec)

mysql> desc marks;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| roll_no     | int         | YES  |     | NULL    |       |
| name        | varchar(20) | YES  |     | NULL    |       |
| total_marks | varchar(20) | YES  |     | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
3 rows in set (0.01 sec)

mysql> desc result;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| roll_no | int         | YES  |     | NULL    |       |
| name    | varchar(20) | YES  |     | NULL    |       |
| class   | varchar(20) | YES  |     | NULL    |       |
+---------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> select * from marks;
+---------+--------+-------------+
| roll_no | name   | total_marks |
+---------+--------+-------------+
|       1 | Abhi   | 1400        |
|       2 | piyush | 980         |
|       3 | hitesh | 880         |
|       4 | ashley | 820         |
|       5 | partik | 740         |
|       6 | patil  | 640         |
|       7 | ram    | 1300        |
+---------+--------+-------------+
7 rows in set (0.00 sec)

mysql> insert into marks values(8,'sham',800);
Query OK, 1 row affected (0.26 sec)

mysql> select * from marks;
+---------+--------+-------------+
| roll_no | name   | total_marks |
+---------+--------+-------------+
|       1 | Abhi   | 1400        |
|       2 | piyush | 980         |
|       3 | hitesh | 880         |
|       4 | ashley | 820         |
|       5 | partik | 740         |
|       6 | patil  | 640         |
|       7 | ram    | 1300        |
|       8 | sham   | 800         |
+---------+--------+-------------+
8 rows in set (0.00 sec)

mysql> select * from result;
+---------+--------+---------------------+
| roll_no | name   | class               |
+---------+--------+---------------------+
|       1 | Abhi   | Distincton          |
|       2 | piyush | First Class         |
|       3 | hitesh | Higher Second Class |
|       4 | ashley | Second Class        |
|       5 | partik | Passed              |
|       7 | ram    | Distincton          |
+---------+--------+---------------------+
6 rows in set (0.00 sec)

mysql> select final_result3(8);
+------------------+
| final_result3(8) |
+------------------+
|                8 |
+------------------+
1 row in set (0.26 sec)

mysql> select * from result;
+---------+--------+---------------------+
| roll_no | name   | class               |
+---------+--------+---------------------+
|       1 | Abhi   | Distincton          |
|       2 | piyush | First Class         |
|       3 | hitesh | Higher Second Class |
|       4 | ashley | Second Class        |
|       5 | partik | Passed              |
|       7 | ram    | Distincton          |
|       8 | sham   | Second Class        |
+---------+--------+---------------------+
7 rows in set (0.00 sec)

*/
delimiter //
create procedure proc_result(in marks int,out class char(20))
 begin
 if(marks<1500&&marks>990)
 then
 set class='Distincton';
 end if;
 if(marks<989&&marks>890)
 then
 set class='First Class';
 end if;
 if(marks<889&&marks>825)
 then
 set class='Higher Second Class';
 end if;
 if(marks<824&&marks>750)
 then
 set class='Second Class';
 end if;
 if(marks<749&&marks>650)
 then
 set class='Passed';
 end if;
 if(marks<649)
 then
 set class='Fail';
 end if;
 end //
delimiter ;
