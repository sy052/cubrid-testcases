/*
Test Case: delete & select
Priority: 2
Reference case: cc_basic/_01_ReadCommitted/primary_key_column/multiple_pk/delete_select_01.ctl
Author: Lily

Test Point:
Uncommitted data are never seen by other queries.

NUM_CLIENTS = 3
C1: DELETE FROM tb1 ;  --commited
C2: DELETE FROM tb1 ;  --not commited
C3: SELECT * FROM tb1 ORDER BY id;
*/

MC: setup NUM_CLIENTS = 3;
C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level repeatable read;
C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;
C3: set transaction lock timeout INFINITE;
C3: set transaction isolation level read committed;
/* preparation */
C1: DROP TABLE IF EXISTS tb1;
C1: CREATE TABLE tb1(id INT,col VARCHAR(10),PRIMARY KEY (id,col));
C1: INSERT INTO tb1 VALUES(1,'abc');INSERT INTO tb1 VALUES(1,'efd');INSERT INTO tb1 VALUES(2,'xyz');INSERT INTO tb1 VALUES(2,'tea');INSERT INTO tb1 VALUES(2,'web');INSERT INTO tb1 VALUES(3,'xyz');INSERT INTO tb1 VALUES(3,'fun');
C1: commit;
MC: wait until C1 ready;

/* test case */
C1: DELETE FROM tb1 WHERE id=3 AND col='xyz';
MC: wait until C1 ready;
C2: DELETE FROM tb1 WHERE id=3 AND col='fun';
MC: wait until C2 ready;
C1: commit;
MC: wait until C1 ready;

C1: insert into tb1 values(6,'cow');
C1: SELECT * FROM tb1 WHERE id >0 ORDER BY id; 
MC: wait until C1 ready;
C2: SELECT * FROM tb1 WHERE id >0 ORDER BY id;    
MC: wait until C2 ready;
C3: SELECT * FROM tb1 WHERE id >0 ORDER BY id;    
MC: wait until C3 ready;
C2: commit;
C2: SELECT * FROM tb1 WHERE id >0 ORDER BY id;                   
MC: wait until C2 ready;
C1: SELECT * FROM tb1 WHERE id >0 ORDER BY id;
C1: commit;
MC: wait until C1 ready;
C3: SELECT * FROM tb1 WHERE id >0 ORDER BY id;
MC: wait until C3 ready;

C2: commit;
C3: commit;
C3: quit;
C2: quit;
C1: quit;
