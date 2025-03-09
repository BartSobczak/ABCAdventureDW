DECLARE @StartDate DATE = '2015-01-01';
DECLARE @EndDate DATE = '2024-12-31';
DECLARE @Id INT = 1;

WHILE @StartDate <= @EndDate
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Employment_Date WHERE date = @StartDate)
    BEGIN
        INSERT INTO Employment_Date(id_date, date, year, month, month_no, day_no)
        VALUES (@Id, @StartDate, YEAR(@StartDate), DATENAME(MONTH, @StartDate), MONTH(@StartDate), DAY(@StartDate));
        
        SET @Id = @Id + 1;
    END

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END