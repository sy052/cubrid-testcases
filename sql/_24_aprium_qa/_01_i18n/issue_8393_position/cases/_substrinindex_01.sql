--+ holdcas on;
set names utf8;
drop table if exists t;
create table t (i int, s string collate utf8_de_exp_ai_ci);

insert into t values (1,'Ae_oE_Ue _ß_Ae_oE_Ue _ß');
insert into t values (2,'AE_OE_UE_SS_AE_OE_UE_SS');
insert into t values (3,'Äx_ö_ü_ss_Äx_ö_ü_ss');
insert into t values (4,'ä_Ö_Ü_ß ä_Ö_Ü_ß ');

select i,s,substring_index (s, 'ae', 1) from t order by 1;
select i,s,substring_index (s, 'AE',2) from t order by 1;
select i,s,substring_index (s, 'ä',-1) from t order by 1;
       
select i,s,substring_index (s,'Oe',1) from t order by 1;
select i,s,substring_index (s,'Ö',2) from t order by 1;
       
select i,s,substring_index (s,'ue',1) from t order by 1;
select i,s,substring_index (s,'ü ',2) from t order by 1;
       
select i,s,substring_index (s,'ß',1) from t order by 1;
select i,s,substring_index (s,'ß',2) from t order by 1;
       
select i,s,substring_index (s,'SS ',1) from t order by 1;
select i,s,substring_index (s,'Ss',-1) from t order by 1;

drop table t;
set names iso88591;
commit;
--+ holdcas off;
