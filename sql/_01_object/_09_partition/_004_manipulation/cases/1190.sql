--[er]test insert(date) for list partition(have no NULL value) with null value.
create table list_test(id int,	
				test_time time,
				test_date date,
				test_timestamp timestamp, primary key(id,test_date))
		PARTITION BY LIST (test_date) (
		PARTITION p0 VALUES IN ('2006-01-01','2006-02-01','2006-03-01')
	);
insert into list_test values(5,NULL,NULL,NULL);
select * from list_test order by 1;


drop table list_test;
