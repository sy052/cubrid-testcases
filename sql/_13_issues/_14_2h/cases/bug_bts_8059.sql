drop table if exists t21,t22;
drop view if exists v21,v22,v23,v24,v25,v26,v27;
CREATE TABLE t21 (c1 INT, c2 INT);
CREATE TABLE t22 (d1 INT, d2 INT);

INSERT INTO t21 VALUES (1,1);
INSERT INTO t21 VALUES (1,2);
INSERT INTO t21 VALUES (1,3);
INSERT INTO t21 VALUES (1,4);
INSERT INTO t21 VALUES (5,8);
INSERT INTO t21 VALUES (5,9);

INSERT INTO t22 VALUES (2,1);
INSERT INTO t22 VALUES (2,2);
INSERT INTO t22 VALUES (2,3);
INSERT INTO t22 VALUES (2,4);
INSERT INTO t22 VALUES (5,8);
INSERT INTO t22 VALUES (5,9);

--Case 1: UNION ALL + LIMIT
CREATE VIEW v21 as SELECT * FROM t21 UNION ALL SELECT * FROM t22 LIMIT 3;
select * from v21;

--Case 2: UNION ALL + LIMIT, offset
CREATE VIEW v22 as SELECT * FROM t21 UNION ALL SELECT * FROM t22 LIMIT 3 offset 1;
select * from v22;

--Case 3: UNION ALL + ORDER BY
CREATE VIEW v23 as SELECT * FROM t21 UNION ALL SELECT * FROM t22 ORDER BY c2,c1 ASC;
select * from v23;

--Case 4: UNION ALL + ORDER BY + LIMIT
CREATE VIEW v24 as SELECT * FROM t21 UNION ALL SELECT * FROM t22 ORDER BY c2,c1 ASC limit 1, 3;
select * from v24;

--Case 5: UNION ALL + ORDER BY + ORDERBY_NUM()
CREATE VIEW v25 as SELECT * FROM t21 UNION ALL SELECT * FROM t22 ORDER BY c2,c1 ASC FOR ORDERBY_NUM() IN (2, 4, 6);
select * from v25;

--Case 6: UNION DISTINCT + ORDER BY + ORDERBY_NUM()
CREATE VIEW v26 as SELECT * FROM t21 UNION SELECT * FROM t22 ORDER BY c2,c1 DESC FOR ORDERBY_NUM() IN (2,4, 6) ;
select * from v26;

--Case 7: 3 UNION ALL

CREATE VIEW v27 as SELECT * FROM t21 UNION ALL SELECT * FROM t22 UNION ALL SELECT * FROM t22;
SELECT * FROM v27;

drop table if exists t21,t22;
drop view if exists v21,v22,v23,v24,v25,v26,v27;
