---------------
--TYPE PARENT--
---------------

CREATE OR REPLACE TYPE multimedia AS OBJECT (
 id           NUMBER,
 title           VARCHAR2(30),
 theme          VARCHAR2(20),
 editor          NUMBER, -- reference editor TABLE2
 MEMBER FUNCTION show RETURN VARCHAR2,
 MEMBER FUNCTION typeDoc RETURN VARCHAR2
)
 NOT FINAL;

-----------------------------
-----------------------------

 CREATE OR REPLACE TYPE BODY multimedia AS
 MEMBER FUNCTION typeDoc RETURN VARCHAR2 IS
 BEGIN
   RETURN '';
 END;
-- function that can be overriden by subtypes
 MEMBER FUNCTION show RETURN VARCHAR2 IS
 BEGIN
   RETURN 'Id: ' || TO_CHAR(id) || ', title: ' || title || ', theme : ' || theme || ', editor : ' || editor;
 END;
 
END;


-----------------------------
-----------------------------

CREATE OR REPLACE TYPE LIVRE UNDER multimedia (
    nb_page NUMBER, 
    OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2,
    OVERRIDING MEMBER FUNCTION typeDoc RETURN VARCHAR2
    );

-----------------------------
-----------------------------
CREATE OR REPLACE TYPE BODY LIVRE AS  
 OVERRIDING  MEMBER FUNCTION typeDoc RETURN VARCHAR2 IS  
 BEGIN  
   RETURN 'Livre';  
 END;  
 OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2 IS  
 BEGIN  
   RETURN (SELF AS multimedia).show || ', nombre de page : ' || TO_CHAR(nb_page);  
 END;  
   
END;

-----------------------------
-----------------------------

CREATE OR REPLACE TYPE CD UNDER multimedia ( 
    duree NUMBER,  
    nb_sous_titre NUMBER,
    OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2, 
    OVERRIDING MEMBER FUNCTION typeDoc RETURN VARCHAR2 
    ); 

-----------------------------
-----------------------------

CREATE OR REPLACE TYPE BODY CD AS  
 OVERRIDING  MEMBER FUNCTION typeDoc RETURN VARCHAR2 IS  
 BEGIN  
   RETURN 'CD';  
 END;  
 OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2 IS  
 BEGIN  
   RETURN (SELF AS multimedia).show || ', duree : ' || TO_CHAR(duree) || ', nombre de sous titres : ' || TO_CHAR(nb_sous_titre) ;
 END;  
   
END;

-----------------------------
-----------------------------

CREATE OR REPLACE TYPE DVD UNDER multimedia ( 
    duree NUMBER,  
    OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2, 
    OVERRIDING MEMBER FUNCTION typeDoc RETURN VARCHAR2 
    ); 
-----------------------------
-----------------------------

CREATE OR REPLACE TYPE BODY DVD AS  
 OVERRIDING  MEMBER FUNCTION typeDoc RETURN VARCHAR2 IS  
 BEGIN  
   RETURN 'DVD';  
 END;  
 OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2 IS  
 BEGIN  
   RETURN (SELF AS multimedia).show || ', duree : ' || TO_CHAR(duree) ;
 END;  
   
END;

-----------------------------
-----------------------------

CREATE OR REPLACE TYPE VIDEO UNDER multimedia ( 
    duree NUMBER, 
    format_enreg VARCHAR2(6),
    OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2, 
    OVERRIDING MEMBER FUNCTION typeDoc RETURN VARCHAR2 
    ); 

-----------------------------
-----------------------------
CREATE OR REPLACE TYPE BODY VIDEO AS  
 OVERRIDING  MEMBER FUNCTION typeDoc RETURN VARCHAR2 IS  
 BEGIN  
   RETURN 'VIDEO';  
 END;  
 OVERRIDING MEMBER FUNCTION show RETURN VARCHAR2 IS  
 BEGIN  
   RETURN (SELF AS multimedia).show || ', duree : ' || TO_CHAR(duree) || ', format d enregistrement : ' || format_enreg  ;
 END;  
   
END;
