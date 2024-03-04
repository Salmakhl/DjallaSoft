Enter password: ******************
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 78
Server version: 8.0.19 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| bdvol              |
| centre_formation   |
| djallabasoft       |
| hollywood          |
| information_schema |
| isgi               |
| mysql              |
| newschema          |
| performance_schema |
| sakila             |
| sys                |
| test1              |
| test2              |
| test3              |
+--------------------+
14 rows in set (0.09 sec)

mysql> use djallabasoft ;
Database changed
mysql> show tables ;
+------------------------+
| Tables_in_djallabasoft |
+------------------------+
| dept                   |
| emp                    |
+------------------------+
2 rows in set (0.00 sec)

mysql> desc empt ;
ERROR 1146 (42S02): Table 'djallabasoft.empt' doesn't exist
mysql> desc emp ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| NumE     | int         | NO   | PRI | NULL    |       |
| NomE     | varchar(40) | YES  |     | NULL    |       |
| fonction | varchar(40) | YES  |     | NULL    |       |
| embauche | varchar(40) | YES  |     | NULL    |       |
| salaire  | double      | YES  |     | NULL    |       |
| Comm     | varchar(40) | YES  |     | NULL    |       |
| NumD     | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> alter table emp
    -> modify column embauche date ;
Query OK, 0 rows affected (1.54 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into emp values
    -> (1 , 'azerty' , 'fct' , 456 , ^C
mysql> alter table emp
    -> add column Nums int
    -> after fonction;
Query OK, 0 rows affected (1.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc emp ;
+----------+-------------+------+-----+---------+-------+
| Field    | Type        | Null | Key | Default | Extra |
+----------+-------------+------+-----+---------+-------+
| NumE     | int         | NO   | PRI | NULL    |       |
| NomE     | varchar(40) | YES  |     | NULL    |       |
| fonction | varchar(40) | YES  |     | NULL    |       |
| Nums     | int         | YES  |     | NULL    |       |
| embauche | date        | YES  |     | NULL    |       |
| salaire  | double      | YES  |     | NULL    |       |
| Comm     | varchar(40) | YES  |     | NULL    |       |
| NumD     | int         | YES  | MUL | NULL    |       |
+----------+-------------+------+-----+---------+-------+
8 rows in set (0.00 sec)

mysql> insert into emp values
    -> ( 1 ,'zerty' , 'fct' , 4577 , '2020-09-01' , 453689 , 'comm' ,1),
    -> ( 2 ,'youp' , 'foct' , 4347 , '2020-09-01' , 4589 , 'comm' ,3),
    -> ( 3 ,'name' , 'fonct' , 4337 , '2020-09-01' , 84589 , 'comma' ,4),
    -> ( 4 ,'salma' , 'foncti' ,3458 , '2020-09-02' , 845890 , 'comman' ,5),
    -> ( 5 ,'sa' , 'foncti' ,3459 , '2020-09-02' , 845890 , 'comman' ,2);
ERROR 1452 (23000): Cannot add or update a child row: a foreign key constraint fails (`djallabasoft`.`emp`, CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`NumD`) REFERENCES `dept` (`NumD`))
mysql> INSERT INTO  DEPT VALUES
    -> ( 1 , 'nom' , 'MHAMID'),
    -> ( 2 , 'nom2' , 'AZLI'),
    -> ( 3 , 'nom3' , 'AZLI'),
    -> ( 4 , 'nom4' , 'AZLI'),
    -> ( 5 , 'nom5' , 'GUELIZ');
Query OK, 5 rows affected (0.10 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> INSERT INTO  emp VALUES
    -> ( 1 ,'zerty' , 'fct' , 4577 , '2020-09-01' , 453689 , 'comm' ,1),
    ->     -> ( 2 ,'youp' , 'foct' , 4347 , '2020-09-01' , 4589 , 'comm' ,3),
    ->     -> ( 3 ,'name' , 'fonct' , 4337 , '2020-09-01' , 84589 , 'comma' ,4),
    ->     -> ( 4 ,'salma' , 'foncti' ,3458 , '2020-09-02' , 845890 , 'comman' ,5),
    ->     -> ( 5 ,'sa' , 'foncti' ,3459 , '2020-09-02' , 845890 , 'comman' ,2);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '-> ( 2 ,'youp' , 'foct' , 4347 , '2020-09-01' , 4589 , 'comm' ,3),
    -> ( 3 ,'' at line 3
mysql> INSERT INTO  emp VALUES
    -> ( 1 ,'zerty' , 'fct' , 4577 , '2020-09-01' , 453689 , 'comm' ,1);
Query OK, 1 row affected (0.08 sec)

mysql> INSERT INTO  emp VALUES
    -> ( 2 ,'youp' , 'foct' , 4347 , '2020-09-01' , 4589 , 'comm' ,3),
    -> ( 3 ,'name' , 'fonct' , 4337 , '2020-09-01' , 84589 , 'comma' ,4),
    -> ( 4 ,'salma' , 'foncti' ,3458 , '2020-09-02' , 845890 , 'comman' ,5),
    -> ( 5 ,'sa' , 'foncti' ,3459 , '2020-09-02' , 845890 , 'comman' ,2);
Query OK, 4 rows affected (0.17 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> select *
    -> from emp
    -> where comm is not null
    -> order by comm desc;
+------+-------+----------+------+------------+---------+--------+------+
| NumE | NomE  | fonction | Nums | embauche   | salaire | Comm   | NumD |
+------+-------+----------+------+------------+---------+--------+------+
|    4 | salma | foncti   | 3458 | 2020-09-02 |  845890 | comman |    5 |
|    5 | sa    | foncti   | 3459 | 2020-09-02 |  845890 | comman |    2 |
|    3 | name  | fonct    | 4337 | 2020-09-01 |   84589 | comma  |    4 |
|    1 | zerty | fct      | 4577 | 2020-09-01 |  453689 | comm   |    1 |
|    2 | youp  | foct     | 4347 | 2020-09-01 |    4589 | comm   |    3 |
+------+-------+----------+------+------------+---------+--------+------+
5 rows in set (0.00 sec)

mysql> select NomE
    -> FROM  emp
    -> where enbauche ='2020-09-01';
ERROR 1054 (42S22): Unknown column 'enbauche' in 'where clause'
mysql> select NomE
    -> FROM  emp
    -> where embauche ='2020-09-01';
+-------+
| NomE  |
+-------+
| zerty |
| youp  |
| name  |
+-------+
3 rows in set (0.06 sec)

mysql> select * from dept;
+------+------+--------+
| NumD | NomD | lieu   |
+------+------+--------+
|    1 | nom  | MHAMID |
|    2 | nom2 | AZLI   |
|    3 | nom3 | AZLI   |
|    4 | nom4 | AZLI   |
|    5 | nom5 | GUELIZ |
+------+------+--------+
5 rows in set (0.00 sec)

mysql> select NomE FROM EMP
    -> WHERE NumD IN (
    -> select NumD FROM DEPT
    -> WHERE lieu ='AZLI');
+------+
| NomE |
+------+
| sa   |
| youp |
| name |
+------+
3 rows in set (0.00 sec)

mysql> select NomE
    -> FROM EMP
    -> WHERE NumS = 'KABBOUR';
Empty set, 1 warning (0.05 sec)

mysql> select avg(salaire)
    -> from emp;
+--------------+
| avg(salaire) |
+--------------+
|     446929.4 |
+--------------+
1 row in set (0.00 sec)

mysql> select NomE
    -> FROM EMP
    -> WHERE NumS = (
    -> select NomE
    -> FROM EMP
    -> WHERE ^C
mysql> select NomE
    -> FROM EMP
    -> WHERE NumS = (
    -> select NumE
    -> FROM EMP
    -> WHERE NomE = 'kabbour');
Empty set (0.00 sec)

mysql> select count(*)
    -> from emp
    -> where comm is not null;
+----------+
| count(*) |
+----------+
|        5 |
+----------+
1 row in set (0.05 sec)

mysql> select NomE
    -> FROM EMP
    -> WHERE salaire > avg(salaire);
ERROR 1111 (HY000): Invalid use of group function
mysql> select NomE
    -> FROM EMP
    -> WHERE salaire > (select avg(salaire) from emp);
+-------+
| NomE  |
+-------+
| zerty |
| salma |
| sa    |
+-------+
3 rows in set (0.00 sec)

mysql>