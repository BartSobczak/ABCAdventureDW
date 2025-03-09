IF OBJECT_ID('TempData', 'U') IS NOT NULL 
  DROP TABLE TempData;

IF OBJECT_ID('ExcelData', 'U') IS NOT NULL 
  DROP TABLE ExcelData;

CREATE TABLE TempData (
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
BULK INSERT TempData
FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab5\sources\CEO_Excel.csv'
WITH (
    FIELDTERMINATOR = ',',  -- CSV field delimiter
    ROWTERMINATOR = '\n',   -- Use '\n' for newline
    FIRSTROW = 2            -- If your CSV file has a header row
);


-- Create the ExcelData table
CREATE TABLE ExcelData (
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
INSERT INTO ExcelData (
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
    [Kindergarten ID],
    [Location Price],
    [Toddler age group price],
    [Junior age group price],
    [Preschooler age group price],
    [Full-day care type price],
    [Half-day care type price],
    [Extended care type price],
    [Drop-in care type price]
FROM TempData

SET IDENTITY_INSERT ABC_AdventureDW.dbo.Enrollment ON;

WITH src AS (
    SELECT 
        e.id AS id_enrollment,
        e.kindergarten_id AS id_kindergarten,
        e.year AS year,
        CASE 
            WHEN e.age_group = 'toddler' THEN ed.Toddler_Age_Group_Price
            WHEN e.age_group = 'junior' THEN ed.Junior_Age_Group_Price
            WHEN e.age_group = 'preschooler' THEN ed.Preschooler_Age_Group_Price
        END AS age_group_price,
        CASE 
            WHEN e.care_type_id = 1 THEN ed.Full_Day_Care_Type_Price
            WHEN e.care_type_id = 2 THEN ed.Half_Day_Care_Type_Price
            WHEN e.care_type_id = 3 THEN ed.Extended_Care_Type_Price
            WHEN e.care_type_id = 4 THEN ed.Drop_In_Care_Type_Price
        END AS care_type_price,
        ed.Location_Price AS location_price,
        r.child_dev_rating AS child_dev_rating,
        r.contact_rating AS contact_rating,
        r.safety_hygiene_rating AS safety_hygene_rating,
        j.id_junk AS id_junk,
        c.id_child AS id_child
    FROM 
        ABC_AdventureDB.dbo.enrollments e
    LEFT JOIN 
        ABC_AdventureDB.dbo.ratings r ON e.id = r.enrollment_id
    JOIN 
        ABC_AdventureDB.dbo.children ch ON e.child_pesel = ch.PESEL
    JOIN 
        ABC_AdventureDW.dbo.Child c ON ch.PESEL = c.PESEL
    JOIN 
        ABC_AdventureDW.dbo.Junk j ON e.id = j.id_junk
    JOIN 
        ABC_AdventureDW.dbo.ExcelData ed ON e.kindergarten_id = ed.Kindergarten_ID
)
MERGE INTO ABC_AdventureDW.dbo.Enrollment AS E
USING (
    SELECT 
        id_enrollment,
        id_kindergarten,
        year,
        age_group_price,
        care_type_price,
        location_price,
        (age_group_price + care_type_price + location_price) AS final_price,
        child_dev_rating,
        contact_rating,
        safety_hygene_rating,
        (child_dev_rating + contact_rating + safety_hygene_rating) / 3.0 AS overall_rating,
        id_junk,
        id_child
    FROM src
) AS final_src
ON E.id_enrollment = final_src.id_enrollment
WHEN MATCHED THEN
    UPDATE SET 
        E.final_price = final_src.final_price,
        E.care_type_price = final_src.care_type_price,
        E.age_group_price = final_src.age_group_price,
        E.location_price = final_src.location_price,
        E.child_dev_rating = final_src.child_dev_rating, 
        E.contact_rating = final_src.contact_rating, 
        E.safety_hygene_rating = final_src.safety_hygene_rating, 
        E.id_junk = final_src.id_junk, 
        E.overall_rating = final_src.overall_rating,
        E.id_child = final_src.id_child
WHEN NOT MATCHED THEN
    INSERT (id_enrollment, id_kindergarten, year, final_price, care_type_price, age_group_price, location_price, child_dev_rating, contact_rating, safety_hygene_rating, id_junk, id_child, overall_rating)
    VALUES (final_src.id_enrollment, final_src.id_kindergarten, final_src.year, final_src.final_price, final_src.care_type_price, final_src.age_group_price, final_src.location_price, final_src.child_dev_rating, final_src.contact_rating, final_src.safety_hygene_rating, final_src.id_junk, final_src.id_child, final_src.overall_rating);