create class test_class (bigint_col bigint, char_col char(10));
insert into test_class(bigint_col, char_col) values (-100, 'minus');
insert into test_class(bigint_col, char_col) values (0, 'zero');
insert into test_class(bigint_col, char_col) values (100, 'plus');
insert into test_class(bigint_col, char_col) values (109, 'plus');
insert into test_class(bigint_col, char_col) values (100, 'plus');
insert into test_class(bigint_col, char_col) values (109, 'plus');
insert into test_class(bigint_col, char_col) values (NULL, 'null');

select bigint_col, STDDEV(bigint_col) from test_class group by bigint_col  order by 1;
select bigint_col, STDDEV(DISTINCT bigint_col) from test_class group by bigint_col order by 1;
select bigint_col, STDDEV(UNIQUE bigint_col) from test_class group by bigint_col order by 1;
select bigint_col, STDDEV(ALL bigint_col) from test_class group by bigint_col order by 1;

drop class test_class;