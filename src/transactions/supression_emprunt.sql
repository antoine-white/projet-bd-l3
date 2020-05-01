DECLARE
  id_doc number := 8;
  id_emprunteur number := 8;
  nb number;
BEGIN
    SELECT nb_emprunte  into nb from DOCUMENTS_MEDIATHEQUE where ID = id_doc;
    IF nb > 0 THEN
        
        update DOCUMENTS_MEDIATHEQUE
        set    nb_total = nb_total + 1
        where  ID = id_doc;
        
        
        update DOCUMENTS_MEDIATHEQUE
        set    nb_emprunte = nb_emprunte - 1
        where  ID = id_doc;
    end if;
    commit;
END;