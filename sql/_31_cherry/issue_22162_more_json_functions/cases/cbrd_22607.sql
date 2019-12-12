drop table if exists t;
create table t (i int , j json);
insert into t values (1, '[1,2, {"a":1}]' );
insert into t values (1,'1');
insert into t values (2, '{"a":1, "b":[1,2,3], "c":["a","b","c"]}');
insert into t values (2,'"A"');
insert into t values (3,'1');
select * from t order by i,j;
SELECT i, group_concat(j) from t group by i order by i,j;
SELECT i, max(j) from t group by i order by i,j;
SELECT i, min(j) from t group by i order by i,j;   
SELECT j, group_concat(i) from t group by j order by i,j;
SELECT j, max(i) from t group by j order by i,j;
SELECT j, min(i) from t group by j order by i,j;   
select avg(j) from t ;
select count(j) from t ;   
select j->'$."a"' from t order by j,i;
select sum(j->'$."a"') from t ;   
SELECT *, DENSE_RANK() OVER (PARTITION BY j ORDER BY j,i DESC) AS d_rank FROM t;
SELECT *, NTILE(2) OVER (ORDER BY j,i DESC) FROM t;
drop table if exists t;
