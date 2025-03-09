UPDATE ABC_AdventureDW.dbo.Kindergarten
SET avg_teacher_age = (
    SELECT AVG(teacher_age) 
    FROM ABC_AdventureDW.dbo.Teacher_Employment 
    WHERE id_kindergarten = Kindergarten.id_kindergarten
)