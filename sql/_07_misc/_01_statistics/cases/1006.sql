--[er]Optimizing superclass except subclass using "update statistics" with  "all" keyword

CREATE CLASS DCL1 (id INTEGER);	
CREATE CLASS DCL2 UNDER DCL1 (id2 INTEGER);	
CREATE CLASS DCL3 UNDER DCL1 (id3 INTEGER);	

UPDATE STATISTICS ON ALL DCL1 (EXCEPT DCL2);	

DROP CLASS DCL1;	
DROP CLASS DCL2;	
DROP CLASS DCL3;
