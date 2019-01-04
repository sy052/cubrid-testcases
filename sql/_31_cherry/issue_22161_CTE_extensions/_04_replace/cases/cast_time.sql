drop table if exists t,foo;
create table t(i bigint unique,j int);
insert into t values(110420091035.359,1),(050420,2),(91015,3);

create table foo as
with to_date as
(
 select cast(to_char(i) as date) as i from t where j>1
),
to_time as
(
 select cast(to_char(i) as time) as i from t where j>1
),
to_datetime as
(
select cast(to_char(i) as datetime) as i from t where j<=1
),
to_timestamp as
(
 select cast(to_char(i) as timestamp) as i from t where j<=1
)
 select cast(i as varchar) as var_i from to_date
union all
select cast(i as varchar) as var_i from to_time
union all
select cast(i as varchar) as var_i from to_datetime
union all
select cast(i as varchar) as var_i from to_timestamp;
select * from foo  order by 1;


insert into foo
with to_date as
(
 select cast(to_char(i) as date) as i from t where j>1
),
to_time as
(
 select cast(to_char(i) as time) as i from t where j>1
),
to_datetime as
(
select cast(to_char(i) as datetime) as i from t where j<=1
),
to_timestamp as
(
 select cast(to_char(i) as timestamp) as i from t where j<=1
)
 select cast(i as varchar) from to_date
union all
select cast(i as varchar) from to_time
union all
select cast(i as varchar) from to_datetime
union all
select cast(i as varchar) from to_timestamp;
select * from foo  order by 1;

with to_date as
(
 select cast(to_char(i) as date) as i from t where j>1
),
to_time as
(
 select cast(to_char(i) as time) as i from t where j>1
),
to_datetime as
(
select cast(to_char(i) as datetime) as i from t where j<=1
),
to_timestamp as
(
 select cast(to_char(i) as timestamp) as i from t where j<=1
) delete from foo where var_i in 
(
select cast(i as varchar) from to_date
union all
select cast(i as varchar) from to_time
union all
select cast(i as varchar) from to_datetime
union all
select cast(i as varchar) from to_timestamp
);

select * from foo  order by 1;



replace into foo
with to_date as
(
 select cast(to_char(i) as date) as i from t where j>1
),
to_time as
(
 select cast(to_char(i) as time) as i from t where j>1
),
to_datetime as
(
select cast(to_char(i) as datetime) as i from t where j<=1
),
to_timestamp as
(
 select cast(to_char(i) as timestamp) as i from t where j<=1
)
 select cast(i as varchar) from to_date
union all
select cast(i as varchar) from to_time
union all
select cast(i as varchar) from to_datetime
union all
select cast(i as varchar) from to_timestamp;
select * from foo  order by 1;

alter table foo add column j int;
with to_date as
(
 select cast(to_char(i) as date) as i from t where j>1
),
to_time as
(
 select cast(to_char(i) as time) as i from t where j>1
),
to_datetime as
(
select cast(to_char(i) as datetime) as i from t where j<=1
),
to_timestamp as
(
 select cast(to_char(i) as timestamp) as i from t where j<=1
) update foo set j=-1 where var_i in
(
select cast(i as varchar) from to_date
union all
select cast(i as varchar) from to_time
union all
select cast(i as varchar) from to_datetime
union all
select cast(i as varchar) from to_timestamp
);

select * from foo  order by 1;


with to_date as
(
 select cast(to_char(i) as date) as i from t where j>1
),
to_time as
(
 select cast(to_char(i) as time) as i from t where j>1
),
to_datetime as
(
select cast(to_char(i) as datetime) as i from t where j<=1
),
to_timestamp as
(
 select cast(to_char(i) as timestamp) as i from t where j<=1
) update foo set var_i=-1 where var_i in
(
select cast(i as varchar) from to_date
union all
select cast(i as varchar) from to_time
union all
select cast(i as varchar) from to_datetime
union all
select cast(i as varchar) from to_timestamp
);

select * from foo  order by 1;


drop table if exists t,foo;
create table t(i varchar(100) unique,j int);
insert into t values(110420091035.359,1),(050420,2),(91015,3);

create table foo as select * from t;
insert into foo(i)
with to_date as
(
 select cast(i as date) from t where j>1
),
to_time as
(
 select cast(i as time) from t where j>1
),
to_datetime as
(
select cast(i as datetime) from t where j<=1
),
to_timestamp as
(
 select cast(i as timestamp) from t where j<=1
)
 select * from to_date;

replace into foo(i)
with to_date as
(
 select cast(i as date) from t where j>1
),
to_time as
(
 select cast(i as time) from t where j>1
),
to_datetime as
(
select cast(i as datetime) from t where j<=1
),
to_timestamp as
(
 select cast(i as timestamp) from t where j<=1
)
 select * from to_time;



replace into foo(i)
with to_date as
(
 select cast(i as date) from t where j>1
),
to_time as
(
 select cast(i as time) from t where j>1
),
to_datetime as
(
select cast(i as datetime) from t where j<=1
),
to_timestamp as
(
 select cast(i as timestamp) from t where j<=1
)
 select * from to_datetime;


replace into foo(i)
with to_date as
(
 select cast(i as date) from t where j>1
),
to_time as
(
 select cast(i as time) from t where j>1
),
to_datetime as
(
select cast(i as datetime) from t where j<=1
),
to_timestamp as
(
 select cast(i as timestamp) from t where j<=1
)
 select * from to_timestamp;

select * from foo  order by 1;


drop table if exists foo,t;
