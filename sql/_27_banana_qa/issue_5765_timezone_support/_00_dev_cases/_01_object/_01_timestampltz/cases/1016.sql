-- create table with timestampltz data type and insert numberic data


CREATE CLASS t1(
   col1       timestampltz
);

INSERT INTO t1 VALUES (1111111111);

drop t1;