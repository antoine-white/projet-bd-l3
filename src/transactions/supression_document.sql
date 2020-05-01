DECLARE
  id_doc number := 1;
  nb number;
BEGIN
    SELECT COUNT(*)  into nb from EMPRUNTS where document_media_id = id_doc;
    IF nb < 1 THEN
        DELETE FROM DOCUMENTS_MEDIATHEQUE where id = id_doc;
    end if;
    commit;
END;