
--+ holdcas on;
set names utf8;
set system parameters 'intl_number_lang = ko_KR';
set system parameters 'intl_date_lang = ko_KR';create table t( a datetime);
insert into t value('2008-10-31');
select * from t order by 1;
drop table t;
set system parameters 'intl_date_lang = en_US';
set system parameters 'intl_number_lang = en_US';
set names iso88591;
commit;
--+ holdcas off;