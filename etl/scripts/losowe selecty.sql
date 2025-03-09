select *
from Child;

select *
from Employment_Date;

select *
from ABC_AdventureDB.dbo.ratings;

select *
from Enrollment;

select *
from Enrollment_Year;

select *
from ABC_AdventureDB.dbo.enrollments;

select *
from ABC_AdventureDB.dbo.kindergartens;

select *
from ABC_AdventureDB.dbo.kindergarten_addresses;

select *
from Kindergarten;

select *
from Junk;

select *
from Teacher;

select * 
from Teacher_Employment;

select *
from ABC_AdventureDB.dbo.teachers;

select *
from ABC_AdventureDB.dbo.children;

select *
from Child;

SELECT 
    e.id AS enrollment_id,
    j.id_junk AS junk_id
FROM 
    ABC_AdventureDB.dbo.enrollments e
LEFT JOIN 
    Junk j ON j.id_junk = e.id;