IF OBJECT_ID('tempdb..#TempData') IS NOT NULL DROP TABLE #TempData
IF OBJECT_ID('tempdb..#ExcelData') IS NOT NULL DROP TABLE #ExcelData

-- Create a temporary table with all columns from the CSV file
CREATE TABLE #TempData (
    [Kindergarten ID] INT,
    [Kindergarten name] VARCHAR(100),
    [District] VARCHAR(100),
    [City] VARCHAR(100),
    [Location Price] INT,
    [Toddler age group price] INT,
    [Junior age group price] INT,
    [Preschooler age group price] INT,
    [Full-day care type price] INT,
    [Half-day care type price] INT,
    [Extended care type price] INT,
    [Drop-in care type price] INT
)

-- Import the CSV file into the temporary table
BULK INSERT #TempData
FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab5\sources\CEO_Excel1.csv'
WITH (
    FIELDTERMINATOR = ',',  -- CSV field delimiter
    ROWTERMINATOR = '\n',   -- Use '\n' for newline
    FIRSTROW = 2            -- If your CSV file has a header row
);


-- Create the #ExcelData table
CREATE TABLE #ExcelData (
    Kindergarten_ID INT,
    Location_Price INT,
    Toddler_Age_Group_Price INT,
    Junior_Age_Group_Price INT,
    Preschooler_Age_Group_Price INT,
    Full_Day_Care_Type_Price INT,
    Half_Day_Care_Type_Price INT,
    Extended_Care_Type_Price INT,
    Drop_In_Care_Type_Price INT
)


-- Insert the specific columns you need into your target table
INSERT INTO #ExcelData (
    Kindergarten_ID,
    Location_Price,
    Toddler_Age_Group_Price,
    Junior_Age_Group_Price,
    Preschooler_Age_Group_Price,
    Full_Day_Care_Type_Price,
    Half_Day_Care_Type_Price,
    Extended_Care_Type_Price,
    Drop_In_Care_Type_Price
)
SELECT 
    [Kindergarten ID] + 1,
    [Location Price],
    [Toddler age group price],
    [Junior age group price],
    [Preschooler age group price],
    [Full-day care type price],
    [Half-day care type price],
    [Extended care type price],
    [Drop-in care type price]
FROM #TempData