-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-25 20:55:04.06

-- tables
-- Table: Activity
CREATE TABLE Activity (
    IdActivity integer GENERATED ALWAYS AS IDENTITY,
    ActivityName varchar2(10)  NOT NULL,
    CONSTRAINT Activity_pk PRIMARY KEY (IdActivity)
) ;

-- Table: Allergy
CREATE TABLE Allergy (
    IdAllergy integer GENERATED ALWAYS AS IDENTITY,
    AllergyName varchar2(20)  NOT NULL,
    CONSTRAINT Allergy_pk PRIMARY KEY (IdAllergy)
) ;

-- Table: ChosenActivity
CREATE TABLE ChosenActivity (
    IdPerson integer  NOT NULL,
    IdActivity integer  NOT NULL,
    CONSTRAINT ChosenActivity_pk PRIMARY KEY (IdPerson,IdActivity)
) ;

-- Table: Counsellor
CREATE TABLE Counsellor (
    IdPerson integer  NOT NULL,
    CounsellorPermit char(1)  NOT NULL,
    CONSTRAINT Counsellor_pk PRIMARY KEY (IdPerson)
) ;

-- Table: Equipment
CREATE TABLE Equipment (
    IdEquipment integer GENERATED ALWAYS AS IDENTITY,
    EquipmentName varchar2(20)  NOT NULL,
    Quantity integer  NOT NULL,
    CONSTRAINT Equipment_pk PRIMARY KEY (IdEquipment)
) ;

-- Table: HolidayResort
CREATE TABLE HolidayResort (
    IdHolidayResort integer GENERATED ALWAYS AS IDENTITY,
    Name varchar2(20)  NOT NULL,
    Adress varchar2(50)  NOT NULL,
    CONSTRAINT HolidayResort_pk PRIMARY KEY (IdHolidayResort)
) ;

-- Table: HolidayTerm
CREATE TABLE HolidayTerm (
    IdHolidayTerm integer  GENERATED ALWAYS AS IDENTITY,
    StartDate date  NOT NULL,
    FinishDate date  NOT NULL,
    IdHolidayResort integer  NOT NULL,
    CONSTRAINT HolidayTerm_pk PRIMARY KEY (IdHolidayTerm)
) ;

-- Table: Illness
CREATE TABLE Illness (
    IdIllness integer GENERATED ALWAYS AS IDENTITY,
    IllnessName varchar2(20)  NOT NULL,
    CONSTRAINT Illness_pk PRIMARY KEY (IdIllness)
) ;

-- Table: OwnedAllergy
CREATE TABLE OwnedAllergy (
    IdAllergy integer  NOT NULL,
    IdPerson integer  NOT NULL,
    CONSTRAINT OwnedAllergy_pk PRIMARY KEY (IdAllergy,IdPerson)
) ;

-- Table: OwnedIllness
CREATE TABLE OwnedIllness (
    IdIllness integer  NOT NULL,
    IdPerson integer  NOT NULL,
    CONSTRAINT OwnedIllness_pk PRIMARY KEY (IdIllness,IdPerson)
) ;

-- Table: Participant
CREATE TABLE Participant (
    IdPerson integer  NOT NULL,
    CONSTRAINT Participant_pk PRIMARY KEY (IdPerson)
) ;

-- Table: ParticipantsGroup
CREATE TABLE ParticipantsGroup (
    IdParticipantsGroup integer GENERATED ALWAYS AS IDENTITY,
    IdPerson integer  NOT NULL,
    IdHolidayTerm integer  NOT NULL,
    MinAge integer  NOT NULL,
    MaxAge integer  NOT NULL,
    CONSTRAINT ParticipantsGroup_pk PRIMARY KEY (IdParticipantsGroup)
) ;

-- Table: ParticipantsList
CREATE TABLE ParticipantsList (
    IdParticipantsList integer GENERATED ALWAYS AS IDENTITY,
    IdParticipantsGroup integer  NOT NULL,
    IdPerson integer  NOT NULL,
    CONSTRAINT ParticipantsList_pk PRIMARY KEY (IdParticipantsList)
) ;

-- Table: Person
CREATE TABLE Person (
    IdPerson integer GENERATED ALWAYS AS IDENTITY,
    Name varchar2(10)  NOT NULL,
    Surname varchar2(20)  NOT NULL,
    Adress varchar2(50)  NOT NULL,
    BirthDate date  NOT NULL,
    Sex char(1)  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (IdPerson)
) ;

-- Table: Rental
CREATE TABLE Rental (
    IdRental integer GENERATED ALWAYS AS IDENTITY,
    IdPerson integer  NOT NULL,
    IdEquipment integer  NOT NULL,
    QuantityRented integer  NOT NULL,
    RentalDate date  NOT NULL,
    ReturnDate date,
    CONSTRAINT Id PRIMARY KEY (IdRental)
) ;

-- Table: Room
CREATE TABLE Room (
    IdRoom integer GENERATED ALWAYS AS IDENTITY,
    IdHolidayResort integer  NOT NULL,
    BedsQuantity integer  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY (IdRoom)
) ;

