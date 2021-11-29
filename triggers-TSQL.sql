--trigger for updating salary too high
CREATE TRIGGER budgetCheck On Counsellor
FOR INSERT, UPDATE
AS
BEGIN
IF UPDATE(Salary)
BEGIN
IF EXISTS (SELECT 1 FROM Inserted WHERE salary > 5000)
  BEGIN
    UPDATE counsellor
    SET salary = 3000
    WHERE idPerson IN (SELECT idPerson
                      FROM Inserted
                      WHERE salary > 5000)
    END;
END;
END;

--trigger for deleting paid counsellors
CREATE TRIGGER noDelPaidCouns On counsellor
FOR DELETE
AS
BEGIN
DECLARE @Id Int;
SELECT @Id = IdPerson From Deleted;
IF EXISTS (SELECT 1 FROM counsellor WHERE IdPerson = @Id AND salary > 0)
    Rollback;
    Print 'Cannot delete paid counellors.'
END;

