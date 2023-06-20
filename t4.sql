DELIMITER //
CREATE TRIGGER trg_library_aft
AFTER DELETE ON tbl_library
FOR EACH ROW
BEGIN
  INSERT INTO tbl_library_audit (bk_no, bk_name, issue_date, return_date)
  VALUES (OLD.bk_no, OLD.bk_name, OLD.issue_date, OLD.return_date);
END //

DELIMITER ;
/* This trigger is for if we delete any record it will be stored in backup table
ysql> use ass6;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------+
| Tables_in_ass6    |
+-------------------+
| tbl_library       |
| tbl_library_audit |
+-------------------+
2 rows in set (0.00 sec)

mysql> desc tbl_library;
+-------------+--------------+------+-----+---------+-------+
| Field       | Type         | Null | Key | Default | Extra |
+-------------+--------------+------+-----+---------+-------+
| bk_no       | int          | YES  |     | NULL    |       |
| bk_name     | varchar(255) | YES  |     | NULL    |       |
| issue_date  | date         | YES  |     | NULL    |       |
| return_date | date         | YES  |     | NULL    |       |
+-------------+--------------+------+-----+---------+-------+
4 rows in set (0.03 sec)

mysql> desc tbl_library_audit;
+-------------+--------------+------+-----+-------------------+-------------------+
| Field       | Type         | Null | Key | Default           | Extra             |
+-------------+--------------+------+-----+-------------------+-------------------+
| audit_id    | int          | NO   | PRI | NULL              | auto_increment    |
| bk_no       | int          | YES  |     | NULL              |                   |
| bk_name     | varchar(255) | YES  |     | NULL              |                   |
| issue_date  | date         | YES  |     | NULL              |                   |
| return_date | date         | YES  |     | NULL              |                   |
| audit_date  | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
+-------------+--------------+------+-----+-------------------+-------------------+
6 rows in set (0.00 sec)

mysql> select * from tbl_library;
+-------+---------+------------+-------------+
| bk_no | bk_name | issue_date | return_date |
+-------+---------+------------+-------------+
|     1 | cr      | 2022-01-01 | 2022-02-02  |
|     2 | abc     | 2023-01-01 | 2023-02-02  |
|     3 | ads     | 2023-02-02 | 2023-03-03  |
|     4 | osa     | 2023-03-03 | 2023-04-04  |
+-------+---------+------------+-------------+
4 rows in set (0.02 sec)

mysql> select * from tbl_library_audit;
empty set

mysql> delete from tbl_library where bk_no=4;
Query OK, 1 row affected (0.76 sec)

mysql> select * from tbl_library;
+-------+---------+------------+-------------+
| bk_no | bk_name | issue_date | return_date |
+-------+---------+------------+-------------+
|     1 | cr      | 2022-01-01 | 2022-02-02  |
|     2 | abc     | 2023-01-01 | 2023-02-02  |
|     3 | ads     | 2023-02-02 | 2023-03-03  |
+-------+---------+------------+-------------+
3 rows in set (0.00 sec)

mysql> select * from tbl_library_audit;
+----------+-------+---------+------------+-------------+---------------------+
| audit_id | bk_no | bk_name | issue_date | return_date | audit_date          |
+----------+-------+---------+------------+-------------+---------------------+
|        1 |     4  | osa     | 2023-03-03| 2023-04-04  | 2023-06-18 16:38:31 |
+----------+-------+---------+------------+-------------+---------------------+
5 rows in set (0.00 sec)
*/
DELIMITER //

CREATE TRIGGER trg_library_af 
AFTER UPDATE ON tbl_library
FOR EACH ROW
BEGIN
    INSERT INTO tbl_library_audit (bk_no, bk_name, issue_date, return_date)
    VALUES (OLD.bk_no, OLD.bk_name, OLD.issue_date, OLD.return_date);
END //

DELIMITER ;

/*here it will same if we update any record existing record will be stored in backup*/
