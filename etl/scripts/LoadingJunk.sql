SET IDENTITY_INSERT Junk ON;

MERGE INTO Junk AS Target
USING (
    SELECT 
        e.id,
        p.gender, 
        ct.name, 
        e.age_group
    FROM 
        ABC_AdventureDB.dbo.enrollments e
    LEFT JOIN 
        ABC_AdventureDB.dbo.children c ON c.pesel = e.child_pesel
    LEFT JOIN
        ABC_AdventureDB.dbo.parents p ON p.pesel = c.parent_pesel
    LEFT JOIN 
        ABC_AdventureDB.dbo.care_types ct ON e.care_type_id = ct.id
) AS Source
ON Target.id_junk = Source.id
WHEN NOT MATCHED THEN 
    INSERT (id_junk, parent_gender, care_type, age_group)
    VALUES (Source.id, Source.gender, Source.name, Source.age_group);

SET IDENTITY_INSERT Junk OFF;