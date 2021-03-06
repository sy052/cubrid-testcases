--+ holdcas on;

create table t_basic004(i1 integer, i2 integer, i3 integer);
create index basic004_idx_one on t_basic004(i1);
create index basic004_idx_two on t_basic004(i2);
create index basic004_idx_one_two on t_basic004(i1, i2);
create index basic004_idx_two_three on t_basic004(i2, i3);
create index basic004_idx_one_three on t_basic004(i1, i3);
create index basic004_idx_all on t_basic004(i1, i2, i3);

insert into t_basic004 values (1, 3, 2), (1, 2, 3), (1, 1, 1);
insert into t_basic004 values (2, 3, 2), (2, 2, 3), (2, 1, 1);

commit;
update statistics on t_basic004;

select i1 from t_basic004 where i1 < 4 order by 1;
select * from t_basic004 where i1 < 4 order by 1,2,3;

select i1 from t_basic004 where i1 < 4 using index basic004_idx_one order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_one_two order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_one_three order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_all order by 1;

select i1 from t_basic004 where i1 < 4 using index basic004_idx_two order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_two_three order by 1;


select i1 from t_basic004 where i1 < 4 using index basic004_idx_one, basic004_idx_two order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_one, basic004_idx_one_two order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_one, basic004_idx_one_three order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_one, basic004_idx_all order by 1;
select i1 from t_basic004 where i1 < 4 using index basic004_idx_one, basic004_idx_two_three order by 1;

select i1 from t_basic004 where i1 < 4 using index none order by 1;


drop index basic004_idx_one on t_basic004;
drop index basic004_idx_two on t_basic004;
drop index basic004_idx_one_two on t_basic004;
drop index basic004_idx_one_three on t_basic004;
drop index basic004_idx_two_three on t_basic004;
drop index basic004_idx_all on t_basic004;
drop table t_basic004;

commit;
--+ holdcas off;
