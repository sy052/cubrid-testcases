--TEST: test with reuse_oid tables 


create table var_samp_collection(
	col1 set(int, char(1)),
	col2 multiset(char(2), smallint), 
	col3 list(timestamp, bigint),
	col4 sequence(varchar, datetime),
	col5 int
);


insert into var_samp_collection values({1, 2, 3}, {1, 1, 3, 'a'}, {'1990-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 123);
insert into var_samp_collection values({1, 2, 3}, {'d', 4, 'd', 4, 'd'}, {'1991-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, null);
insert into var_samp_collection values({1, 2, 3}, {1, 1, 3, 'a'}, {'1992-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 3243);
insert into var_samp_collection values({1, 2, 3}, {'d', 4, 'd', 4, 'd'}, {'1993-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 393.234);
insert into var_samp_collection values({1, 2, 3}, {1, 1, 3, 'a'}, {'1994-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 2343);
insert into var_samp_collection values({3, 5, 'a', 'b'}, {'d', 4, 'd', 4, 'd'}, {'1995-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 8989.23);
insert into var_samp_collection values({3, 5, 'a', 'b'}, {1, 1, 3, 'a'}, {'1996-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 93843.23);
insert into var_samp_collection values({3, 5, 'a', 'b'}, {1, 1, 3, 'a'}, {'1997-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, null);
insert into var_samp_collection values({3, 5, 'a', 'b'}, {'r', 8, 'r', 10}, {'1998-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 4839.33);
insert into var_samp_collection values({'c', 3, 'd'}, {1, 1, 3, 'a'}, {'1999-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 48992);
insert into var_samp_collection values({'c', 3, 'd'}, {1, 1, 3, 'a'}, {'2000-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 93849.33);
insert into var_samp_collection values({'c', 3, 'd'}, {'r', 8, 'r', 10}, {'2001-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'cubrid', 'mysql'}, 1233.555);
insert into var_samp_collection values({'e', 'f', 'g'}, {1, 1, 3, 'a'}, {'2002-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 78989.342);
insert into var_samp_collection values({11, 12, 'k', 'g'}, {1, 1, 3, 'a'}, {'2003-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 9999.333);
insert into var_samp_collection values({11, 12, 'k', 'g'}, {'d', 4, 'd', 4, 'd'}, {'2004-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 4832.3423);
insert into var_samp_collection values({11, 12, 'k', 'g'}, {1, 1, 3, 'a'}, {'2005-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 34234);
insert into var_samp_collection values({11, 12, 'k', 'g'}, {1, 1, 3, 'a'}, {'2006-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 8903489);
insert into var_samp_collection values({11, 12, 'k', 'g'}, {'r', 8, 'r', 10}, {'2007-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 234.564);
insert into var_samp_collection values({11, 12, 'k', 'g'}, {1, 1, 3, 'a'}, {'2008-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 8934.234);
insert into var_samp_collection values({11, 12, 'k', 'g'}, {1, 1, 3, 'a'}, {'2009-1-1 11:11:11', 12, 10000000, 234234234234}, {datetime'2011-11-11 11:11:11.111', 'mysql', 'cubrid'}, 58943.33);


--create view
create view var_samp_view as select * from var_samp_collection where 1 > 0;


--TEST: OVER() clause
--TEST: set 
select col1, col2, var_samp(col5) over() from var_samp_view order by 1, 2;
--TEST: multiset, with alias+all
select col2, col3, var_samp(all col5) over() var_samp from var_samp_view order by 1, 2;
--TEST: list, with where clause
select col3, col4, var_samp(unique col5) over() var_samp from var_samp_view where col1 > {1, 2, 3} order by col3, col4;
--TEST: sequence, distinct
select col4, col1, var_samp(distinct col5) over() var_samp from var_samp_view order by 1, 2;
--TEST: syntax error select *, var_samp(col5) over() var_samp from count)numeric;
select col1, col3, col4, var_samp(distinctrow col5) over var_samp from var_samp_view;
select col1, col3, col2, var_samp(col5) over(1) var_samp from var_samp_view;



--TEST: OVER(PARTITION BY) clause
--TEST: partition by set
select col1, col2, col3, col4, var_samp(unique col5) over(partition by col1) var_samp from var_samp_view order by 1, 2, 3, 4;
--TEST: partition by multiset
select col1, col2, col3, col4, var_samp(col5) over(partition by col2) var_samp from var_samp_view order by 2, 1, 3, 4;
--TEST: partition by list
select col1, col2, col3, col4, var_samp(all col5) over(partition by col3) var_samp from var_samp_view order by 3, 1, 2, 4;
--TEST: partition by sequence
select col1, col2, col3, col4, var_samp(col5) over(partition by col4) var_samp from var_samp_view order by 4, 1, 2, 3, 5;



--TEST: OVER(ORDER BY) clause
--TEST: order by 1 column name
select col1, var_samp(distinct col5) over(order by col1) var_samp from var_samp_view;
--TEST: order by 2 column names
select col2, col3, var_samp(col5) over(order by col2, col3 asc) var_samp from var_samp_view;
--TEST: order by more than 2 column names
select col1, col2, col3, col4, var_samp(distinctrow col5) over(order by col1, col2 desc, col3, col4 asc) var_samp from var_samp_view;
--TEST: order by columns not selected
select col3, var_samp(col5) over(order by col4 desc, col2, col1 asc) var_samp from var_samp_view;
--TEST: order by 1 position
select col4, var_samp(all col5) over(order by 1) var_samp from var_samp_view;
--TEST: order by 3 positions
select col3, col2, var_samp(col5) over(order by 1, 2 desc, 3 asc) var_samp from var_samp_view;
--TEST: order by more than 3 positions
select col1, col2, col3, col4, var_samp(unique col5) over(order by 3, 2 asc, 1 desc, 4) var_samp from var_samp_view;
--TEST: order by positions not existed
select col2, var_samp(col5) over(order by 2) var_samp from var_samp_view;
select col1, var_samp(col5) over(order by 3, 4, 1 desc) var_samp, col2, col4 from var_samp_view;
select col3, col4, var_samp(col5) over(order by 5) var_samp from var_samp_view;
select col3, col1, var_samp(col5) over(order by 100) var_samp from var_samp_view;
--TEST: order by column names and positions
select col1, col2, col3, col4, var_samp(col5) over(order by 1, col2 desc, 3, col4 asc) var_samp from var_samp_view;




--TEST: OVER(PARTITION BY ORDER BY) clause
--TEST: partition by set
select col1, col2, col3, var_samp(unique col5) over(partition by col1 order by col1, col2, col3) from var_samp_view;
--TEST: partition by multiset
select col2, col4, col1, var_samp(col5) over(partition by col2 order by col2, col4, col1 desc) from var_samp_view;
--TEST: partition by list
select col3, var_samp(all col5) over(partition by col3 order by col1, col2, col3) var_samp, col2 from var_samp_view;
--TEST: partition by sequence
select col4, col1, var_samp(distinct col5) over(partition by col4 order by col1, col2 desc) var_samp from var_samp_view;
--TEST: syntax error
select col1, col2, var_samp(col5) over(order by col1, col2 partition by col2) from var_samp_view;


drop view var_samp_view;
drop table var_samp_collection; 















