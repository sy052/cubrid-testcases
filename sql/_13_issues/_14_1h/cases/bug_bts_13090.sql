drop table if exists ttt;
create table ttt(numerictest numeric(38,10));
insert into ttt values (9876543210987654321012345678.1);
insert into ttt values ( 0);
insert into ttt values ( 5);
insert into ttt values ( null);
select sum(numerictest) from ttt;
select avg(numerictest) from ttt order by 1;
drop table ttt;

create table ttt(numerictest numeric(38,10));
insert into ttt values (  -9876543210987654321012345678.0123456789);
insert into ttt values ( 9876543210987654321012345678.0123456789);
select sum(numerictest) from ttt;
select avg(numerictest) from ttt order by 1;
insert into ttt values ( -9876543210987654321012345678.0123456789);
insert into ttt values (  9876543210987654321012345678.0123456789);
select sum(numerictest) from ttt;
select avg(numerictest) from ttt order by 1;
drop  ttt;
