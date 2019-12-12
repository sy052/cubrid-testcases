--use lead function in a subquery


create table lead_sq(
	col1 smallint auto_increment primary key,
	col2 bigint not null,
	col3 varchar default 'abc',
	col4 timestamp default CURRENT_TIMESTAMP,
	col5 bit(20)
);


insert into lead_sq(col2, col3, col4, col5) values(500, 'cubrid', '1990-10-10 11:12:13', B'0001');
insert into lead_sq(col2, col3, col4, col5) values(500, 'cubrid', '1990-11-10 11:12:13', B'0010');
insert into lead_sq(col2, col3, col4, col5) values(500, 'mysql', '1990-10-11 11:12:13', B'0100');
insert into lead_sq(col2, col3, col4, col5) values(500, 'cubrid', '1990-10-10 11:12:13', B'1000');
insert into lead_sq(col2, col3, col4, col5) values(500, 'cubrid', '1991-10-10 11:12:13', B'0011');
insert into lead_sq(col2, col3, col4, col5) values(501, 'oracle', '1990-10-10 11:12:13', B'0101');
insert into lead_sq(col2, col3, col4, col5) values(501, 'cubrid', '1992-10-10 11:12:13', B'1001');
insert into lead_sq(col2, col3, col4, col5) values(501, 'oracle', '1990-11-10 11:12:13', B'0110');
insert into lead_sq(col2, col3, col4, col5) values(501, 'mysql', '1990-10-10 11:12:13', B'1010');
insert into lead_sq(col2, col3, col4, col5) values(501, 'cubrid', '1990-10-10 11:12:13', B'1100');
insert into lead_sq(col2, col3, col4, col5) values(501, 'mysql', '1991-11-10 11:12:13', B'0111');
insert into lead_sq(col2, col3, col4, col5) values(502, 'cubrid', '1990-10-10 11:12:13', B'1110');
insert into lead_sq(col2, col3, col4, col5) values(502, 'mysql', '1990-10-10 11:12:13', B'1111');
insert into lead_sq(col2, col3, col4, col5) values(502, 'mysql', '1992-10-10 11:12:13', B'1010');
insert into lead_sq(col2, col3, col4, col5) values(503, 'mysql', '1992-10-10 11:12:13', B'0101');
insert into lead_sq(col2, col3, col4, col5) values(503, 'cubrid', '1990-10-10 11:12:13', B'1110');
insert into lead_sq(col2, col3, col4, col5) values(503, 'cubrid', '1990-10-10 11:12:13', B'0111');
insert into lead_sq(col2, col3, col4, col5) values(503, 'oracle', '1993-11-10 11:12:13', B'1101');
insert into lead_sq(col2, col3, col4, col5) values(503, 'oracle', '1993-10-10 11:12:13', B'0011');
insert into lead_sq(col2, col3, col4, col5) values(503, 'cubrid', '1993-11-10 11:12:13', B'0001');
insert into lead_sq(col2, col3, col4, col5) values(503, 'cubrid', '1992-10-10 11:12:13', B'1100');
insert into lead_sq(col2, col3, col4, col5) values(504, 'mysql', '1994-10-10 11:12:13', B'1011');
insert into lead_sq(col2, col3, col4, col5) values(504, 'mysql', '1990-10-10 11:12:13', null);
insert into lead_sq(col2, col3, col4, col5) values(504, 'cubrid', '1995-11-10 11:12:13', B'0110');
insert into lead_sq(col2, col3, col4, col5) values(505, 'cubrid', '1991-10-10 11:12:13', '');
insert into lead_sq(col2, col3, col4, col5) values(505, 'cubrid', '1996-10-10 11:12:13', B'1111');
insert into lead_sq(col2, col3, col4, col5) values(505, 'mysql', '1990-10-10 11:12:13', B'0100');
insert into lead_sq(col2, col3, col4, col5) values(505, 'cubrid', '1995-10-10 11:12:13', null);
insert into lead_sq(col2, col3, col4, col5) values(505, 'cubrid', '1990-10-10 11:12:13', B'1111');



