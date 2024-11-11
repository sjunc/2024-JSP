c/s 환경
DB는 일반적으로 서버에 들어가 있음.

3계층으로 이루어짐.

.jsp            * 미들웨어 *            basicdatabase
화면            JDBC                    member 테이블
클라이언트       .jar 파일 받은 거      권한으로 컨트롤
                                        기본 (root) 권한
                                        ID와 사용자를 새로 만들어 사용

try{정상실행}
catch{예외 처리}













cd C:\Program Files\MySQL\MySQL Server 8.0\bin

C:\Program Files\MySQL\MySQL Server 8.0\bin>mysql -u root -p
Enter password: ********
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.39 MySQL Community Server - GPL

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases
    -> show databases;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'show databases' at line 2
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| db                 |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)

mysql> create database basicjsp
    -> ;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| basicjsp           |
| db                 |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
6 rows in set (0.00 sec)

mysql> create user 'jspid'@'localhost'
    -> identified by 'jsppass';
Query OK, 0 rows affected (0.02 sec)

mysql> grant all privileges on basicjsp.*to 'jspid'      --모든 권한 부여.
    -> @'localhost';
Query OK, 0 rows affected (0.01 sec)

 grant PROCESS on *.* to 'jspid'@'localhost';

flush privileges;           --변경사항 저장





















