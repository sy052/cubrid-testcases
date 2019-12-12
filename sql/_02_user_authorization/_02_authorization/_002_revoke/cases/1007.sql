--+ holdcas on;
--[er]Revoke user privilege of select and delete on specifically class


CALL login('dba','') ON CLASS db_user;
CREATE CLASS DCL1 (id INTEGER);
INSERT INTO DCL1(id) VALUES(1);
CALL add_user('DCL_USER1','DCL1') ON CLASS db_user;
GRANT DELETE, SELECT ON DCL1 TO DCL_USER1;
REVOKE DELETE, SELECT ON DCL1 FROM DCL_USER1;




CALL login('DCL_USER1','DCL1') ON CLASS db_user;
DELETE FROM DCL1 WHERE id=1;

CALL login('dba','') ON CLASS db_user;
CALL drop_user('DCL_USER1') ON CLASS db_user;
DROP CLASS DCL1;

--+ holdcas off;
