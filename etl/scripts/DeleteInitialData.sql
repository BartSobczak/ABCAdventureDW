use ABC_AdventureDW;

delete from Enrollment_Year;
DBCC CHECKIDENT ('Enrollment_Year', RESEED, 0);
delete from Employment_Date;
DBCC CHECKIDENT ('Employment_Date', RESEED, 0);