-- Table: RoomList
CREATE TABLE RoomList (
    IdRoom integer  NOT NULL,
    IdParticipantsGroup integer  NOT NULL,
    CONSTRAINT RoomList_pk PRIMARY KEY (IdRoom,IdParticipantsGroup)
) ;

-- foreign keys
-- Reference: ChosenAcitivity_Activity (table: ChosenActivity)
ALTER TABLE ChosenActivity ADD CONSTRAINT ChosenAcitivity_Activity
    FOREIGN KEY (IdActivity)
    REFERENCES Activity (IdActivity);

-- Reference: ChosenAcitivity_Person (table: ChosenActivity)
ALTER TABLE ChosenActivity ADD CONSTRAINT ChosenAcitivity_Person
    FOREIGN KEY (IdPerson)
    REFERENCES Person (IdPerson);

-- Reference: Counsellor_Person (table: Counsellor)
ALTER TABLE Counsellor ADD CONSTRAINT Counsellor_Person
    FOREIGN KEY (IdPerson)
    REFERENCES Person (IdPerson);

-- Reference: Group_Counsellor (table: ParticipantsGroup)
ALTER TABLE ParticipantsGroup ADD CONSTRAINT Group_Counsellor
    FOREIGN KEY (IdPerson)
    REFERENCES Counsellor (IdPerson);

-- Reference: OwnedAllergy_Allergy (table: OwnedAllergy)
ALTER TABLE OwnedAllergy ADD CONSTRAINT OwnedAllergy_Allergy
    FOREIGN KEY (IdAllergy)
    REFERENCES Allergy (IdAllergy);

-- Reference: OwnedAllergy_Participant (table: OwnedAllergy)
ALTER TABLE OwnedAllergy ADD CONSTRAINT OwnedAllergy_Participant
    FOREIGN KEY (IdPerson)
    REFERENCES Participant (IdPerson);

-- Reference: OwnedIlness_Ilness (table: OwnedIllness)
ALTER TABLE OwnedIllness ADD CONSTRAINT OwnedIlness_Ilness
    FOREIGN KEY (IdIllness)
    REFERENCES Illness (IdIllness);

-- Reference: OwnedIlness_Participant (table: OwnedIllness)
ALTER TABLE OwnedIllness ADD CONSTRAINT OwnedIlness_Participant
    FOREIGN KEY (IdPerson)
    REFERENCES Participant (IdPerson);

-- Reference: Participant_Person (table: Participant)
ALTER TABLE Participant ADD CONSTRAINT Participant_Person
    FOREIGN KEY (IdPerson)
    REFERENCES Person (IdPerson);

-- Reference: ParticipantsGroup_HolidayTerm (table: ParticipantsGroup)
ALTER TABLE ParticipantsGroup ADD CONSTRAINT ParticipantsGroup_HolidayTerm
    FOREIGN KEY (IdHolidayTerm)
    REFERENCES HolidayTerm (IdHolidayTerm);

-- Reference: ParticipantsList_Group (table: ParticipantsList)
ALTER TABLE ParticipantsList ADD CONSTRAINT ParticipantsList_Group
    FOREIGN KEY (IdParticipantsGroup)
    REFERENCES ParticipantsGroup (IdParticipantsGroup);

-- Reference: ParticipantsList_Participant (table: ParticipantsList)
ALTER TABLE ParticipantsList ADD CONSTRAINT ParticipantsList_Participant
    FOREIGN KEY (IdPerson)
    REFERENCES Participant (IdPerson);

-- Reference: Rental_Person (table: Rental)
ALTER TABLE Rental ADD CONSTRAINT Rental_Person
    FOREIGN KEY (IdPerson)
    REFERENCES Person (IdPerson);

-- Reference: Rental_SportEquipment (table: Rental)
ALTER TABLE Rental ADD CONSTRAINT Rental_SportEquipment
    FOREIGN KEY (IdEquipment)
    REFERENCES Equipment (IdEquipment);

-- Reference: RoomList_ParticipantsGroup (table: RoomList)
ALTER TABLE RoomList ADD CONSTRAINT RoomList_ParticipantsGroup
    FOREIGN KEY (IdParticipantsGroup)
    REFERENCES ParticipantsGroup (IdParticipantsGroup);

-- Reference: RoomList_Room (table: RoomList)
ALTER TABLE RoomList ADD CONSTRAINT RoomList_Room
    FOREIGN KEY (IdRoom)
    REFERENCES Room (IdRoom);

-- Reference: Room_HolidayResort (table: Room)
ALTER TABLE Room ADD CONSTRAINT Room_HolidayResort
    FOREIGN KEY (IdHolidayResort)
    REFERENCES HolidayResort (IdHolidayResort);

-- Reference: Term_HolidayResort (table: HolidayTerm)
ALTER TABLE HolidayTerm ADD CONSTRAINT Term_HolidayResort
    FOREIGN KEY (IdHolidayResort)
    REFERENCES HolidayResort (IdHolidayResort);

-- End of file.

