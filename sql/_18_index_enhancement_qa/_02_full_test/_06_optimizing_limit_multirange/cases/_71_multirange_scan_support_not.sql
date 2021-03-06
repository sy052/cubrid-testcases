--+ holdcas on;
create table t (i1 int, i2 int, i3 int);
create index i_t_123 on t(i1, i2, i3);
insert into t values (0, 0, 00), (0, 1, 01), (0, 2, 02), (0, 3, 03), (0, 4, 04);
insert into t values (1, 0, 10), (1, 1, 11), (1, 2, 12), (1, 3, 13), (1, 4, 14);
insert into t values (2, 0, 20), (2, 1, 21), (2, 2, 22), (2, 3, 23), (2, 4, 24);
insert into t values (3, 0, 30), (3, 1, 31), (3, 2, 32), (3, 3, 33), (3, 4, 34);
insert into t values (4, 0, 40), (4, 1, 41), (4, 2, 42), (4, 3, 43), (4, 4, 44);
insert into t values (null, 0, null);


set system parameters 'xasl_debug_dump=yes';
set system parameters 'use_orderby_sort_limit=y';

select /*+ recompile */ * from t where i1=4 and i2=3 AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()< 5;

select /*+ recompile */ * from t where i1=4 and i2 in (0,1,2) AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()< 5;

select /*+ recompile */ * from t where i1=4 and i2 in (1+1,2+3) AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()>5;

select /*+ recompile */ * from t where i1 in (3,4) and i2 in (1+1,2+3) AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()< 5;

select /*+ recompile */ * from t where i1 is null and i2 in (0) AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()< 5;

select /*+ recompile */ * from t where i1 is not null and i2 in (0) AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()< 5;

select /*+ recompile */ * from t where i1 between 1 and 3 and i2 in (0) AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()< 5;

select /*+ recompile */ * from t where i1=0 and i3 in (0,1,2,3,4,5) AND i2 BETWEEN 0 AND 23 order by i2 for orderby_num()<10;

select /*+ recompile */ * from t where i1 BETWEEN 0 AND 1 and i2 in (0) AND i3 BETWEEN 0 AND 23 order by i3 for orderby_num()< 5;

set system parameters 'xasl_debug_dump=no';
set system parameters 'use_orderby_sort_limit=n';

drop table t;

commit;
--+ holdcas off;
