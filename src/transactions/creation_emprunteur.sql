DECLARE 
    nom varchar2(20) := 'exemple de nom'; 
    prenom varchar2(20) := 'exemple de prenom'; 
    adress varchar2(100) := 'exepmle d adresse'; 
    numero_tel varchar2(20) := 'exemple de tel'; 
    type_emp varchar2(20) := 'public';
BEGIN 
    INSERT INTO EMPRUNTEURS VALUES((SELECT COUNT(*) FROM EMPRUNTEURS),nom ,prenom , adress,numero_tel,type_emp); 
END;