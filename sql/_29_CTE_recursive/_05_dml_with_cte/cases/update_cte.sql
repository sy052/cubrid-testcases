drop if exists t1,t2;
create table t1 (a int, b  varchar(32));
insert into t1 values(1,'ccc');  
insert into t1 values(3,'eee');
create table t2 (c int);
insert into t2 values(3);
update t2 set c=(with recursive subquery_t1 as(select a from t1 where t1.a<3)select * from subquery_t1);
drop if exists t1,t2;
