--+ holdcas on;
--[er]Revoke two users privilege of select on two specifically class


CALL login('dba','') ON CLASS db_user;
CREATE CLASS DCL1 (id INTEGER);
CREATE CLASS DCL2 (id INTEGER);
CALL add_user('DCL_USER1','DCL1') ON CLASS db_user;
CALL add_user('DCL_USER2','DCL2') ON CLASS db_user;
GRANT SELECT ON DCL1, DCL2 TO DCL_USER1, DCL_USER2;
REVOKE SELECT ON DCL1, DCL2 FROM DCL_USER1, DCL_USER2;


CALL login('DCL_USER1','DCL1') ON CLASS db_user;
SELECT id FROM DCL1;
SELECT id FROM DCL2;
CALL login('DCL_USER2','DCL2') ON CLASS db_user;
SELECT id FROM DCL1;
SELECT id FROM DCL2;



CALL login('dba','') ON CLASS db_user;
CALL drop_user('DCL_USER1') ON CLASS db_user;
CALL drop_user('DCL_USER2') ON CLASS db_user;
DROP CLASS DCL1, DCL2;

--+ holdcas off;
