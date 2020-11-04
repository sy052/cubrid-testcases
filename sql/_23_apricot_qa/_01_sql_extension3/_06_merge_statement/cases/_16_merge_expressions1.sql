--test with expressions in on clause

autocommit off;


--create target table
create table target(
        col1 smallint primary key auto_increment,
        col2 string not null,
        col3 timestamp default SYS_TIMESTAMP,
        col4 bit(20) unique,
	col5 clob
);

insert into target values(100, 'aaa', '2011-12-12 14:20:34', B'0001', 'AAA');
insert into target values(200, 'bbb', '2011-12-12 14:20:34', B'0010', 'BBB');
insert into target values(300, 'ccc', '2011-12-12 14:20:35', B'0100', 'CCC');
insert into target values(400, 'ddd', '2011-12-12 14:20:36', B'1000', 'DDD');
insert into target values(500, 'eee', '2011-12-12 14:20:36', B'0011', 'EEE');
insert into target values(600, 'fff', '2011-12-12 14:20:37', B'0101', 'FFF');


--create source table
create table source(
        col1 double,
        col2 varchar not null,
        col3 datetime default SYS_DATETIME,
        col4 bit varying(20),
	col5 varchar(10)
);


insert into source values(100, 'ggg', '2011-11-11 14:20:38.999', B'0001', 'AAA');
insert into source values(200, 'hhh', '2011-10-10 14:20:34.999', B'1010', 'BBB');
insert into source values(300, 'iii', '2011-12-12 14:20:34', B'0100', 'CCC');
insert into source values(700, 'ddd', '2011-12-12 14:20:34', B'1000', 'DDD');
insert into source values(800, 'ddd', '2011-12-12 14:20:35', B'1011', 'EEE');
insert into source values(900, 'fff', '2011-12-12 14:20:36', B'0101', 'FFF');


--TEST: create triggers
create table trigger_actions(id smallint auto_increment, info varchar);

create trigger trigg1 before update on target execute insert into trigger_actions(info) values ('updated');
create trigger trigg2 after insert on target execute insert into trigger_actions(info) values ('inserted');


commit;


--TEST: multiple expressions in on clause, no matched rows.
merge into target t
using source s
on t.col1=s.col1 and t.col2=s.col2 and t.col3=s.col3 and t.col4=s.col4
when matched then
update  
set t.col5=default;

select if (count(*)=0, 'ok', 'nok') from target where col2='updated' and col4 is null;
select if (count(*)=0, 'ok', 'nok') from trigger_actions;

rollback;

--TEST: function expressions in on clause, no matched rows
merge into target t
using source s
on left(t.col2, 2)=left(s.col2, 2) and round(t.col1)=s.col1
when matched then
update
set t.col4=default;

select if (count(*)=0, 'ok', 'nok') from trigger_actions;

rollback;


--TEST: function expressions in on clause, 6 rows merged
merge into target t
using source s
on (floor(t.col1)=s.col1 and clob_to_char(s.col5)=clob_to_char(t.col5))
when matched then
update
set t.col2='updated'
when not matched then
insert
values(default, 'inserted', default, default, default);

select if (count(*)=3, 'ok', 'nok') from target where col2='updated';
select if (count(*)=3, 'ok', 'nok') from target where col2='inserted' and col4 is null;
select if (count(*)=6, 'ok', 'nok') from trigger_actions;

rollback;


-- ########################### CUBRID BUG: CUBRIDSUS-7579 ####################################
--TEST: [er], condition only related to the source table, Oracle: unable to get a stable set of rows in the source tables
--TEST: uneuqual condition
merge into target t
using source s
on s.col1 < 400
when matched then
update
set t.col2='updated', t.col5=char_to_clob('updated')
when not matched then
insert
values(default, 'inserted', default, default, char_to_clob('inserted'));

select if (count(*)=0, 'ok', 'nok') from target where col2='updated';
select if (count(*)=0, 'ok', 'nok') from target where col2='inserted' and col4 is null;
select if (count(*)=0, 'ok', 'nok') from trigger_actions;

rollback;

--TEST: equal condition, 11 rows merged
merge into target t
using source s
on s.col1 = 300
when matched then
update
set t.col2='updated', t.col5=char_to_clob('updated')
when not matched then
insert
values(default, 'inserted', default, default, char_to_clob('inserted'));

select if (count(*)=6, 'ok', 'nok') from target where col2='updated';
select if (count(*)=5, 'ok', 'nok') from target where col2='inserted' and col4 is null;
select if (count(*)=11, 'ok', 'nok') from trigger_actions;

rollback;


--TEST: [er] condition only related to the target table
merge into target t
using source s
on t.col1 < 400
when matched then
update
set t.col2='updated', t.col5=char_to_clob('updated')
when not matched then
insert
values(default, 'inserted', default, default, char_to_clob('inserted'));

select if (count(*)=0, 'ok', 'nok') from target where col2='updated';
select if (count(*)=0, 'ok', 'nok') from target where col2='inserted' and col4 is null;
select if (count(*)=0, 'ok', 'nok') from trigger_actions;

rollback;


--TEST: error in Oracle.
merge into target t
using source s
on t.col1 = 400
when matched then
update
set t.col2='updated', t.col5=char_to_clob('updated')
when not matched then
insert
values(default, 'inserted', default, default, char_to_clob('inserted'));

select if (count(*)=0, 'ok', 'nok') from target where col2='updated';
select if (count(*)=0, 'ok', 'nok') from target where col2='inserted' and col4 is null;
select if (count(*)=0, 'ok', 'nok') from trigger_actions;

rollback;



drop trigger trigg1, trigg2;
drop table target, source, trigger_actions;
commit;


autocommit on;




