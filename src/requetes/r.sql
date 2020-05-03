SELECT DOC.title from DOCUMENTS DOC
WHERE DOC.theme='informatique' OR DOC.theme='mathématiques'  order by DOC.title ASC

SELECT DOC.title, DOC.theme from DOCUMENTS  DOC, EMPRUNTEURS, EMPRUNTS
WHERE EMPRUNTEURS.nom  = 'Dupont' AND (EMPRUNTS.debut > '2018-11-15' AND EMPRUNTS.fin > '2019-11-15')

SELECT DOCUMENTS.title, EMPRUNTEURS.nom as emprunteur, AUTEURS.nom as auteur FROM DOCUMENTS, EMPRUNTEURS, AUTEURS, DOCUMENTS_MEDIATHEQUE, AUTEURS_DOCUMENTS, EMPRUNTS
WHERE EMPRUNTEURS.id=EMPRUNTS.EMPRUNTEUR_ID 
    AND EMPRUNTS.DOCUMENT_MEDIA_ID=DOCUMENTS_MEDIATHEQUE.id 
    AND DOCUMENTS_MEDIATHEQUE.document_id = DOCUMENTS.id
    AND DOCUMENTS.id = AUTEURS_DOCUMENTS.document_id
    AND AUTEURS_DOCUMENTS.auteur_id=AUTEURS.id
GROUP BY (EMPRUNTEURS.nom,AUTEURS.nom,DOCUMENTS.title )

SELECT AUTEURS.nom FROM AUTEURS, DOCUMENTS, EDITEURS , AUTEURS_DOCUMENTS
WHERE EDITEURS.NOM = 'Dunod' 
    AND EDITEURS.ID=DOCUMENTS.editor
    AND AUTEURS_DOCUMENTS.document_id=DOCUMENTS.id
    and AUTEURS.id=AUTEURS_DOCUMENTS.auteur_id
group by  AUTEURS.nom 

SELECT SUM(DOCUMENTS_MEDIATHEQUE.nb_total) FROM  DOCUMENTS, EDITEURS , DOCUMENTS_MEDIATHEQUE
wHERE EDITEURS.NOM = 'Eyrolles' 
    AND EDITEURS.ID=DOCUMENTS.editor
    AND DOCUMENTS_MEDIATHEQUE.document_id=DOCUMENTS.id

SELECT EDITEURS.nom,SUM(DOCUMENTS_MEDIATHEQUE.nb_total) FROM  DOCUMENTS, EDITEURS , DOCUMENTS_MEDIATHEQUE
wHERE EDITEURS.ID=DOCUMENTS.editor
    AND DOCUMENTS_MEDIATHEQUE.document_id=DOCUMENTS.id
group by (EDITEURS.nom)

SELECT DOCUMENTS.title,COUNT(EMPRUNTS.id) FROM  DOCUMENTS , DOCUMENTS_MEDIATHEQUE, EMPRUNTS
where EMPRUNTS.document_media_id = DOCUMENTS_MEDIATHEQUE.id
    AND DOCUMENTS.id = DOCUMENTS_MEDIATHEQUE.document_id
group by (DOCUMENTS.title)

SELECT EDITEURS.nom FROM  EDITEURS 
where EDITEURS.ID IN (SELECT DOCUMENTS.editor from DOCUMENTS where DOCUMENTS.theme='informatique'or DOCUMENTS.theme='mathématiques')    

SELECT EMPRUNTEURS.nom ,EMPRUNTEURS.prenom
FROM  EMPRUNTEURS   
WHERE EMPRUNTEURS.adresse in (select EMPRUNTEURS.adresse from EMPRUNTEURS where EMPRUNTEURS.prenom='Dupond' )

SELECT EDITEURS.nom FROM  EDITEURS 
where EDITEURS.ID NOT IN (SELECT DOCUMENTS.editor from DOCUMENTS where DOCUMENTS.theme='informatique')  

SELECT nom FROM EMPRUNTEURS
WHERE EMPRUNTEURS.id not in (select emprunteur_id from EMPRUNTS)
ORDER BY nom;

SELECT title FROM DOCUMENTS, DOCUMENTS_MEDIATHEQUE
WHERE DOCUMENTS_MEDIATHEQUE.document_id  not in (select document_media_id from EMPRUNTS)
    AND DOCUMENTS_MEDIATHEQUE.document_id = DOCUMENTS.ID
ORDER BY title;

--la 13

SELECT title FROM DOCUMENTS
WHERE DOCUMENTS.ID in (select document_id from DOCUMENTS_MEDIATHEQUE where nb_total > (select avg(nb_total) from DOCUMENTS_MEDIATHEQUE))
ORDER BY title;

SELECT nom FROM AUTEURS
WHERE AUTEURS.id in (select auteur_id from AUTEURS_DOCUMENTS where document_id in (select id from documents where theme='informatique'))
    AND AUTEURS.id in (select auteur_id from AUTEURS_DOCUMENTS where document_id in (select id from documents where theme='mathématiques'))
ORDER BY nom;

select nom  
from editeurs 
where id in (select editor from documents where id in ( select document_id from DOCUMENTS_MEDIATHEQUE where nb_emprunte in ( select max(nb_emprunte) from DOCUMENTS_MEDIATHEQUE)))

select title
from documents 
where id not in(
    select document_id from MOT_CLES_DOCUMENTS where mot_cle_id in (
        select id from MOT_CLES where id in (
            select mot_cle_id from MOT_CLES_DOCUMENTS where document_id in (
                select id from documents where title='SQL pour les nuls'
            )
        )
    )
)

select title
from documents 
where id in(
    select document_id from MOT_CLES_DOCUMENTS where mot_cle_id in (
        select id from MOT_CLES where id in (
            select mot_cle_id from MOT_CLES_DOCUMENTS where document_id in (
                select id from documents where title='SQL pour les nuls'
            )
        )
    )
)
