create class test_class (bigint_col bigint, smallint_col smallint, int_col int, numeric_col numeric,float_col float, double_col double);
insert into test_class(bigint_col, smallint_col, int_col, numeric_col, float_col, double_col) values (-100, 1, 2, 3.3, 4.4, 5.5);
insert into test_class(bigint_col, smallint_col, int_col, numeric_col, float_col, double_col) values (0, 1, 2, 3.3, 4.4, 5.5);
insert into test_class(bigint_col, smallint_col, int_col, numeric_col, float_col, double_col) values (100, 1, 2, 3.3, 4.4, 5.5);

update test_class set bigint_col = bigint_col + 1;
update test_class set bigint_col = bigint_col - 1;
update test_class set bigint_col = bigint_col / 2;
update test_class set bigint_col = bigint_col * 2;

select * from test_class order by 1;

drop class test_class;