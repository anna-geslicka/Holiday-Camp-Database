-- creating persons by sequence
CREATE SEQUENCE seq_idPerson START WITH 1 INCREMENT BY 1;

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES (seq_idPerson.nextval, 'ANNA', 'GESLICKA', 'POWAZKOWSKA 13/3 WARSZAWA', '97/07/21', 'K');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'KRZYSZTOF', 'JAKUBOWSKI', 'KRASINSKIEGO 20/170 WARSZAWA', '92/10/10', 'M');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'MAJA', 'KULCZYNSKA', 'CZERNIAKOWSKA 170A/40 WARSZAWA', '90/05/02', 'K');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'WOJCIECH', 'KUTA', 'STASZICA 6A/2 LOMIANKI', '95/12/15', 'M');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'KAMIL', 'MICHALSKI', 'CHMIELNA 14/83 LUBLIN', '98/03/18', 'M');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'ANGELIKA', 'STRYJEWSKA', 'ATUTOWA 7/2 WROCLAW', '11/04/30', 'K');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'RAFAL', 'DMOCHOWSKI', 'PARKOWA 17 GDANSK', '10/07/11', 'M');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'KATARZYNA', 'DMOCHOWSKA', 'PARKOWA 17 GDANSK', '14/11/21', 'K');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'BARBARA', 'SLOWIK', 'GLEBOCKA 20/3 KRAKOW', '15/05/10', 'K');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'MICHAL', 'SLOWIK', 'GLEBOCKA 20/3 KRAKOW', '15/05/10', 'M');

INSERT INTO person (idperson, name, surname, adress, birthdate, sex)
VALUES(seq_idPerson.nextval, 'JOANNA', 'MAKOWSKA', 'NOWY SWIAT 6/12 WARSZAWA', '10/06/17', 'K');

DROP SEQUENCE seq_idPerson;

--counsellors setting
INSERT INTO counsellor (idperson, counsellorpermit)
SELECT idperson, 1 
FROM person
WHERE surname = 'GESLICKA';

INSERT INTO counsellor (idperson, counsellorpermit)
SELECT idperson, 0
FROM person
WHERE surname = 'JAKUBOWSKI';

INSERT INTO counsellor (idperson, counsellorpermit)
SELECT idperson, 1 
FROM person
WHERE surname = 'KUTA';

INSERT INTO counsellor (idperson, counsellorpermit)
SELECT idperson, 1 
FROM person
WHERE surname = 'KULCZYNSKA';

INSERT INTO counsellor (idperson, counsellorpermit)
SELECT idperson, 0
FROM person
WHERE surname = 'MICHALSKI';

--participants setting
INSERT INTO participant (idperson)
SELECT idperson
FROM person
WHERE surname = 'KARAS';

INSERT INTO participant (idperson)
SELECT idperson
FROM person
WHERE surname =  'STRYJEWSKA';

INSERT INTO participant (idperson)
SELECT idperson
FROM person
WHERE surname =  'DMOCHOWSKI';

INSERT INTO participant (idperson)
SELECT idperson
FROM person
WHERE surname =  'DMOCHOWSKA';

INSERT INTO participant (idperson)
SELECT idperson
FROM person
WHERE surname =  'SLOWIK';

INSERT INTO participant (idperson)
SELECT idperson
FROM person
WHERE surname =  'MAKOWSKA';

--adding allergies and illnessess
INSERT INTO allergy (allergyname)
VALUES ('pollen');

INSERT INTO allergy (allergyname)
VALUES ('milk');

INSERT INTO allergy (allergyname)
VALUES ('peanuts');


INSERT INTO illness (illnessname)
VALUES ('asthma');

INSERT INTO illness (illnessname)
VALUES ('epilepsy');

--adding activities
INSERT INTO activity(activityname)
VALUES ('bike');

INSERT INTO activity(activityname)
VALUES ('sailing');

INSERT INTO activity(activityname)
VALUES ('tenis');

