create class test_class (date_col date, time_col time, timestamp_col timestamp, datetime_col datetimetz, datetime_col1 datetimetz);

insert into test_class values (DATE '01/01/1971', TIME '09:00:00', TIMESTAMP '01/01/1972 10:30:00', datetimetz '1970-01-01 00:00:00.000', datetimetz '1970-01-01 00:00:00.000');
insert into test_class values (DATE '01/02/2009', TIME '19:10:00', TIMESTAMP '01/11/2009 10:31:00', datetimetz '2008-01-12 08:08:08.999', datetimetz '2008-02-12 08:08:08.999');
insert into test_class values (DATE '01/02/2009', TIME '19:10:00', TIMESTAMP '01/11/2009 10:31:00', datetimetz '2008-03-12 08:08:08.999', datetimetz '2008-01-12 08:08:08.999');

select * from test_class where timestamp_col = 0 order by 1,4;
select * from test_class where timestamp_col <> 0 order by 1,4;
select * from test_class where timestamp_col > 0 order by 1,4;
select * from test_class where timestamp_col < 0 order by 1,4;
select * from test_class where timestamp_col >= 0 order by 1,4;
select * from test_class where timestamp_col <= 0 order by 1,4;

drop class test_class;