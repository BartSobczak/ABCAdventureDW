INSERT INTO ABC_AdventureDW.dbo.Teacher(pesel, gender, age_category, insertion, deactivation)
SELECT 
    teachers.pesel, 
    teachers.gender, 
    CASE 
        WHEN YEAR(GETDATE()) - teachers.birth_year < 25 THEN 'under 25'
        WHEN YEAR(GETDATE()) - teachers.birth_year BETWEEN 26 AND 32 THEN '26 to 32'
        WHEN YEAR(GETDATE()) - teachers.birth_year BETWEEN 33 AND 40 THEN '33 to 40'
        WHEN YEAR(GETDATE()) - teachers.birth_year BETWEEN 41 AND 49 THEN '41 to 49'
        WHEN YEAR(GETDATE()) - teachers.birth_year BETWEEN 50 AND 58 THEN '50 to 58'
        ELSE '58 plus'
    END AS age_category,
    GETDATE() AS insertion,
    NULL AS deactivation
FROM 
    ABC_AdventureDB.dbo.teachers
WHERE NOT EXISTS (
    SELECT 1
    FROM ABC_AdventureDW.dbo.Teacher
    WHERE PESEL = teachers.pesel
);