--test mixed logical operators with integer operands on server side


create table pt_type_logical(col1 int, col2 int, col3 double, col4 double);

insert into pt_type_logical values(90021, -82932, 234.8080122384237492834234, 239874923.2934902384023);


select (col1 xor col2 xor 0 xor 0 xor col3 xor col4) from pt_type_logical;
select (col1 and 0 or col2 xor true), (not col3 and 1 xor (not col4 or false)) from pt_type_logical where (col1 xor not col2 or 0) = 1;
select (not col3 xor (col1 or 0) xor ((col1 and col2 or not false) xor (col4 or col3 xor true or null))) from pt_type_logical;


drop table pt_type_logical;
