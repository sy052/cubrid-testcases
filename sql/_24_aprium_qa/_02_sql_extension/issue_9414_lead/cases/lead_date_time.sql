--TEST: test with date/time data types and normal syntax
--syntax: LEAD(expr, offset, default)


create table lead_dt(
	col1 date,
	col2 time, 
	col3 timestamp,
	col4 datetime
);


insert into lead_dt values('2000-12-12', '11:11:11', '1990-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('2000-12-12', '12:12:12', '1991-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('2000-12-12', '11:11:11', '1992-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('2000-12-12', '12:12:12', '1993-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('2000-12-12', '11:11:11', '1994-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1999-11-11', '12:12:12', '1995-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1999-11-11', '11:11:11', '1996-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1999-11-11', '11:11:11', '1997-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1999-11-11', '13:13:13', '1998-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('10/10/2001', '11:11:11', '1999-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('10/10/2001', '11:11:11', '2000-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('10/10/2001', '13:13:13', '2001-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values('2011-11-23', '11:11:11', '2002-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1888-09-09', '11:11:11', '2003-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1888-09-09', '12:12:12', '2004-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1888-09-09', '11:11:11', '2005-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1888-09-09', '11:11:11', '2006-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1888-09-09', '13:13:13', '2007-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1888-09-09', '11:11:11', '2008-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');
insert into lead_dt values(date'1888-09-09', '11:11:11', '2009-1-1 11:11:11', datetime'2011-11-11 11:11:11.111');


--TEST: OVER() clause
select new.col1, new.col2, lead(new.col1) over() next_v from (select * from lead_dt order by 1,2,3,4) new order by 1, 2;
--TEST: with where clause
select col3, col4, col2, lead(col2, 3, null) over() from (select * from lead_dt order by 1,2,3,4) where col1 > '2000-12-12'  ;
--TEST: syntax error
select col1, col3, col4, lead(1) over next_v from lead_dt;
select col1, col3, col2, lead(20) over(1) next_v from lead_dt;


--TEST: OVER(PARTITION BY) clause
--TEST: partition by date
select col1, col2, col3, col4, lead(col2) over(partition by col1) next_v from (select * from lead_dt order by 1,2,3,4);
select col1, col2, col3, col4, lead(col3, 2) over(partition by 1) next_v from (select * from lead_dt order by 1,2,3,4);
--TEST: partition by time
select col1, col2, col3, col4, lead(col2, 3, '1999-01-01') over(partition by col2) next_v from (select * from lead_dt order by 1,2,3,4);
select new.col1, new.col2, new.col3, new.col4, lead(new.col3, 4) over(partition by 2) next_v from (select * from lead_dt order by 1,2,3,4) new order by 1;
--TEST: partition by timestamp
select col1, col2, col3, col4, lead(col4, 5, date'2012-12-21') over(partition by col3) next_v from (select * from lead_dt order by 1,2,3,4);
--TEST: partition by datetime
select new.col1, new.col2, new.col3, new.col4, lead(new.col1, 6) over(partition by new.col4) next_v from (select * from lead_dt order by 1,2,3,4) new order by 1;



--TEST: OVER(ORDER BY) clause
--TEST: order by 1 column name
select col1, lead(col1, 1, null) over(order by col1) next_v from lead_dt order by 1, 2;
--TEST: order by 2 column names
select col2, col3, lead(col2, 10, '0001-01-01') over(order by col2, col3 asc) next_v from lead_dt order by 1, 2, 3;
--TEST: order by more than 2 column names
select col1, col2, col3, col4, lead(col1, 2, '1212-12-12') over(order by col1, col2 desc, col3, col4 asc) next_v from lead_dt order by 1, 2, 3, 4, 5;
--TEST: order by columns not selected
select col3, lead(col4, 3, null) over(order by col4 desc, col2, col1 asc) next_v from lead_dt order by 1;
--TEST: order by 1 position
select col4, lead(col4, 100, 'aaa') over(order by 1) next_v from lead_dt order by 1, 2;
--TEST: order by 3 positions
select col3, col2, lead(col1, 10) over(order by 1, 2 desc, 3 asc) next_v from lead_dt;
--TEST: order by more than 3 positions
select col1, col2, col3, col4, lead(col3) over(order by 3, 2 asc, 1 desc, 4) next_v from lead_dt;
--TEST: order by positions not existed
select col2, lead(col4) over(order by 2) next_v from lead_dt;
select col1, lead(col3) over(order by 4, 5, 1 desc, 3), col3, col2, col4 from lead_dt;
select col3, col4, lead(col2, 1, null) over(order by 5) next_v from lead_dt;
select col3, col1, lead(col1, 22, null) over(order by 100) next_v from lead_dt;
--TEST: order by column names and positions
select col1, col2, col3, col4, lead(col4, 20, '9999-12-31 23:59:59') over(order by 1, col2 desc, 3, col4 asc) next_v from lead_dt;




--TEST: OVER(PARTITION BY ORDER BY) clause
--TEST: partition by date
select col1, col2, col3, lead(col1) over(partition by col1 order by col1, col2, col3) from lead_dt;
--TEST: partition by time
select col2, col4, col1, lead(col2, 2, '12:12:12') over(partition by col2 order by col2, col4, col1 desc) from lead_dt;
--TEST: partition by timestamp
select col3, lead(col3, 5) over(partition by col3 order by col3) next_v, col2 from lead_dt;
--TEST: partition by datetime
select col4, col1, lead(col4, 100, 4) over(partition by col4 order by 1, 2 desc) next_v from lead_dt;



drop table lead_dt; 















