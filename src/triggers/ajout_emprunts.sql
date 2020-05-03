CREATE OR REPLACE TRIGGER TRG_ADD_EMPRUNT
   BEFORE INSERT 
   ON EMPRUNTS       
   FOR EACH ROW  
declare  
   total number;
   pris number;
Begin
    SELECT nb_emprunte into pris from DOCUMENTS_MEDIATHEQUE where DOCUMENTS_MEDIATHEQUE.ID = :NEW.document_media_id;
    SELECT nb_total into total from DOCUMENTS_MEDIATHEQUE where DOCUMENTS_MEDIATHEQUE.ID = :NEW.document_media_id;
    if pris = total then
        RAISE_APPLICATION_ERROR ( -1, 'document pas disponible' ) ;
    end if;
End ;