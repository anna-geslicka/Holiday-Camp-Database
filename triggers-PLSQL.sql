--ID generating trigger
CREATE TRIGGER trig_idPerson
BEFORE INSERT ON person
FOR EACH ROW
DECLARE
v_idPerson Integer := 0;
BEGIN
   IF :new.idPerson IS NULL THEN
   SELECT MAX(idPerson)+1 INTO v_idPerson FROM person;
   :new.idPerson := v_idPerson;
    dbms_output.put_line('New person ID generated: ' || v_idPerson);
END IF;
END;

--trigger for not removing counsellors
CREATE TRIGGER trig_removingCounsellors
BEFORE Delete
ON person
FOR EACH ROW
DECLARE
v_id Integer := :old.IdPerson;
v_isCounsellor Integer;
BEGIN
SELECT COUNT(*) INTO v_isCounsellor FROM counsellor WHERE idPerson = v_id;
IF v_isCounsellor > 0 THEN
raise_application_error(-1234567, 'You cannot delete a counsellor.');
END IF;
END;