-- [er]create a table with a primary key ,create a table with a foreign key references the primary key,drop the foreign key

CREATE TABLE album(
  id CHAR(10) PRIMARY KEY,
  title VARCHAR(100),
  artist VARCHAR(100)
);

CREATE TABLE track(
  album CHAR(10),
  dsk INTEGER,
  posn INTEGER,
  song VARCHAR(255),
  FOREIGN KEY (album) REFERENCES album(id)
);

ALTER TABLE track DROP ATTRIBUTE album;
select * from db_index_key 
where class_name in ('album','track') order by 2,1;

select * from db_index where class_name in ('album', 'track') order by 1,2;

select * from db_attribute
where class_name in ('album','track') order by 2,1;
drop class track;
drop class album;