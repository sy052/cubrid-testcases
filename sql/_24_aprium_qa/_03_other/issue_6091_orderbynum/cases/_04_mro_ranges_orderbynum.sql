-- check the index and plan compare when multi range optimization is eligible
--+ holdcas on;

set system parameters 'dont_reuse_heap_file=yes';

drop table if exists t;
create table t (a int, b int, c int, d int, e int);

insert into t select * from
	(select 1 union select 2 union select 3) as t1,
	(select 1 union select 2) as t2,
	(select 1 union select 2) as t3,
	(select 1 union select 2) as t4,
	(select 1 union select 2 union select 3) as t5;
	
-- compare multi range optimization with skip order by
create index idx_a_b_cd_d_ed on t (a, b, c desc, d, e desc);
create index idx_cd_d_ed on t (c desc, d, e desc);
select /*+ recompile */ * from t
	where a in (1,3) and b = 1
	order by c desc, d, e desc limit 5;
drop index idx_cd_d_ed on t;
drop index idx_a_b_cd_d_ed on t;

-- compare two multi range optimization (choose the shortest index)
create index idx_a_b_cd_d_ed on t (a, b, c desc, d, e desc);
create index idx_a_b_cd_d on t (a, b, c desc, d);
select /*+ recompile */ * from t
	where a in (1,3) and b = 1
	order by a desc, e for orderby_num() >= 2 and orderby_num() <= 5;
select /*+ recompile */ * from t
	where a in (1,3) and b = 1
	order by a desc, e for orderby_num() between 2 and 5;

drop index idx_a_b_cd_d on t;
drop index idx_a_b_cd_d_ed on t;

-- compare multi range optimization with covering
create index idx_a_b_cd_d on t (a, b, c desc, d);
create index idx_a_b_c_d_e on t (a, b, c, d, e);
select /*+ recompile */ * from t
	where a in (1,3) and b = 1
	order by c desc, d limit 5;
drop index idx_a_b_cd_d on t;
drop index idx_a_b_c_d_e on t;

drop t;

set  system parameters 'dont_reuse_heap_file=no';
commit;
--+ holdcas off;
