create table foo(id int) reuse_oid;

commit;

insert into foo values(1);
insert into foo values(2);
insert into foo values(3);
insert into foo values(4);
insert into foo values(5);
insert into foo values(6);

select *
	from foo order by 1;
	
insert into foo values(7);
delete from foo where id=2;
delete from foo where id=3;
commit;

insert into foo values(8);

select *
	from foo order by 1;
	
insert into foo values(9);

select *
	from foo order by 1;

drop table foo;
