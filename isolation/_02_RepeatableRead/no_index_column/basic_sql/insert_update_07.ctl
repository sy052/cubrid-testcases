/*
Test Case: insert & update
Priority: 1
Reference case:
Author: Lily

Test Point:
insert into ... select ... from ...

NUM_CLIENTS = 2
C1: insert into t values(2,'abc');
C1: update t set id=8 where id=3;
C2: insert into t2 select * from t order by 1; -- 2 will not insert into t2, insert 3 instead of 8
*/

MC: setup NUM_CLIENTS = 2;
C1: set transaction lock timeout INFINITE;
C1: set transaction isolation level repeatable read;
C2: set transaction lock timeout INFINITE;
C2: set transaction isolation level repeatable read;

/* preparation */
C1: drop table if exists t;
C1: create table t(id int,col varchar(10));
C1: insert into t values(1,'abc');
C1: insert into t values(3,'abc');
C1: insert into t values(7,'abc');
C1: drop table if exists t1;
C1: create table t1(id int primary key,col varchar(10));
C1: commit work;
MC: wait until C1 ready;

/* test case */
C2: insert into t values(10,'tea');
C1: insert into t values(2,'abc');
C1: update t set id=8 where id=3;
C1: commit;
C1: update t set id=17 where id=7;
C2: insert into t1 select * from t where id>2 order by 1 ;
C1: rollback work;
C2: select * from t order by 1;
C2: commit;
C2: select * from t order by 1;
C2: commit;

C2: quit;
C1: quit;