--adding holiday resorts
INSERT INTO holidayresort (name, adress)
VALUES ('ZIELONA WYSPA', 'ZLOTA 5, GIZYCKO');

INSERT INTO holidayresort (name, adress)
VALUES ('WESOLA SZKOLA', 'RAJCZA 103');

INSERT INTO holidayresort (name, adress)
VALUES ('KOCURY', 'PIEKNA 22, JASTARNIA');

--adding rooms
INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 2
FROM holidayresort
WHERE idholidayresort = 1;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 2
FROM holidayresort
WHERE idholidayresort = 1;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 4
FROM holidayresort
WHERE idholidayresort = 1;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 4
FROM holidayresort
WHERE idholidayresort = 1;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 4
FROM holidayresort
WHERE idholidayresort = 1;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 2
FROM holidayresort
WHERE idholidayresort = 2;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 2
FROM holidayresort
WHERE idholidayresort = 2;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 2
FROM holidayresort
WHERE idholidayresort = 2;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 5
FROM holidayresort
WHERE idholidayresort = 2;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 4
FROM holidayresort
WHERE idholidayresort = 3;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 4
FROM holidayresort
WHERE idholidayresort = 3;

INSERT INTO room (idholidayresort, bedsquantity)
SELECT idholidayresort, 6
FROM holidayresort
WHERE idholidayresort = 3;

--adding equipment
INSERT INTO equipment (equipmentname, quantity)
VALUES ('omega', 30);

INSERT INTO equipment (equipmentname, quantity)
VALUES ('life jacket', 100);

INSERT INTO equipment (equipmentname, quantity)
VALUES ('racket', 100);

INSERT INTO equipment (equipmentname, quantity)
VALUES ('tenis ball', 300);

INSERT INTO equipment (equipmentname, quantity)
VALUES ('bike', 100);

--assigning allergies and illnessess
INSERT INTO ownedallergy (idallergy, idperson)
SELECT idallergy, idperson
FROM allergy, participant
WHERE idallergy = 1 AND idperson = 10;

INSERT INTO ownedallergy (idallergy, idperson)
SELECT idallergy, idperson
FROM allergy, participant
WHERE idallergy = 2 AND idperson = 10;

INSERT INTO ownedallergy (idallergy, idperson)
SELECT idallergy, idperson
FROM allergy, participant
WHERE idallergy = 3 AND idperson = 6;

INSERT INTO ownedallergy (idallergy, idperson)
SELECT idallergy, idperson
FROM allergy, participant
WHERE idallergy = 1 AND idperson = 7;

INSERT INTO ownedallergy (idallergy, idperson)
SELECT idallergy, idperson
FROM allergy, participant
WHERE idallergy = 2 AND idperson = 8;

INSERT INTO ownedillness (idillness, idperson)
SELECT idillness, idperson
FROM illness, participant
WHERE idillness = 1 AND idperson = 10;

INSERT INTO ownedillness (idillness, idperson)
SELECT idillness, idperson
FROM illness, participant
WHERE idillness = 1 AND idperson = 9;

INSERT INTO ownedillness (idillness, idperson)
SELECT idillness, idperson
FROM illness, participant
WHERE idillness = 2 AND idperson = 11;

--creating holiday terms
INSERT INTO holidayterm (startdate, finishdate, idholidayresort)
SELECT '20/07/10', '20/07/24', idholidayresort
FROM holidayresort
WHERE holidayresort.name = 'KOCURY';

INSERT INTO holidayterm (startdate, finishdate, idholidayresort)
SELECT '21/07/10', '21/07/24', idholidayresort
FROM holidayresort
WHERE holidayresort.name = 'WESOLA SZKOLA';

INSERT INTO holidayterm (startdate, finishdate, idholidayresort)
SELECT '20/08/01', '20/08/15', idholidayresort
FROM holidayresort
WHERE holidayresort.name = 'ZIELONA WYSPA';

