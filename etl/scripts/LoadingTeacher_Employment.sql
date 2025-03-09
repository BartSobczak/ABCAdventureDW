MERGE INTO ABC_AdventureDW.dbo.Teacher_Employment AS te
USING (
    SELECT 
        t.id_teacher,
        k.id_kindergarten, 
        abc.PESEL, 
        YEAR(GETDATE()) - abc.birth_year AS teacher_age,
        ed.id_date
    FROM
        ABC_AdventureDB.dbo.teachers abc
    JOIN
        ABC_AdventureDW.dbo.Teacher t ON abc.PESEL = t.PESEL
    JOIN
        ABC_AdventureDW.dbo.Kindergarten k ON abc.kindergarten_id = k.id_kindergarten
    JOIN
        ABC_AdventureDW.dbo.Employment_Date ed ON ed.date = CAST(GETDATE() AS DATE)
) AS src
ON te.id_teacher = src.id_teacher
WHEN MATCHED THEN
    UPDATE SET 
        te.id_kindergarten = src.id_kindergarten, 
        te.teacher_age = src.teacher_age,
        te.id_date = src.id_date
WHEN NOT MATCHED THEN
    INSERT (id_kindergarten, id_teacher, teacher_age, id_date)
    VALUES (src.id_kindergarten, src.id_teacher, src.teacher_age, src.id_date);