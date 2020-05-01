DECLARE 
    nb_total number := 2;
    rayon varchar2(40) := 'scientifique';
    document_id number := 1;
BEGIN 
    INSERT INTO DOCUMENTS_MEDIATHEQUE VALUES((SELECT COUNT(*) FROM DOCUMENTS_MEDIATHEQUE),nb_total,0,rayon,document_id); 
END;