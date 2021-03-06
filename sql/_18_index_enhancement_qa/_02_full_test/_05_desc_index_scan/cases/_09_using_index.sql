--+ holdcas on;
set system parameters 'dont_reuse_heap_file=yes';
create table tb (id int primary key, a int, b varchar(10));
insert into tb values (4,4, '4');
insert into tb values (1,1,'1');
create index i_tb_a on tb(a);
create index i_tb_ab on tb(a,b);
insert into tb values (2,2,'2');
insert into tb values (3,3,'3');

--TEST
select /*+ recompile */ a from tb where a > 0 using index i_tb_a keylimit 2,3;
--TEST
select /*+ recompile use_desc_idx */ a from tb where a >0 using index i_tb_a keylimit 2,3;
--TEST
select /*+ recompile */ a from tb where a between 2 and 4 using index i_tb_a keylimit 2,3;
--TEST
select /*+ recompile use_desc_idx */ a from tb where a between 2 and 4 using index i_tb_a keylimit 2,3;
select /*+ recompile use_desc_idx */ a from tb where a between 4 and 2 using index i_tb_a keylimit 2,3;

--TEST
select /*+ recompile */ a,b from tb where a between 1 and 3 and b > '1' using index i_tb_ab keylimit 2,3;

--TEST
select /*+ recompile use_desc_idx */ a,b from tb where a between 1 and 3 and b > '1' using index i_tb_ab keylimit 2,3;
select /*+ recompile use_desc_idx */ a,b from tb where a between 3 and 1 and b > '1' using index i_tb_ab keylimit 2,3;

drop table tb;


set system parameters 'dont_reuse_heap_file=no';
commit;
--+ holdcas off;
