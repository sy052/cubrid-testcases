-- This testcase use modified Oracle samples. See below for the license:
-- Copyright (c) 2015 Oracle
-- Permission is hereby granted, free of charge, to any person obtaining a copy
--  of this software and associated documentation files (the "Software"), to deal
--  in the Software without restriction, including without limitation the rights
--  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
--  copies of the Software, and to permit persons to whom the Software is
--  furnished to do so, subject to the following conditions:
-- The above copyright notice and this permission notice shall be included in all
--  copies or substantial portions of the Software.
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
--  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
--  SOFTWARE.
--+ holdcas on;
--Test subquery with aggregate function avg()


CREATE TABLE T1 ( 
  EMPLOYEE_ID     int    NOT NULL, 
  FIRST_NAME      VARCHAR(20), 
  LAST_NAME       VARCHAR(25),
  EMAIL           VARCHAR(25),
  TEST_NUMBER    VARCHAR(20), 
  TEST_DATE       DATE,
  JOB_ID          VARCHAR(10),
  S1          numeric(8,2), 
  COMMISSION_PCT  numeric(2,2), 
  MANAGER_ID      int, 
  DEPARTMENT_ID   int  );


insert into T1 values (100,'Steven','King','SKING','515.123.4567','06/17/1987','AD_PRES',24000,null,null,90);
insert into T1 values (101,'Neena','Kochhar','NKOCHHAR','515.123.4568','09/21/1989','AD_VP',17000,null,100,90);
insert into T1 values (102,'Lex','De Haan','LDEHAAN','515.123.4569','01/13/1993','AD_VP',17000,null,100,90);
insert into T1 values (103,'Alexander','Hunold','AHUNOLD','590.423.4567','01/03/1990','IT_PROG',9000,null,102,60);
insert into T1 values (104,'Bruce','Ernst','BERNST','590.423.4568','05/21/1991','IT_PROG',6000,null,103,60);
insert into T1 values (105,'David','Austin','DAUSTIN','590.423.4569','06/25/1997','IT_PROG',4800,null,103,60);
insert into T1 values (106,'Valli','Pataballa','VPATABAL','590.423.4560','02/05/1998','IT_PROG',4800,null,103,60);
insert into T1 values (107,'Diana','Lorentz','DLORENTZ','590.423.5567','02/07/1999','IT_PROG',4200,null,103,60);
insert into T1 values (108,'Nancy','Greenberg','NGREENBE','515.124.4569','08/17/1994','FI_MGR',12000,null,101,100);
insert into T1 values (109,'Daniel','Faviet','DFAVIET','515.124.4169','08/16/1994','FI_ACCOUNT',9000,null,108,100);
insert into T1 values (110,'John','Chen','JCHEN','515.124.4269','09/28/1997','FI_ACCOUNT',8200,null,108,100);
insert into T1 values (111,'Ismael','Sciarra','ISCIARRA','515.124.4369','09/30/1997','FI_ACCOUNT',7700,null,108,100);
insert into T1 values (112,'Jose Manuel','Urman','JMURMAN','515.124.4469','03/07/1998','FI_ACCOUNT',7800,null,108,100);
insert into T1 values (113,'Luis','Popp','LPOPP','515.124.4567','12/07/1999','FI_ACCOUNT',6900,null,108,100);
insert into T1 values (114,'Den','Raphaely','DRAPHEAL','515.127.4561','12/07/1994','PU_MAN',11000,null,100,30);
insert into T1 values (115,'Alexander','Khoo','AKHOO','515.127.4562','05/18/1995','PU_CLERK',3100,null,114,30);
insert into T1 values (116,'Shelli','Baida','SBAIDA','515.127.4563','12/24/1997','PU_CLERK',2900,null,114,30);
insert into T1 values (117,'Sigal','Tobias','STOBIAS','515.127.4564','07/24/1997','PU_CLERK',2800,null,114,30);
insert into T1 values (118,'Guy','Himuro','GHIMURO','515.127.4565','11/15/1998','PU_CLERK',2600,null,114,30);
insert into T1 values (119,'Karen','Colmenares','KCOLMENA','515.127.4566','08/10/1999','PU_CLERK',2500,null,114,30);
insert into T1 values (120,'Matthew','Weiss','MWEISS','650.123.1234','07/18/1996','ST_MAN',8000,null,100,50);


select first_name||'.'||last_name as employee_name from T1 
where (S1) > (select avg(S1) from T1) order by 1;
select first_name||'.'||last_name as employee_name from T1 
where (S1) < (select avg(S1) from T1) order by 1;

set system parameters 'compat_mode=mysql';
set system parameters 'pipes_as_concat=yes';

select first_name||'.'||last_name as employee_name from T1 
where (S1) > (select avg(S1) from T1) order by 1;
select first_name||'.'||last_name as employee_name from T1 
where (S1) < (select avg(S1) from T1) order by 1;

set system parameters 'pipes_as_concat=no';
set system parameters 'compat_mode=cubrid';

drop class T1;

commit;
--+ holdcas off;
