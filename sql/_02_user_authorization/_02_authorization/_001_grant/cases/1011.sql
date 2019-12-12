--+ holdcas on;
--Grant two user privilege of select and delete on two specifically class


CALL login('dba','') ON CLASS db_user;
CREATE CLASS DCL1 (id INTEGER);
INSERT INTO DCL1(id) VALUES(1);
CREATE CLASS DCL2 (id INTEGER);
INSERT INTO DCL2(id) VALUES(1);




CALL add_user('DCL_USER1','DCL1') ON CLASS db_user;
CALL add_user('DCL_USER2','DCL2') ON CLASS db_user;
GRANT DELETE, SELECT ON DCL1, DCL2 TO DCL_USER1, DCL_USER2;
CALL login('DCL_USER1','DCL1') ON CLASS db_user;
DELETE FROM DCL1 WHERE id=1;
DELETE FROM DCL2 WHERE id=1;
CALL login('DCL_USER2','DCL2') ON CLASS db_user;
DELETE FROM DCL1 WHERE id=1;
DELETE FROM DCL2 WHERE id=1;
CALL login('dba','') ON CLASS db_user;
CALL drop_user('DCL_USER1') ON CLASS db_user;
CALL drop_user('DCL_USER2') ON CLASS db_user;

DROP CLASS DCL1, DCL2;

--+ holdcas off;
