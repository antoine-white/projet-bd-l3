DECLARE
  id_emprunteur number := 1;
  nb number;
BEGIN
    SELECT COUNT(*)  into nb from EMPRUNTS where emprunteur_id = id_emprunteur;
    IF nb < 1 THEN
        DELETE FROM EMPRUNTEURS where id = id_emprunteur;
    end if;
    commit;
END;