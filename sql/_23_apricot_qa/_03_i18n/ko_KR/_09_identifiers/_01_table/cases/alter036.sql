set system parameters 'alter_table_change_type_strict=yes';
CREATE TABLE 테이블(칼럼1 date);
INSERT INTO 테이블 VALUES ('2010-01-31'),('2010-01-02'),('2010-02-28'); 
ALTER TABLE 테이블 CHANGE 칼럼1 칼럼2  nchar(10);
drop class  테이블;
set system parameters 'alter_table_change_type_strict=no';
CREATE TABLE 테이블(칼럼1 date);
INSERT INTO 테이블 VALUES ('2010-01-31'),('2010-01-02'),('2010-02-28'); 
ALTER TABLE 테이블 CHANGE 칼럼1 칼럼2  nchar(10); 
SELECT * FROM 테이블  order by 1;
drop class  테이블;