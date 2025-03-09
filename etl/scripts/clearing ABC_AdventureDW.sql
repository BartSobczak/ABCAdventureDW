use ABC_AdventureDW;

delete from Teacher_Employment;
DBCC CHECKIDENT ('Teacher_Employment', RESEED, 0);
delete from Enrollment;
DBCC CHECKIDENT ('Enrollment', RESEED, 0);
delete from Enrollment_Year;
delete from Kindergarten;
DBCC CHECKIDENT ('Kindergarten', RESEED, 0);
delete from Junk;
DBCC CHECKIDENT ('Junk', RESEED, 0);
delete from Child;
DBCC CHECKIDENT ('Child', RESEED, 0);
delete from Teacher;
DBCC CHECKIDENT ('Teacher', RESEED, 0);
delete from Employment_Date;





