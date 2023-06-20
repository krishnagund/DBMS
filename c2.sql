DELIMITER //
CREATE PROCEDURE stud_proc()
BEGIN
    DECLARE vfinish INT DEFAULT 0;
    DECLARE r INT;
    DECLARE i INT;
    DECLARE n VARCHAR(20);
    DECLARE c VARCHAR(20);
    DECLARE g VARCHAR(20);
    DECLARE stud_cursor CURSOR FOR SELECT * FROM student;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET vfinish = 1;
    
    OPEN stud_cursor;
    
    getdata: LOOP
        FETCH stud_cursor INTO r, i, n, c, g;
        IF vfinish = 1 THEN
            LEAVE getdata;
        END IF;
        
        -- Check if the data already exists in the result table
        IF NOT EXISTS (SELECT 1 FROM result WHERE roll_no = r) THEN
            INSERT INTO result VALUES (r, i, n, c, g);
        END IF;
    END LOOP getdata;
    
    CLOSE stud_cursor;
END //
DELIMITER ;

/* copying one table data to another by skipping repetation

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
5 rows in set (0.00 sec)

mysql> desc result;
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

mysql> select * from student;
+------+------+--------+------+-------+
| rno  | age  | name   | dept | grade |
+------+------+--------+------+-------+
|    1 |   18 | ram    | comp | A     |
|    2 |   19 | sham   | comp | B     |
|    3 |   18 | siddhi | comp | B     |
|    4 |   18 | radha  | cs   | A     |
|    5 |   19 | Krish  | cs   | B     |
|    6 |   20 | adesh  | comp | A     |
+------+------+--------+------+-------+
6 rows in set (0.00 sec)

mysql> select * from result;
Empty set (0.00 sec)

mysql> call stud_proc();
Query OK, 0 rows affected (0.84 sec)

mysql> select * from result;
+------+------+--------+------+-------+
| rno  | age  | name   | dept | grade |
+------+------+--------+------+-------+
|    1 |   18 | ram    | comp | A     |
|    2 |   19 | sham   | comp | B     |
|    3 |   18 | siddhi | comp | B     |
|    4 |   18 | radha  | cs   | A     |
|    5 |   19 | Krish  | cs   | B     |
|    6 |   20 | adesh  | comp | A     |
+------+------+--------+------+-------+
6 rows in set (0.00 sec)

mysql> insert into result values(7,19,'chetan','cs','B');
Query OK, 1 row affected (0.10 sec)

mysql> call stud_proc();
Query OK, 0 rows affected (0.00 sec)

mysql> select * from result;
+------+------+--------+------+-------+
| rno  | age  | name   | dept | grade |
+------+------+--------+------+-------+
|    1 |   18 | ram    | comp | A     |
|    2 |   19 | sham   | comp | B     |
|    3 |   18 | siddhi | comp | B     |
|    4 |   18 | radha  | cs   | A     |
|    5 |   19 | Krish  | cs   | B     |
|    6 |   20 | adesh  | comp | A     |
|    7 |   19 | chetan | cs   | B     |
+------+------+--------+------+-------+
7 rows in set (0.00 sec)
*/
delimiter $$
create procedure update_st()
begin 
  declare N varchar(20);
  declare x int(2);
  declare flag int default 0;
  
   declare A_cursor cursor for select * from a;
   declare continue handler for not found set flag=1;
   
  open A_cursor;
  
  fetchdata:loop   /*fetchdata is user define name*/
     fetch A_cursor into N,x;
     if flag=1 then
     leave fetchdata;
     end if;
     update data set age=x where name=N;
     end loop fetchdata;
     close A_cursor;
end $$
delimiter ;

/* This cursor is for updating table data

mysql> desc a;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.01 sec)

mysql> desc data;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| sr    | int         | YES  |     | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
| age   | int         | YES  |     | NULL    |       |
| dob   | date        | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
4 rows in set (0.01 sec)

mysql> select * from data;
+------+------+------+------------+
| sr   | name | age  | dob        |
+------+------+------+------------+
|    1 | a    |   18 | 2023-01-01 |
|    1 | b    |   19 | 2023-02-01 |
|    2 | c    |   20 | 2023-02-01 |
|    3 | d    |   21 | 2023-02-03 |
|    4 | Ram  |   22 | 2023-02-02 |
+------+------+------+------------+
5 rows in set (0.01 sec)

mysql> insert into data(sr,name,dob)values(5,'sham','2023-01-01');
Query OK, 1 row affected (0.14 sec)

mysql> select * from data;
+------+------+------+------------+
| sr   | name | age  | dob        |
+------+------+------+------------+
|    1 | a    |   18 | 2023-01-01 |
|    1 | b    |   19 | 2023-02-01 |
|    2 | c    |   20 | 2023-02-01 |
|    3 | d    |   21 | 2023-02-03 |
|    4 | Ram  |   22 | 2023-02-02 |
|    5 | sham | NULL | 2023-01-01 |
+------+------+------+------------+
6 rows in set (0.00 sec)

mysql> select * from a;
+------+------+
| name | age  |
+------+------+
| a    |   18 |
| b    |   19 |
| c    |   20 |
| d    |   21 |
| Ram  |   22 |
+------+------+
5 rows in set (0.00 sec)

mysql> insert into a values('sham',21);
Query OK, 1 row affected (0.19 sec)

mysql> select * from a;
+------+------+
| name | age  |
+------+------+
| a    |   18 |
| b    |   19 |
| c    |   20 |
| d    |   21 |
| Ram  |   22 |
| sham |   21 |
+------+------+
6 rows in set (0.00 sec)

mysql> call update_st();
Query OK, 0 rows affected (0.19 sec)

mysql> select * from data;
+------+------+------+------------+
| sr   | name | age  | dob        |
+------+------+------+------------+
|    1 | a    |   18 | 2023-01-01 |
|    1 | b    |   19 | 2023-02-01 |
|    2 | c    |   20 | 2023-02-01 |
|    3 | d    |   21 | 2023-02-03 |
|    4 | Ram  |   22 | 2023-02-02 |
|    5 | sham |   21 | 2023-01-01 |
+------+------+------+------------+
6 rows in set (0.00 sec)

*/
