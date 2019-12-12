--create range partition table with date data type and no maxvalue


create table range_test(id int,	
			   test_time time,
			   test_date date,
			   test_timestamp timestamp, primary key(id,test_date))
   	PARTITION BY RANGE (test_date) (
	PARTITION p0 VALUES LESS THAN ('2006-02-01'),
	PARTITION p1 VALUES LESS THAN ('2006-03-01'),
	PARTITION p2 VALUES LESS THAN ('2006-04-01')
);

select * from db_class where class_name like 'range_test%' order by 1;


drop table range_test;
