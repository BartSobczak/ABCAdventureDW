UPDATE e
SET e.care_type_id = e.care_type_id + 1
FROM ABC_AdventureDB.dbo.enrollments e
WHERE EXISTS (
    SELECT 1
    FROM ABC_AdventureDB.dbo.care_types ct
    WHERE ct.id = e.care_type_id + 1
);