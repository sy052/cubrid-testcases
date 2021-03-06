create class test_class (bigint_col bigint, char_col char(10));
insert into test_class(bigint_col, char_col) values (100, 'plus');
insert into test_class(bigint_col, char_col) values (-100, 'minus');
insert into test_class(bigint_col, char_col) values (-2147483648, 'minus');
insert into test_class(bigint_col, char_col) values (-2147483648, 'minus');
insert into test_class(bigint_col, char_col) values (2147483647, 'plus');
insert into test_class(bigint_col, char_col) values (2147483647, 'plus');

select char_col, min(bigint_col) from test_class group by char_col order by 1;
select char_col, max(bigint_col) from test_class group by char_col order by 1;
select char_col, avg(bigint_col) from test_class group by char_col order by 1;
select char_col, sum(bigint_col) from test_class group by char_col order by 1;

drop class test_class;