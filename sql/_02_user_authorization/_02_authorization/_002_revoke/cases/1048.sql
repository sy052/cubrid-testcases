--+ holdcas on;
--Grant privileges of update,select,insert,delete on class and revoke privileges of select,insert,delete,update on class by dba 

call login('dba','') on class db_user;
create class ooo ( x int, y int);
create user user1;

grant update , select , insert, delete on ooo to user1;
revoke  select , insert, delete on ooo from user1;
revoke update on ooo from user1;

drop user user1;
drop ooo;

--+ holdcas off;
