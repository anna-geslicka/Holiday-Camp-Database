-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-27 10:50:47.761

-- tables
-- Table: Activity
CREATE TABLE Activity (
    IdActivity int IDENTITY (1,1),
    ActivityName char(10)  NOT NULL,
    CONSTRAINT Activity_pk PRIMARY KEY  (IdActivity)
);

-- Table: Allergy
CREATE TABLE Allergy (
    IdAllergy int IDENTITY (1,1),
    AllergyName char(20)  NOT NULL,
    CONSTRAINT Allergy_pk PRIMARY KEY  (IdAllergy)
);

-- Table: ChosenActivity
CREATE TABLE ChosenActivity (
    IdPerson int  NOT NULL,
    IdActivity int  NOT NULL,
    CONSTRAINT ChosenActivity_pk PRIMARY KEY  (IdPerson,IdActivity)
);

-- Table: Counsellor
CREATE TABLE Counsellor (
    IdPerson int  NOT NULL,
    CounsellorPermit char(1)  NOT NULL,
	Salary Money,
    CONSTRAINT Counsellor_pk PRIMARY KEY  (IdPerson)
);

-- Table: Equipment
CREATE TABLE Equipment (
    IdEquipment int IDENTITY (1,1),
    EquipmentName char(20)  NOT NULL,
    Quantity int  NOT NULL,
    CONSTRAINT Equipment_pk PRIMARY KEY  (IdEquipment)
);

-- Table: HolidayResort
CREATE TABLE HolidayResort (
    IdHolidayResort int IDENTITY (1,1),
    Name char(20)  NOT NULL,
    Adress char(50)  NOT NULL,
    CONSTRAINT HolidayResort_pk PRIMARY KEY  (IdHolidayResort)
);

-- Table: HolidayTerm
CREATE TABLE HolidayTerm (
    IdHolidayTerm int IDENTITY (1,1),
    StartDate date  NOT NULL,
    FinishDate date  NOT NULL,
    IdHolidayResort int  NOT NULL,
    CONSTRAINT HolidayTerm_pk PRIMARY KEY  (IdHolidayTerm)
);

-- Table: Illness
CREATE TABLE Illness (
    IdIllness int IDENTITY (1,1),
    IllnessName char(20)  NOT NULL,
    CONSTRAINT Illness_pk PRIMARY KEY  (IdIllness)
);

-- Table: OwnedAllergy
CREATE TABLE OwnedAllergy (
    IdAllergy int  NOT NULL,
    IdPerson int  NOT NULL,
    CONSTRAINT OwnedAllergy_pk PRIMARY KEY  (IdAllergy,IdPerson)
);

-- Table: OwnedIllness
CREATE TABLE OwnedIllness (
    IdIllness int  NOT NULL,
    IdPerson int  NOT NULL,
    CONSTRAINT OwnedIllness_pk PRIMARY KEY  (IdIllness,IdPerson)
);

-- Table: Participant
CREATE TABLE Participant (
    IdPerson int  NOT NULL,
    CONSTRAINT Participant_pk PRIMARY KEY  (IdPerson)
);

-- Table: ParticipantsGroup
CREATE TABLE ParticipantsGroup (
    IdParticipantsGroup int IDENTITY (1,1),
    IdPerson int  NOT NULL,
    IdHolidayTerm int  NOT NULL,
    MinAge int  NOT NULL,
    MaxAge int  NOT NULL,
    CONSTRAINT ParticipantsGroup_pk PRIMARY KEY  (IdParticipantsGroup)
);

-- Table: ParticipantsList
CREATE TABLE ParticipantsList (
    IdParticipantsList int IDENTITY (1,1),
    IdParticipantsGroup int  NOT NULL,
    IdPerson int  NOT NULL,
    CONSTRAINT ParticipantsList_pk PRIMARY KEY  (IdParticipantsList)
);

-- Table: Person
CREATE TABLE Person (
    IdPerson int NOT NULL,
    Name char(10)  NOT NULL,
    Surname char(20)  NOT NULL,
    Adress char(50)  NOT NULL,
    BirthDate date  NOT NULL,
    Sex char(1)  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY  (IdPerson)
);

-- Table: Rental
CREATE TABLE Rental (
    IdRental int IDENTITY (1,1),
    IdPerson int  NOT NULL,
    IdEquipment int  NOT NULL,
    QuantityRented int  NOT NULL,
    RentalDate date  NOT NULL,
    ReturnDate date  NULL,
    CONSTRAINT Id PRIMARY KEY  (IdRental)
);

-- Table: Room
CREATE TABLE Room (
    IdRoom int IDENTITY (1,1),
    IdHolidayResort int  NOT NULL,
    BedsQuantity int  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY  (IdRoom)
);

-- Table: RoomList
CREATE TABLE RoomList (
    IdRoom int  NOT NULL,
    IdParticipantsGroup int  NOT NULL,
    CONSTRAINT RoomList_pk PRIMARY KEY  (IdRoom,IdParticipantsGroup)
);

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

