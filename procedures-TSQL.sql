--procedure for updating salary
CREATE PROCEDURE giveRaise @amount Int
AS
  DECLARE cur_sal CURSOR FOR SELECT salary, idPerson
  FROM counsellor
  WHERE salary > 0;
  DECLARE @sal Int, @id Int;
BEGIN
  OPEN cur_sal
      FETCH NEXT FROM cur_sal INTO @sal, @id
      WHILE @@FETCH_STATUS = 0
      BEGIN
          UPDATE Counsellor
          SET salary = @sal + @amount
          WHERE idPerson = @id;
          FETCH NEXT FROM cur_sal INTO  @sal, @id
  END
  CLOSE cur_sal;
  DEALLOCATE cur_sal;
  END;
  
--procedure for counting male and female participants
CREATE PROCEDURE participantsCounter @sex Char(1)
AS
BEGIN
DECLARE @count Int, @Info Varchar(30)
SELECT @count = Count(*)
FROM Person
WHERE sex = @sex AND idPerson IN (SELECT idPerson FROM participant)
SELECT @Info = 'There is ' + CAST(@count AS VARCHAR) + ' participants of given sex.'
PRINT @Info
END;