MYSQL 
     database management system
     - A database is a collection of data stored in format that can easily be accessed.
     There are two types of database
     1.Relational database
     2.NoSQL - It is not table stored database
               It is document based
               eg.MongoDB,Redis
               
*Advantages of mysql
    -cross platform(depend on multiple op.sys)
    -used with multiple langwages(PHP,nodejs,Python)
    -open source
    -It is RDBMS
    -Fast,Reliable,scaleble,easy to use
    -used in client/server embended sys.
    used in facebook,twitter,google
    
*Mysql constraints
  -Not NULL
  -unique
  -default
  -check
  -foreign key
  -primary key
  
  
  
#AND operator
 SELECT col1,col2,col3.....
  FROM table_name
  WHERE cond1 AND cond2 AND cond3....
  
#OR operator
  SELECT col1,col2,col3.....
  FROM table_name
  WHERE cond1 OR cond2
  
#NOT operator
  SELECT col1,col2,col3.....
  FROM table_name
  WHERE NOT age>=20
  
#IN
  SELECT col1,col2,col3.....
  FROM table_name
  WHERE colomn_name IN(value1,value2...);
  WHERE age IN (18,21)
  
#BETWEEN
  SELECT col1,col2,col3.....
  FROM table_name
  WHERE colomn_name BETWEEN value1 AND value2;
  WHERE age BETWEEN 18 and 21
  
#LIKE
  WHERE name like "s%" (start with S)
  WHERE name like "%s" (end with S)
  WHERE name like "_s%" (2nd location S)
  
*Aggregate Functions
  COUNT(colomn_name)
  MAX(colomn_name)
  MIN(colomn_name)
  SUM(colomn_name)
  AVG(colomn_name)
  
  -SELECT COUNT (colomn_name)
     FROM table_name
       WHERE condition ;
       
       
*primary key
   -It always has unique data
   -It cannnot have NULL value
   -Table can contains only one primary key constraint
   
   Syntax:
       CREATE table table_name
       (
        id int not null Auto_increment,
        name varchar not null,
        primary key(id));
        
    adding primary key to existing table
     - alter table table_name
        add primary key(id);
    
*Foreign key
  -It is a key use to link two tables together
   syntax:
     CREATE table table_name
       (
        cid int not null Auto_increment,
        name varchar not null,
        foreign key(cid)references table_name(id));
        
*JOIN 
  1.INNER JOIN
    -Inner join selects the records that have matching values in both tables
    Syntax:
       SELECT colomns
         FROM table1
         INNER JOIN table2
         ON table1.colomn_name=table2.colomn_name
    
  2.LEFT JOIN
    -The left join returns all records from the left table (table1) and the match records from the right table(table 2)
    Syntax:
       SELECT colomns
         FROM table1
         INNER JOIN table2
         ON table1.colomn_name=table2.colomn_name
         
*INDEX
  create index index_name
  ON table_name(colo1,colo2,...);  
  
  

DBMS Syntax -
  (1) DDL-Data Defination langwage
     create 
     alter 
     truncate
     drop 
     rename
     (a) create table table_name(coloman1,com2,.....);
     
     (b) alter -(it will changes structure of table)
         for adding an extra colomn to table
         syntax -
         ALTER TABLE table_name  
         ADD new_column_name column_definition  
         eg-
           mysql> alter table boat add(bdate date);
           Query OK, 0 rows affected (2.25 sec) 
           Records: 0  Duplicates: 0  Warnings: 0
           add multiple colomn by using coma(,)
        
        for droping a colomn
        syntax:
          alter table table_name drop colomn_name
        eg:
          mysql> alter table boat drop bsal;
          Query OK, 0 rows affected (1.48 sec)
          Records: 0  Duplicates: 0  Warnings: 0

          mysql> alter table boat drop bage;
          Query OK, 0 rows affected (1.44 sec)
          Records: 0  Duplicates: 0  Warnings: 0

          mysql> alter table boat drop biid;
          Query OK, 0 rows affected (1.34 sec)
          Records: 0  Duplicates: 0  Warnings: 0
          
         modify colomn:
          syntax:
             alter table table_name modify colomn
          for eg - if our varchar size is 20 if we want to increase it so apply this.
               mysql> desc boat;
               +--------+-------------+------+-----+---------+-------+ 
               | Field  | Type        | Null | Key | Default | Extra |
               +--------+-------------+------+-----+---------+-------+
               | bid    | int         | YES  |     | NULL    |       |
               | bname  | varchar(20) | YES  |     | NULL    |       |
               | bcolor | varchar(10) | YES  |     | NULL    |       | 
               | bdate  | date        | YES  |     | NULL    |       | 
               +--------+-------------+------+-----+---------+-------+
               
               mysql> alter table boat modify bcolor varchar(50);
               Query OK, 0 rows affected (0.38 sec)
               Records: 0  Duplicates: 0  Warnings: 0

               mysql> desc boat;
              +--------+-------------+------+-----+---------+-------+
              | Field  | Type        | Null | Key | Default | Extra |
              +--------+-------------+------+-----+---------+-------+
              | bid    | int         | YES  |     | NULL    |       |
              | bname  | varchar(20) | YES  |     | NULL    |       |
              | bcolor | varchar(50) | YES  |     | NULL    |       |
              | bdate  | date        | YES  |     | NULL    |       |
              +--------+-------------+------+-----+---------+-------+
              4 rows in set (0.01 sec)

       (C) Truncate (structure will be same data will deleted)
          Syntax : truncate table table_name
          eg -
              mysql> select * from boat;
              +------+-------+--------+-------+
              | bid  | bname | bcolor | bdate |
              +------+-------+--------+-------+
              |  101 | ram   | red    | NULL  |
              |  102 | sham  | red    | NULL  |
              +------+-------+--------+-------+
              2 rows in set (0.00 sec)

              mysql> truncate table boat;
              Query OK, 0 rows affected (2.63 sec)

               mysql> select * from boat;
               Empty set (0.00 sec)
          
         (D) drop
             Syntsx:
             drop table table name;
             eg -
               drop table student;
            
         (E) Rename
             syntax:
              rename table boat
              eg-
               mysql>  rename table boat to sheep;
               Query OK, 0 rows affected (1.33 sec)


(2) DML Data Manipulation langwage-
    
     (A) Insert-
         syntax:
           Insert into table () values()
                    or
           Insert into table values()
         eg-
           create table Info(id integer, Cost integer,city nvarchar(200));
          INSERT INTO Info (id,Cost,city)  
          VALUES (1,200, 'Pune'), (2, 150,'USA'), (3,345, 'France');   
          
     (B) Delete -
         syntax:
          delete from table_name where condition;
         eg-
           delete from emp where emp_no=1;
      
     (C) Update-
         syntax:
         update table_name set colomn1=value1,colomn2=value2 where condition;
         eg-
         update Boat set bname='ram'where bid=1;
          
   
(3) DQL Data Query Langwage
     
     # Select
      for displaying all table data
       select * from table_name;
              



          
