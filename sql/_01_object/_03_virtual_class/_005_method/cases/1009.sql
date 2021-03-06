--create vclass with methods get_2000(),get_success(),get_null(),get_int(int)

CREATE vclass ddl_0001(
    dummy_column set( int ),
    num                 int,
    name               string
)
METHOD CLASS get_2000() int FUNCTION TEST_getInt,
       CLASS get_success() string FUNCTION TEST_getString,
       CLASS get_null() string FUNCTION TEST_getNull,
       CLASS get_int(int) int FUNCTION TEST_int_input
FILE '$HOME/method_test/myyang';

drop vclass ddl_0001;