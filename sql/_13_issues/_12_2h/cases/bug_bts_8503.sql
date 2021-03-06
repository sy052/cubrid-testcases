--TEST: [ENUM TYPE] index is used inappropriately on ENUM type.   BY DESIGN


set system parameters 'dont_reuse_heap_file=yes';

drop table if exists foo;


create table foo(a enum('a', 'b', 'c'));
create index i on foo(a);
insert into foo values(3), (2), (1);

select /*+ recompile */ * from foo where a < 'c';

select /*+ recompile */ * from foo where a < 'c' order by a;


drop table foo;

set system parameters 'dont_reuse_heap_file=no';
