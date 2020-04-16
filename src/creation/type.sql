---------------
--TYPE PARENT--
---------------
DROP TYPE multimedia FORCE;
-- if created
CREATE OR REPLACE TYPE multimedia AS OBJECT (
 id           NUMBER,
 title           VARCHAR2(30),
 theme          VARCHAR2(20),
 editor          NUMBER, -- reference editor TABLE
 MAP MEMBER FUNCTION get_idno RETURN NUMBER,
 MEMBER FUNCTION show RETURN VARCHAR2)
 NOT FINAL;
 
CREATE OR REPLACE TYPE BODY multimedia AS
 MAP MEMBER FUNCTION get_id RETURN NUMBER IS
 BEGIN
   RETURN id;
 END;
-- function that can be overriden by subtypes
 MEMBER FUNCTION show RETURN VARCHAR2 IS
 BEGIN
   RETURN 'Id: ' || TO_CHAR(id) || ', title: ' || title || ', theme : ' || theme || ', editor : ' || editor;
 END;
 
END;