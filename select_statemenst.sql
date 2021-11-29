--5 SELECT statements with WHERE clause

--Check who rented Omegas
SELECT name, surname
FROM person
WHERE idperson IN
    (SELECT idperson
	FROM rental
	WHERE idequipment =
        (SELECT idequipment
		FROM equipment
		WHERE equipmentname = 'omega'));

--find counsellors with counsellor permit
SELECT name,surname
FROM person
WHERE idperson IN
    (SELECT idperson
	FROM counsellor
	WHERE counsellorpermit = 1);

--find all participants interested in tenis
SELECT name, surname, adress
FROM person
WHERE idperson IN 
    (SELECT idperson
	FROM chosenactivity WHERE idactivity =
        (SELECT idactivity
		FROM activity
		WHERE activityname = 'tenis'))
AND idperson NOT IN
	(SELECT idperson
	FROM counsellor);      

--find every prarticipant allergic to pollen on 1st holiday term
SELECT name, surname
FROM person
WHERE idperson IN
    (SELECT idperson
	FROM ownedallergy
	WHERE idallergy =
        (SELECT idallergy
		FROM allergy
		WHERE allergyname = 'pollen'))
AND idperson IN
	(SELECT idperson
	FROM participantslist
	WHERE idparticipantsgroup IN
        (SELECT idparticipantsgroup
		FROM participantsgroup
		WHERE idholidayterm = 1));

--find every person who might have polish character int their surname
SELECT name, surname
FROM person
WHERE surname LIKE '%A%'
OR surname LIKE '%C%'
OR surname LIKE '%E%'
OR surname LIKE '%L%'
OR surname LIKE '%N%'
OR surname LIKE '%O%'
OR surname LIKE '%S%'
OR surname LIKE '%S%';



--5 SELECT statements with JOIN clause

--find counsellors, who already runned holiday terms, and show which ones
SELECT name, surname, idholidayterm
FROM person
JOIN participantsgroup
ON person.idperson = participantsgroup.idperson;

--show, which rooms in holiday resorts were already booked for our groups
SELECT idroom, name
FROM room
JOIN holidayresort
ON room.idholidayresort = holidayresort.idholidayresort
AND room.idroom IN 
    (SELECT idroom
    FROM roomlist); 
	
--show counsellors that rented equipment, and show which
SELECT name, surname, equipmentname
FROM person, equipment
WHERE person.idperson IN
    (SELECT counsellor.idperson
    FROM counsellor 
    JOIN rental
    ON counsellor.idperson = rental.idperson)
AND equipmentname IN
    (SELECT equipmentname
    FROM equipment
    JOIN rental
    ON equipment.idequipment = rental.idequipment);
	
--show every holiday resorts, where terms already happened, and when
SELECT name, adress, startdate, finishdate
FROM holidayresort
JOIN holidayterm
ON holidayresort.idholidayresort = holidayterm.idholidayresort
AND idholidayterm IN 
    (SELECT idholidayterm
    FROM participantsgroup);

--show participants with ilnessses, and their ilness
SELECT name, surname, adress, illnessname
FROM person, illness
WHERE idperson IN 
    (SELECT participant.idperson
    FROM participant
    JOIN ownedillness
    ON participant.idperson = ownedillness.idperson)
AND illness.idillness IN
        (SELECT illness.idillness
        FROM illness
        JOIN ownedillness
        ON ownedillness.idillness = illness.idillness);


--5 SELECT statements with GROUB BY clause (including 2 with HAVING clauses)

--show amount of rooms in every holiday resort, starting from one with most of them
SELECT holidayresort.name "Resort Name", COUNT(idroom) "Room Sum"
FROM holidayresort, room
WHERE holidayresort.idholidayresort = room.idholidayresort
GROUP BY holidayresort.name
ORDER BY COUNT(idroom) DESC;

--count avg quantity of rented equipment
SELECT equipmentname "Equipment name", Avg(quantityrented) "Avg quantity of rentals"
FROM equipment, rental
WHERE equipment.idequipment = rental.idequipment
GROUP BY equipmentname;

--count amount of man and woman out of counsellors
SELECT sex, COUNT(person.idperson) "Amount of counsellors"
FROM person, counsellor
WHERE person.idperson IN counsellor.idperson
GROUP BY sex;

--count hov many participants are in group 1
SELECT participantsgroup.idparticipantsgroup "Group ID", COUNT(participantslist.idperson) "Amount of participants"
FROM participantsgroup, participantslist
WHERE participantslist.idparticipantsgroup = participantsgroup.idparticipantsgroup
GROUP BY participantsgroup.idparticipantsgroup
HAVING participantsgroup.idparticipantsgroup = 1;

--count how many is there people with certain surname, with 'O' in it
SELECT surname, COUNT(*) "Amount of people with that surname"
FROM person
GROUP BY surname
HAVING surname LIKE '%O%';