--assigning activities
INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 1 AND idactivity = 3;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 2 AND idactivity = 3;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 3 AND idactivity = 2;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 4 AND idactivity = 2;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 5 AND idactivity = 1;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 6 AND idactivity = 2;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 7 AND idactivity = 2;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 8 AND idactivity = 2;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 9 AND idactivity = 3;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 10 AND idactivity = 3;

INSERT INTO chosenactivity (idperson, idactivity)
SELECT idperson, idactivity
FROM person,activity
WHERE idperson = 11 AND idactivity = 3;

--creating groups
INSERT INTO participantsgroup(idperson, idholidayterm, minage, maxage)
SELECT idperson, idholidayterm, 10, 12
FROM person, holidayterm
WHERE holidayterm.idholidayresort = 3 AND person.surname = 'JAKUBOWSKI';

INSERT INTO participantsgroup(idperson, idholidayterm, minage, maxage)
SELECT idperson, idholidayterm, 6, 8
FROM person, holidayterm
WHERE holidayterm.idholidayresort = 1 AND person.surname = 'KUTA';

INSERT INTO participantsgroup(idperson, idholidayterm, minage, maxage)
SELECT idperson, idholidayterm, 6, 8
FROM person, holidayterm
WHERE holidayterm.idholidayresort = 3 AND person.surname = 'GESLICKA';

--creating lists of participants
INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 1
FROM participant
WHERE idperson = 6;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 1
FROM participant
WHERE idperson = 7;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 1
FROM participant
WHERE idperson = 11;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 2
FROM participant
WHERE idperson = 8;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 2
FROM participant
WHERE idperson = 9;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 2
FROM participant
WHERE idperson = 10;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 3
FROM participant
WHERE idperson = 8;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 3
FROM participant
WHERE idperson = 9;

INSERT INTO participantslist(idperson, idparticipantsgroup)
SELECT idperson, 3
FROM participant
WHERE idperson = 10;

--assigning rooms
INSERT INTO roomlist (idroom, idparticipantsgroup)
VALUES (8, 2);

INSERT INTO roomlist (idroom, idparticipantsgroup)
VALUES (9, 3);

INSERT INTO roomlist (idroom, idparticipantsgroup)
VALUES (1, 1);

INSERT INTO roomlist (idroom, idparticipantsgroup)
VALUES (2, 1);


--temp rentals

INSERT INTO rental (idperson, idequipment, quantityrented, rentaldate, returndate)
SELECT idperson, idequipment, 3, '20/07/05', '20/07/30'
FROM person, equipment
WHERE surname = 'JAKUBOWSKI' AND equipmentname = 'life jacket';

INSERT INTO rental (idperson, idequipment, quantityrented, rentaldate, returndate)
SELECT idperson, idequipment, 1, '20/07/05', '20/07/30'
FROM person, equipment
WHERE surname = 'JAKUBOWSKI' AND equipmentname = 'omega';

INSERT INTO rental (idperson, idequipment, quantityrented, rentaldate, returndate)
SELECT idperson, idequipment, 4, '20/07/05', '20/07/30'
FROM person, equipment
WHERE surname = 'GESLICKA' AND equipmentname = 'life jacket';

INSERT INTO rental (idperson, idequipment, quantityrented, rentaldate, returndate)
SELECT idperson, idequipment, 4, '20/07/05', '20/07/30'
FROM person, equipment
WHERE surname =  'GESLICKA' AND  equipmentname = 'omega';

INSERT INTO rental (idperson, idequipment, quantityrented, rentaldate, returndate)
SELECT idperson, idequipment, 6, '20/07/29', '20/08/17'
FROM person, equipment
WHERE surname = 'KUTA' AND equipmentname = 'racket';

INSERT INTO rental (idperson, idequipment, quantityrented, rentaldate, returndate)
SELECT idperson, idequipment, 40, '20/07/29', '20/08/17'
FROM person, equipment
WHERE surname =  'KUTA' AND equipmentname = 'tenis ball';