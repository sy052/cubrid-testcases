-- [er]create class with timestampltz and insert a error timestampltz


CREATE CLASS c_d (
  c1 timestampltz
);

INSERT INTO c_d VALUES (timestampltz '01/31/1994 6:61:00 pm');
DROP c_d;