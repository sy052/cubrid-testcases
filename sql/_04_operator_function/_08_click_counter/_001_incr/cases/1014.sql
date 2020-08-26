-- create class,insert data,create class,insert data,select clause with  incr(object.attribute) function

create class xoo ( a int, b int);
insert into xoo values(1, 1);
insert into xoo values(2, 2);
insert into xoo values(3, 3);
create class yoo ( a int, b int);
insert into yoo values(1, 1);
insert into yoo values(2, 2);
select incr(xoo.a), incr(yoo.b)
from xoo, yoo
where xoo.a = yoo.a and xoo.a = 1;

select * from xoo order by 1,2;
select * from yoo order by 1,2;

drop xoo, yoo;
