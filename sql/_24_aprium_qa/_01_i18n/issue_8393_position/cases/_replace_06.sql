--+ holdcas on;
set names utf8;
drop table if exists t;
create table t (i int, s char(20) collate utf8_en_ci);

insert into t values (1,'Áa_áa__Eá_Ea');
insert into t values (2,'__áE_Á _a_AÁ_Áx_');
insert into t values (3,'xáE_áa_A_Á_E');
insert into t values (4,'Eá_aÁ_E_Á');
insert into t values (5,'Eá_A_aÁ_E_Á');

select i,s, replace (s,'Áa','Xy') from t order by 1;
select i,s, replace (s,'áa','xy') from t order by 1;
select i,s, replace (s,'Á','X') from t order by 1;
select i,s, replace (s,'Á ','X=') from t order by 1;
select i,s, replace (s,'A','X') from t order by 1;
select i,s, replace (s,'AÁ','XY') from t order by 1;
select i,s, replace (s,'Eá','Xy') from t order by 1;
select i,s, replace (s,'áe','xy') from t order by 1;

drop table t;
set names iso88591;
commit;
--+ holdcas off;
