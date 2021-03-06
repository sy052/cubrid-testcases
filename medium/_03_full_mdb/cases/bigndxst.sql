autocommit off;
create table bigindexstat(a int, b char(40));
create table medindexstat(a int, b char(40));
create index idx1 on bigindexstat(a);
create index idx2 on bigindexstat(b);
create index idx3 on medindexstat(a);
create index idx4 on medindexstat(b);
insert into bigindexstat select * from big;
insert into medindexstat select * from med;
update statistics on bigindexstat;
update statistics on medindexstat;
select count(*) from big;
select count(*) from bigindexstat;
commit work;
--set optimization: level 257;
select * from big where b = 'three';
select * from bigindexstat where b = 'three';
select * from big where a = 3;
select * from bigindexstat where a = 3;
select * from med where b = 'zero';
select * from medindexstat where b = 'zero';
select * from med where a = 0;
select * from medindexstat where a = 0;
drop bigindexstat, medindexstat;
commit work;
