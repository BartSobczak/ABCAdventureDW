BULK INSERT dbo.children FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_children2.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.teachers FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_teachers2.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.parents FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_parents2.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.kindergartens FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_kindergarten2.txt' 
WITH (FIELDTERMINATOR = ';');

BULK INSERT dbo.enrollments FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_enrollments2.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.ratings FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab5\sources\insert_ratings2.txt' 
WITH (FIELDTERMINATOR = ',');
