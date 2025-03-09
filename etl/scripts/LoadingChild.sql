INSERT INTO ABC_AdventureDW.dbo.Child (pesel, gender)
SELECT children.pesel, children.gender
FROM ABC_AdventureDB.dbo.children
WHERE NOT EXISTS (
    SELECT 1
    FROM ABC_AdventureDW.dbo.Child
    WHERE PESEL = children.pesel
);