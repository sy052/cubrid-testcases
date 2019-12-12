create class test_class (date_col date, time_col time, timestamp_col timestamp, datetime_col datetime)
partition by list ( datetime_col) (
  partition p0 values in (DATETIME '1002-01-02 23:59:59.999', DATETIME '1003-01-02 23:59:59.999', DATETIME '1004-01-02 23:59:59.999'),
  partition p1 values in (DATETIME '2002-01-02 23:59:59.999', DATETIME '2003-01-02 23:59:59.999', DATETIME '2004-01-02 23:59:59.999'),
  partition p2 values in (NULL)
);


insert into test_class(datetime_col) values (DATETIME '1004-01-02 23:59:59.999');
insert into test_class(datetime_col) values (DATETIME '1002-01-02 23:59:59.999');
insert into test_class(datetime_col) values (DATETIME '1003-01-02 23:59:59.999');
insert into test_class(datetime_col) values (DATETIME '2004-01-02 23:59:59.999');
insert into test_class(datetime_col) values (DATETIME '2002-01-02 23:59:59.999');
insert into test_class(datetime_col) values (DATETIME '2003-01-02 23:59:59.999');
insert into test_class(datetime_col) values (NULL);

insert into test_class(datetime_col) values (DATETIME '1903-01-02 23:59:59.999');

select * from test_class order by datetime_col;
select * from test_class__p__p0 order by datetime_col ;
select * from test_class__p__p1 order by datetime_col ;
select * from test_class__p__p2 order by datetime_col ;

select * from test_class__p__p0 where datetime_col is NULL order by 4;

drop class test_class;
