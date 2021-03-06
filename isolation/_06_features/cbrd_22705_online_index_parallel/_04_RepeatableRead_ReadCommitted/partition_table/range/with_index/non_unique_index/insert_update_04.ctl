/*
Test Case: insert & update
Priority: 1
Reference case:
Author: Rong Xu

Test Point:
-    Insert: X_LOCK on first key OID for unique indexes.
-    Update: X_LOCK acquired on current instance
one user insert 1, another update 1 to 1

NUM_CLIENTS = 2
C1: insert into t values(1,'abc');
C2: update t set id=1 where id=1;  --expected no block
*/

MC: setup NUM_CLIENTS = 2;
C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level repeatable read;

C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level read committed;

/* preparation */
C1: drop table if exists t;
C1: create table t(id int,col varchar(10)) partition by range(id)(partition p1 values less than (10),partition p2 values less than (100));
C1: insert into t values(1,'abc');
C1: create index idx on t(id) with online parallel 3;
C1: commit work;
MC: wait until C1 ready;

/* test case */
C1: insert into t values(1,'abc');
MC: wait until C1 ready;
C2: update t set id=1 where id=1;
MC: wait until C2 ready;
C1: commit work;
MC: wait until C1 ready;

C2: commit work;
C2: select * from t order by 1,2;
C2: commit;

C2: quit;
C1: quit;
