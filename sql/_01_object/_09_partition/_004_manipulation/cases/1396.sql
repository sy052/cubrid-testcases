--[er]test insert(varchar) for many list partition(have NULL value) with incorrect values out of range
create table list_test(id int ,        
			test_char char(50),                 
			test_varchar varchar(2000),         
			test_bit bit(16),                   
			test_varbit bit varying(20),        
			test_nchar nchar(50),               
			test_nvarchar nchar varying(2000),  
			test_string string,                 
			test_datetime timestamp, primary key(id,test_varchar))            
PARTITION BY LIST (test_varchar) (                          
    PARTITION p0 VALUES IN ('aaa','bbb','ddd'),             
    PARTITION p1 VALUES IN ('fff','ggg','hhh',NULL),        
    PARTITION p2 VALUES IN ('kkk','lll','mmm')              
);                                                          

insert into list_test values(10,'www','www',B'101',B'1111',N'www',N'www','wwwwwwwwwww','2006-03-01 09:00:00');
select * from list_test  order by 1;


drop table list_test;
