--[er]test updating time type list partition using three partitions and invalid value not exist in partitions
create table list_test(id int not null ,	
				   test_time time,
				   test_date date,
				   test_timestamp timestamp,
                                   primary key (id, test_time))
		PARTITION BY LIST (test_time) (
		PARTITION p0 VALUES IN ('09:00:00','09:10:00','09:20:00'),
		PARTITION p1 VALUES IN ('10:00:00','10:10:00',null,'10:20:00'),
		PARTITION p2 VALUES IN ('11:00:00','11:10:00','11:20:00')
	);
insert into list_test values(1,'09:00:00','2006-02-01','2006-02-01 09:00:00'); 
insert into list_test values(2,'09:10:00','2006-02-11','2006-02-11 09:00:00'); 
insert into list_test values(3,'09:20:00','2006-02-21','2006-02-21 09:00:00'); 
insert into list_test values(4,'10:00:00','2006-03-01','2006-03-01 09:00:00'); 
insert into list_test values(5,'10:10:00','2006-03-11','2006-03-11 09:00:00'); 
insert into list_test values(6,'10:20:00','2006-03-21','2006-03-21 09:00:00'); 
insert into list_test values(7,'11:00:00','2006-04-01','2006-04-01 09:00:00'); 
insert into list_test values(8,'11:10:00','2006-04-11','2006-04-11 09:00:00'); 
insert into list_test values(9,'11:20:00','2006-04-21','2006-04-21 09:00:00'); 
insert into list_test values(11,'09:00:00','2006-02-01','2006-02-01 09:00:00');
insert into list_test values(12,'09:10:00','2006-02-11','2006-02-11 09:00:00');
insert into list_test values(13,'09:20:00','2006-02-21','2006-02-21 09:00:00');
insert into list_test values(14,'10:00:00','2006-03-01','2006-03-01 09:00:00');
insert into list_test values(15,'10:10:00','2006-03-11','2006-03-11 09:00:00');
insert into list_test values(16,'10:20:00','2006-03-21','2006-03-21 09:00:00');
insert into list_test values(17,'11:00:00','2006-04-01','2006-04-01 09:00:00');
insert into list_test values(18,'11:10:00','2006-04-11','2006-04-11 09:00:00');
insert into list_test values(19,'11:20:00','2006-04-21','2006-04-21 09:00:00');
create table list_test2(id int not null primary key,	
				   test_time time,
				   test_date date,
				   test_timestamp timestamp);
insert into list_test2 values(1,'09:00:00','2006-02-01','2006-02-01 09:00:00'); 
insert into list_test2 values(2,'09:10:00','2006-02-11','2006-02-11 09:00:00'); 
insert into list_test2 values(3,'09:20:00','2006-02-21','2006-02-21 09:00:00'); 
insert into list_test2 values(4,'10:00:00','2006-03-01','2006-03-01 09:00:00'); 
insert into list_test2 values(5,'10:10:00','2006-03-11','2006-03-11 09:00:00'); 
insert into list_test2 values(6,'10:20:00','2006-03-21','2006-03-21 09:00:00'); 
insert into list_test2 values(7,'11:00:00','2006-04-01','2006-04-01 09:00:00'); 
insert into list_test2 values(8,'11:10:00','2006-04-11','2006-04-11 09:00:00'); 
insert into list_test2 values(9,'11:20:00','2006-04-21','2006-04-21 09:00:00'); 
insert into list_test2 values(11,'09:00:00','2006-02-01','2006-02-01 09:00:00');
insert into list_test2 values(12,'09:10:00','2006-02-11','2006-02-11 09:00:00');
insert into list_test2 values(13,'09:20:00','2006-02-21','2006-02-21 09:00:00');
insert into list_test2 values(14,'10:00:00','2006-03-01','2006-03-01 09:00:00');
insert into list_test2 values(15,'10:10:00','2006-03-11','2006-03-11 09:00:00');
insert into list_test2 values(16,'10:20:00','2006-03-21','2006-03-21 09:00:00');
insert into list_test2 values(17,'11:00:00','2006-04-01','2006-04-01 09:00:00');
insert into list_test2 values(18,'11:10:00','2006-04-11','2006-04-11 09:00:00');
insert into list_test2 values(19,'11:20:00','2006-04-21','2006-04-21 09:00:00');
insert into list_test2 values(20,'12:20:00','2006-05-21','2006-05-21 09:00:00');
insert into list_test2 values(50,NULL,NULL,NULL);
update list_test set test_time  = (select test_time from list_test2 where  id = 8) where test_time ='09:00:00';
update list_test set test_time = (select test_time from list_test2 where  id = 20) where test_time = '10:00:00';
select * from list_test order by id;
select * from list_test__p__p0 order by id;
select * from list_test__p__p1 order by id;
select * from list_test__p__p2 order by id;

drop table list_test;
drop table list_test2;