--TEST: lead function in a subquery as a select expression
select (select lead(col5) over(partition by col1 order by col2, col5) from lead_sq where col1=10) aaa from lead_sq;
--TEST: 2 tables
create table t(id int, str char(20));
insert into t values(1, 'aaa'), (2, 'bbb'), (3, 'ccc'), (4, 'ddd'), (5, 'eee'), (6, 'fff');
insert into t values(11, 'aaa'), (12, 'bbb'), (13, 'ccc'), (14, 'ddd'), (15, 'eee'), (16, 'fff');
--TEST: lead function in a subquery as a select expression
select c.col1, c.col3, (select lead(col1) over(partition by t.str order by t.id) from t where c.col1=t.id) next_v, c.col4, c.col5 from lead_sq c order by 1, 2, 3, 4, 5;



--TEST: Use lead functions in a subquery used as a table specification for the outer query
select next_v from (select lead(new.col2, 2) over() next_v from (select * from lead_sq order by 1,2,3,4,5) new ) order by 1;
select col1, col2, next_v, col3 from (select *, lead(col3, 3, col3.default) over(partition by col2 order by col1) next_v from lead_sq);
--TEST: Use lead functions in a subquery used as a table specification for the outer query, use the return result in the outer query
select col1, col2, next_v, col3 from (select *, lead(col4, 5, to_timestamp('1999-01-01')) over(partition by col2 order by col1) next_v from lead_sq) where next_v > 2;


--TEST: use lead functions in where clause
--TEST: combination with comparison operators

--TEST: combination with =
select col1, col2, col3, col4 from lead_sq where col1 = (select lead(col5, 22) over(partition by str order by id) next_v from t order by str limit 1);
--TEST: combination with <
select col1, col2, col3, col4 from lead_sq where col1 < (select max(next_v) from (select lead(col1, 2, 999) over(order by id desc) next_v from t order by str)) order by 1,2,3,4;
--TEST: combination with >=, self-contained
select col1, col2, col3, col4 from lead_sq where col1 >= (select lead(col2, 4, 100) over(partition by col3 order by col1) next_v from lead_sq where col1=15);

--TEST: combination with in
select col1, col3, col5 from lead_sq where col3 in (select lead(col3, 2, 'abc') over(partition by col2 order by col1) next_v from lead_sq) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col4 in (select lead(col4, 10) over(partition by col2 order by col1) next_v from lead_sq) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col5 in (select lead(col5, 1, X'123') over(partition by col2 order by col1) next_v from lead_sq) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col1 in (select lead(col1) over(partition by str order by id) next_v from t) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col2 in (select lead(col2) over(partition by str order by id) next_v from t) order by 1, 2, 3; 
--TEST: 1 table, combination with any, some, all
select col1, col3, col5 from lead_sq where col3 = any(select lead(col3) over(partition by col2 order by col2) next_v from lead_sq) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col4 = any(select lead(col4) over(partition by col2 order by col2,col3,col4) next_v from lead_sq order by col2) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col5 = some(select lead(col5) over(partition by col3 order by col5) next_v from lead_sq) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col1 = some(select lead(col1, 1) over(partition by col3 order by col5) next_v from lead_sq order by col3) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col2 = all(select lead(col2, 2) over(partition by col4 order by col1) next_v from lead_sq) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col3 = all(select lead(col3, 3) over(partition by col4 order by col1) next_v from lead_sq order by col4) order by 1, 2, 3; 
--TEST: 2 tables, combination with any, some, all
select col1, col3, col5 from lead_sq where col1 = any(select lead(id, 4) over(partition by str order by id) next_v from t) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col3 = some(select lead(str, 5) over(partition by str order by id) next_v from t) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col1 = all(select lead(id, 1, -100) over(partition by str order by id) next_v from t) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col1 > any(select lead(id, 2, -200) over(partition by str order by id) next_v from t) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col3 < some(select lead(str, 3, 'zzz') over(partition by str order by id) next_v from t) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col3 < some(select lead(str, 4, null) over(partition by str order by id) next_v from t order by str) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col1 > all(select lead(id) over(partition by str order by id) next_v from t) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq where col3 > all(select lead(str) over(partition by str order by id) next_v from t order by str) order by 1, 2, 3; 
--TEST: combination with exists, use lead functions in a correlated subquery
select col1, col3, col5 from lead_sq c where exists (select lead(col1, 10000, 10000) over(order by id) next_v from t where t.id=c.col1) order by 1, 2, 3; 
select col1, col3, col5 from lead_sq c where exists (select lead(col2, 2000000, 2) over(partition by str order by id) next_v from t where t.id=c.col1) order by 1, 2, 3; 




drop table t;
drop table lead_sq;


