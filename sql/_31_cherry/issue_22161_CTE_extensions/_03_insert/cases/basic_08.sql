drop table if exists t1,t2,t3;  
CREATE TABLE t1 (a INT);
CREATE TABLE t2 (a INT);
CREATE TABLE t3 (a INT);
INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (1),(2),(3);
INSERT INTO t3 VALUES (1),(2),(3);


drop table if exists foo;
create table foo as
SELECT * FROM (WITH a AS (SELECT * FROM t1) select * from a) as x;

insert into foo 
SELECT * FROM (WITH a AS (SELECT * FROM t1) select * from a) as x;

select * from foo order by 1;

insert into foo
WITH a AS (SELECT * FROM t1) select a.* from foo NATURAL JOIN a NATURAL JOIN t2 NATURAL JOIN t3  where a.a=t2.a and t2.a=t3.a and rownum<2;
select * from foo order by 1;

insert into foo
WITH a AS (SELECT * FROM t1) select a.*  FROM foo NATURAL JOIN a NATURAL JOIN t2 NATURAL JOIN t3 where a.a=t2.a;
select * from foo order by 1;

DROP TABLE t1,t2,t3;

drop table if exists t1;
drop view if exists v1;
create table t1 (a int);
insert into t1 values (20), (30), (10);
create view v1 as select * from t1 where a > 10;

drop table if exists foo;
create table foo as
with t1 as (select * from v1) select * from t1 order by 1;
select * from foo order by 1;

insert into foo
with t1 as (select * from v1) select * from t1 order by 1;
select * from foo order by 1;

replace into foo
with t1 as (select * from v1) select * from t1 order by 1;
select * from foo order by 1;

insert into foo
with t2 as (select * from v1) select v1.* from v1 where a in (select a from t2 );
select * from foo order by 1;

insert into foo
with t2 as (select * from v1) select foo.* from foo where a <>all(select a from t2 );
select * from foo order by 1;

drop view v1;
drop table t1;

drop table if exists ten, one_k;
create table ten(a int primary key);
insert into ten values (0),(1),(2),(3),(4);
 
create table one_k(a int primary key);
insert into one_k 
with cte as
(
    select A.a + B.a* 10 + C.a * 100 from ten A, ten B, ten C
) select * from cte;

with cte as
(
 select * from one_k
) select count(*) from cte;


replace into one_k 
with cte as
(
    select A.a + B.a* 10 + C.a * 100 from ten A, ten B, ten C
) select * from one_k where a in (select * from cte);


with cte as
(
 select * from one_k
) select count(*) from cte;

drop table ten, one_k;

DROP TABLE if exists t1,t2,t3;
CREATE TABLE t1 (i1 INT,primary KEY(i1));
INSERT INTO t1 VALUES (4),(8);
                        
CREATE TABLE t2 (a2 INT, b2 INT, primary KEY(b2));
INSERT INTO t2 VALUES (8,7);
            
CREATE TABLE t3 (i3 INT);
INSERT INTO t3 VALUES (2),(6);
 
insert into t3
with cte as
(
 select * from t1
 intersection
 select a2 from t2 
)select * from cte
union 
select * from t3;

select * from t3 order by 1;


replace into t3
with cte as
(
 select * from t1
 intersection
 select a2 from t2
)select * from cte
union 
select * from t3;


DROP TABLE t1,t2,t3;

drop table if exists  employees;
create table employees (
  name varchar(32),
  dept varchar(32),
  country varchar(8)
);
 
insert into employees 
values 
('Sergei Golubchik', 'Development', 'DE'),
('Claudio Nanni', 'Support', 'ES'),
('Sergei Petrunia', 'Development', 'RU');

drop table if exists foo;
create table foo as
with eng as 
(
   select * from employees
   where dept in ('Development','Support')
),
eu_eng  as 
(
  select * from eng where country IN ('DE','ES','RU')
)
select * from eu_eng T1 
where 
  not exists (select 1 from eu_eng T2 
              where T2.country=T1.country
              and T2.name <> T1.name)
order by 1,2;

insert into foo
with eng as
(
   select * from employees
   where dept in ('Development','Support')
),
eu_eng  as
(
  select * from eng where country IN ('DE','ES','RU')
)
select *  from foo
where
   exists (select 1 from eu_eng T2,eu_eng T1
   where T2.country=T1.country
   and T2.name <> T1.name
);
select * from foo order by 1,2,3;

insert into foo
with eng as
(
   select * from employees
   where dept in ('Development','Support')
),
eu_eng  as
(
  select * from eng where country IN ('DE','ES','RU')
)
select * from foo 
where
  not exists (select 1 from eu_eng T2,eu_eng T1
   where T2.country=T1.country
   and T2.name <> T1.name
);
select * from foo order by 1,2,3;

drop table if exists employees,foo,t1,t2,t3;
