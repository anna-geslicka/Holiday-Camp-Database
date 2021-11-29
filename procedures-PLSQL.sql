--procedure for renting equipment
CREATE PROCEDURE RentEquipment(p_name Varchar2, p_surname Varchar2, p_equipmentName Varchar, p_quantity Integer)
 AS
    v_authorized Integer;
    v_IdPerson Integer;
    v_IdEquipment Integer;
    v_equipmentExists Integer;
    v_equipmentAvaliable Integer;
    e_err Exception;
    v_Info VARCHAR2(120);
    BEGIN
    SELECT COUNT(*) INTO v_authorized --checking person autorization for renting
    FROM person P
    JOIN counsellor C
    ON P.idperson = C.idperson
    WHERE name = p_name AND surname = p_surname;
    IF v_authorized > 0 THEN --assigning ID if autorized
        SELECT IdPerson INTO v_IdPerson FROM person
        WHERE name = p_name AND surname = p_surname;
    END IF;
    IF v_authorized = 0 THEN --raising exception if not authorized
        v_Info := p_name || ' ' || p_surname || ' is not authorized to rent equipment.';
        Raise e_err;
      ELSE
        SELECT COUNT(1) INTO v_equipmentExists --checking equipment existence
        FROM equipment
        WHERE equipmentName = p_equipmentName;
        IF v_equipmentExists > 0 THEN --assigning ID if exists
            SELECT idEquipment INTO v_IdEquipment
            FROM equipment
            WHERE equipmentName = p_equipmentName;
        END IF;
        IF v_equipmentExists = 0 THEN --raising exception if not exists
            v_Info := 'There is no such equipment in our storeroom';
            Raise e_err;
        ELSE
            SELECT quantity INTO v_equipmentAvaliable
            FROM equipment
            WHERE idEquipment = v_IdEquipment;
            IF v_equipmentAvaliable < p_quantity THEN --checking if there's enough equipment to rent
                v_Info := 'There is not enough ' ||  p_equipmentName ||'. there is only ' || v_equipmentAvaliable || ' left.';
                Raise e_err;
             ELSE  --inserting new rental if enough, lowering quantity on stock
                INSERT INTO rental (idPerson, idEquipment, quantityRented, rentalDate)
                VALUES (v_IdPerson, v_IdEquipment, p_quantity, SYSDATE);
                UPDATE equipment 
                SET quantity = quantity - p_quantity
                WHERE idEquipment = v_idEquipment;
                dbms_output.put_line (p_equipmentName || 's were rented succesfully');
            END IF;
            IF v_equipmentAvaliable = 0 THEN --raising exception if not avaliable
                v_Info := p_equipmentName || ' is not currently avaliable.';
                Raise e_err;
            END IF;
        END IF;        
    END IF;            
    EXCEPTION
        WHEN e_err THEN
        dbms_output.put_line (v_Info);
   END;
   
   --procedure for returning equipment
 CREATE PROCEDURE ReturnEquipment(p_name Varchar2, p_surname Varchar2, p_equipmentName Varchar, p_rentalDate Date)
 AS
    v_authorized Integer;
    v_equipmentExists Integer;
    v_rentalExists Integer;
    v_IdPerson Integer;
    v_IdEquipment Integer;
    v_IdRental Integer;
    v_QuantityReturned Integer;
    e_err Exception;
    v_Info VARCHAR2(120);
    BEGIN
    SELECT COUNT(*) INTO v_authorized --checking if the person could rented something
    FROM person P
    JOIN counsellor C
    ON P.idperson = C.idperson
    WHERE name = p_name AND surname = p_surname;
    IF v_authorized > 0 THEN --assigning ID if so
        SELECT IdPerson INTO v_IdPerson FROM person
        WHERE name = p_name AND surname = p_surname;
    END IF;
    IF v_authorized = 0 THEN --raising exception if not authorized
        v_Info := p_name || ' ' || p_surname || ' could not rent any equipment.';
        Raise e_err;
      ELSE
        SELECT COUNT(1) INTO v_equipmentExists --checking equipment existence
        FROM equipment
        WHERE equipmentName = p_equipmentName;
        IF v_equipmentExists > 0 THEN --assigning ID if exists
            SELECT idEquipment INTO v_IdEquipment
            FROM equipment
            WHERE equipmentName = p_equipmentName;
        END IF;
        IF v_equipmentExists = 0 THEN --raising exception if not exists
            v_Info := 'There were no such equipment avaliable for renting';
            Raise e_err;
        ELSE
            SELECT COUNT(*) INTO v_rentalExists --checking if such rental exists
            FROM rental
            WHERE idPerson = v_IdPerson AND idEquipment = v_IdEquipment AND rentalDate = p_rentalDate;
            IF v_rentalExists > 0 THEN --returning equipment
                SELECT idRental INTO v_idRental
                FROM rental
                WHERE idPerson = v_IdPerson AND idEquipment = v_IdEquipment AND rentalDate = p_rentalDate;
                SELECT quantityrented INTO v_quantityReturned
                FROM rental
                WHERE idRental = v_IdRental;
                UPDATE equipment 
                SET quantity = quantity + v_quantityReturned
                WHERE idEquipment = v_idEquipment;
                UPDATE rental
                SET returndate = SYSDATE
                WHERE idEquipment = v_idEquipment;
                dbms_output.put_line ('Return successful');
            ELSE
                v_Info := 'There is no rental with given specification.';
                Raise e_err;
           END IF;     
        END IF;        
    END IF;            
    EXCEPTION
        WHEN e_err THEN
        dbms_output.put_line (v_Info);
   END;
   
--procedure for adding additional equipment for every equipment category
CREATE PROCEDURE multiplyEquipment (p_amount Integer)
AS
v_quantity Equipment.quantity%type;
v_name Equipment.equipmentName%type;
CURSOR cur_equipment IS SELECT equipmentName c_name, quantity c_quantity
FROM Equipment;
v_equipment cur_equipment%Rowtype;
BEGIN
    OPEN cur_equipment;
    LOOP
        FETCH cur_equipment INTO v_equipment;
        v_name := v_equipment.c_name;
        v_quantity := v_equipment.c_quantity;
        EXIT WHEN cur_equipment%Notfound;
        v_quantity := v_quantity + p_amount;
    UPDATE Equipment SET quantity = v_quantity WHERE equipmentName = v_name;
    END LOOP;
CLOSE cur_equipment;
END;