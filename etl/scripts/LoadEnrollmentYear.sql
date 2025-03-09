USE ABC_AdventureDW
GO

DECLARE @Year INT;
DECLARE @Years TABLE (Year INT);

INSERT INTO @Years
VALUES
(2015),
(2016),
(2017),
(2018),
(2019),
(2020),
(2021),
(2022),
(2023),
(2024);

DECLARE YearCursor CURSOR FOR 
SELECT Year FROM @Years;

OPEN YearCursor;

FETCH NEXT FROM YearCursor INTO @Year;

WHILE @@FETCH_STATUS = 0
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Enrollment_Year WHERE year = @Year)
    BEGIN
        INSERT INTO Enrollment_Year(year) VALUES (@Year);
    END

    FETCH NEXT FROM YearCursor INTO @Year;
END

CLOSE YearCursor;
DEALLOCATE YearCursor;