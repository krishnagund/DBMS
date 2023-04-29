/*
assignment 2
Objective: create 10 sql queries for suitable application
Author Name: Gund krushna Dilip
Rno: 58
PRN Number: UCS21M1058
Batch: AS3

(1).INSERT INTO
  mysql> use query;
  Database changed
  mysql> create table customer(id int,name varchar(20),address varchar(25),sal float(6,2));
  Query OK, 0 rows affected, 1 warning (1.10 sec)

  mysql> desc customer;
  +---------+-------------+------+-----+---------+-------+
  | Field   | Type        | Null | Key | Default | Extra |
  +---------+-------------+------+-----+---------+-------+
  | id      | int         | YES  |     | NULL    |       |
  | name    | varchar(20) | YES  |     | NULL    |       |
  | address | varchar(25) | YES  |     | NULL    |       |
  | sal     | float(6,2)  | YES  |     | NULL    |       |
  +---------+-------------+------+-----+---------+-------+
  4 rows in set (0.01 sec)
  mysql> insert into customer(id,name,address,sal) values(1,'Ram','Kopargaon',2000.00);
  Query OK, 1 row affected (0.15 sec)
  or
  mysql> insert into customer values(3,'Sai','nashik',4500.00);
  Query OK, 1 row affected (0.16 sec)


(2).SELECT
  mysql> select * from customer;
  +------+------+-----------+---------+
  | id   | name | address   | sal     |
  +------+------+-----------+---------+
  |    1 | Ram  | Kopargaon | 2000.00 |
  |    3 | Sai  | nashik    | 4500.00 |
  +------+------+-----------+---------+
  2 rows in set (0.00 sec)

  mysql> select id,name from customer where sal>2000;
  +------+------+
  | id   | name |
  +------+------+
  |    3 | Sai  |
  +------+------+
  1 row in set (0.00 sec)
  
  mysql> select id,name,address,sal from customer where name='Ram';
  +------+------+-----------+---------+
  | id   | name | address   | sal     |
  +------+------+-----------+---------+
  |    1 | Ram  | Kopargaon | 2000.00 |
  +------+------+-----------+---------+
  1 row in set (0.00 sec)

(3).UPDATE
   mysql> update customer set address='pune' where id=2;
   Query OK, 1 row affected (0.10 sec)
   Rows matched: 1  Changed: 1  Warnings: 0

   mysql> select * from customer;
   +------+---------+-----------+---------+
   | id   | name    | address   | sal     |
   +------+---------+-----------+---------+
   |    1 | Ram     | Kopargaon | 2000.00 |
   |    3 | Sai     | nashik    | 4500.00 |
   |    2 | sham    | pune      | 5000.00 |
   |    4 | krishna | pune      | 5000.00 |
   |    5 | siddhi  | mumbai    | 2000.00 |
   |    6 | adesh   | koaprgaon | 8000.00 |
   +------+---------+-----------+---------+
   6 rows in set (0.00 sec)
   
 (4).DELETE
    syntax delete from table name where [condition]
    mysql> delete from customer where id=3;
    Query OK, 1 row affected (0.10 sec)

    mysql> select * from customer;
    +------+---------+-----------+---------+
    | id   | name    | address   | sal     |
    +------+---------+-----------+---------+
    |    1 | Ram     | Kopargaon | 2000.00 |
    |    2 | sham    | pune      | 5000.00 |
    |    4 | krishna | pune      | 5000.00 |
    |    5 | siddhi  | mumbai    | 2000.00 |
    |    6 | adesh   | koaprgaon | 8000.00 |
    +------+---------+-----------+---------+
    5 rows in set (0.00 sec)
     USING OPERATORS
     mysql> delete from customer where id=2 and name='sham';
     Query OK, 1 row affected (0.11 sec)

     mysql> select * from customer;
    +------+---------+-----------+---------+
    | id   | name    | address   | sal     |
    +------+---------+-----------+---------+
    |    1 | Ram     | Kopargaon | 2000.00 |
    |    4 | krishna | pune      | 5000.00 |
    |    5 | siddhi  | mumbai    | 2000.00 |
    |    6 | adesh   | koaprgaon | 8000.00 |
    +------+---------+-----------+---------+
    4 rows in set (0.01 sec)
    
(5).FUNCTION 
    sql has many inbuild functions like(sum,count,avg,min,max,first,last)
    example
    
    mysql> select * from stud;
   +-----------+-------------+-------+
   | studentID | studentName | marks |
   +-----------+-------------+-------+
   |         1 | sanjay      |    64 |
   |         2 | varun       |    72 | 
   |         3 | akash       |    45 |
   |         4 | rohit       |    86 |
   |         5 | divya       |    92 |
   +-----------+-------------+-------+
    5 rows in set (0.00 sec)
    mysql> select sum(marks) from stud;
    +------------+
    | sum(marks) |
    +------------+
    |        359 |
    +------------+
    1 row in set (0.00 sec)
    mysql> select count(studentID) from stud;
    +------------------+
    | count(studentID) |
    +------------------+
    |                5 |
    +------------------+
    1 row in set (0.00 sec)
    mysql> select avg(marks) from stud;
    +------------+
    | avg(marks) | 
    +------------+
    |    71.8000 |
    +------------+
    1 row in set (0.00 sec)
    mysql> select min(marks) from stud;
    +------------+
    | min(marks) |
    +------------+
    |         45 |
    +------------+
    1 row in set (0.00 sec)
    mysql> select max(marks) from stud;  
    +------------+
    | max(marks) |
    +------------+
    |         92 |
    +------------+
    1 row in set (0.00 sec)


(6).SET OPERTAORS(union,intersect........)
    mysql> select 'tushar' from student union select 'Ram' from customer;
    +--------+
    | tushar |
    +--------+
    | tushar |
    | Ram    |
    +--------+
    2 rows in set (0.00 sec)
    
    mysql> select 'tushar' from student intersect select 'Ram' from customer;
    Empty set (0.00 sec)

(7).JOIN
   mysql> desc dept;
   +-------+-------------+------+-----+---------+-------+
   | Field | Type        | Null | Key | Default | Extra |
   +-------+-------------+------+-----+---------+-------+
   |  dno   | int         | NO   | PRI | NULL    |       |
   | dname | varchar(12) | YES  |     | NULL    |       |
   | dloc  | varchar(10) | YES  |     | NULL    |       |
   +-------+-------------+------+-----+---------+-------+ 
   3 rows in set (0.00 sec)
  
   mysql> desc emp;
  + -------+-------------+------+-----+---------+-------+
   | Field | Type        | Null | Key | Default | Extra |
   +-------+-------------+------+-----+---------+-------+
   | eno   | int         | YES  |     | NULL    |       |
   | ename | varchar(10) | YES  |     | NULL    |       |
   | esal  | float(8,2)  | YES  |     | NULL    |       |
   | edsg  | varchar(12) | YES  |     | NULL    |       |
   | dno   | int         | YES  | MUL | NULL    |       |
   +-------+-------------+------+-----+---------+-------+
   5 rows in set (0.01 sec)

   mysql> select * from dept;
   +-----+------------+-----------+
   | dno | dname      | dloc      |
   +-----+------------+-----------+  
   | 100 | computer   | Haidrabad |
   | 101 | mechanical | Bengluru  |
   | 102 | civil      | mumbai    |
   | 103 | ECE        | chennai   |
   | 104 | Electrical | lucknow   |
   | 105 | structural | punjab    |
   | 106 | IT         | Gujrat    |
   +-----+------------+-----------+
   7 rows in set (0.03 sec)

   mysql> select * from emp;
   +------+----------+-----------+---------+------+
   | eno  | ename    | esal      | edsg    | dno  |
   +------+----------+-----------+---------+------+
   |   58 | krishna  | 600000.56 | student |  100 |
   |   62 | adesh    | 600000.56 | student |  100 |
   |   55 | chaitnya |  55000.00 | student |  100 |
   |   43 | chetan   | 100000.00 | student |  100 |
   |   47 | tushar   |  10000.00 | student |  100 |
   |   80 | ramraj   |  45000.00 | student |  100 |
   |   50 | rajendra |  85000.00 | student |  100 |
   +------+----------+-----------+---------+------+
   7 rows in set (0.02 sec)
   
   (1) INNER JOIN
    mysql> select emp.eno,dept.dname,dept.dloc from dept INNER JOIN emp on dept.dno=emp.dno;
    +------+----------+-----------+
    | eno  | dname    | dloc      |
    +------+----------+-----------+
    |   58 | computer | Haidrabad |
    |   62 | computer | Haidrabad |
    |   55 | computer | Haidrabad |
    |   43 | computer | Haidrabad |
    |   47 | computer | Haidrabad |
    |   80 | computer | Haidrabad |
    |   50 | computer | Haidrabad |
    +------+----------+-----------+
    7 rows in set (0.00 sec)
    (2) LEFT JOIN
    mysql> select dept.dname,emp.ename from dept LEFT JOIN emp on emp.dno=dept.dno;
   +------------+----------+
   | dname      | ename    |
   +------------+----------+
   | computer   | rajendra |
   | computer   | ramraj   |
   | computer   | tushar   |
   | computer   | chetan   |
   | computer   | chaitnya |
   | computer   | adesh    |
   | computer   | krishna  |
   | mechanical | NULL     |
   | civil      | NULL     |
   | ECE        | NULL     |
   | Electrical | NULL     |
   | structural | NULL     |
   | IT         | NULL     |
   +------------+----------+
   13 rows in set (0.00 sec)

    (3).RIGHT JOIN
    mysql> select dept.dname,emp.eno from dept RIGHT JOIN emp on emp.dno=dept.dno;
    +----------+------+
    | dname    | eno  |
    +----------+------+
    | computer |   58 |
    | computer |   62 |
    | computer |   55 |
    | computer |   43 |
    | computer |   47 |
    |  computer |   80 |
    | computer |   50 |
    +----------+------+
    7 rows in set (0.00 sec)
    
(8).VIEW
    mysql> create view comp_view as select eno,ename,esal from emp where edsg='student';
    Query OK, 0 rows affected (0.22 sec)
    
    mysql> desc comp_view;
   +-------+-------------+------+-----+---------+-------+
   | Field | Type        | Null | Key | Default | Extra |
   +-------+-------------+------+-----+---------+-------+ 
   | eno   | int         | YES  |     | NULL    |       |
   | ename | varchar(10) | YES  |     | NULL    |       |
    |esal  | float(8,2)  | YES  |     | NULL    |       |
   +-------+-------------+------+-----+---------+-------+
   3 rows in set (0.00 sec)



   mysql> select * from comp_view;
   +------+----------+-----------+
   | eno  | ename    | esal      |
   +------+----------+-----------+
   |   58 | krishna  | 600000.56 |
   |   62 | adesh    | 600000.56 |
   |   55 | chaitnya |  55000.00 | 
   |   43 | chetan   | 100000.00 |
   |   47 | tushar   |  10000.00 |
   |   80 | ramraj   |  45000.00 |
   |   50 | rajendra |  85000.00 |
   +------+----------+-----------+
   7 rows in set (0.00 sec)


(9).sub-queries   (query inside a query)
    mysql> select * from student where age=(select min(age) from student);
   +---------+----------+------------+------------+------+
   | roll_no | name     | address    | phone      | age  |
   +---------+----------+------------+------------+------+
   |      43 | chetan   | kopargaon  | 9922493828 |   18 |
   |      47 | tushar   | shrirampur | 9922493828 |   18 |
   |      45 | abhishek | madhi      | 9922493828 |   18 |
   |      62 | adesh    | kopargaon  | 9922493828 |   18 |
   +---------+----------+------------+------------+------+
   4 rows in set (0.10 sec)




    



    

  
    





