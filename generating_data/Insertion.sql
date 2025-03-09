INSERT INTO cities (name, population)
VALUES
('Warszawa', 1765000),
('Gdansk', 582000),
('Bydgoszcz', 354000),
('Krakow', 766000),
('Poznan', 540000),
('Katowice', 302000),
('Wroclaw', 638000),
('Szczecin', 404000),
('Lodz', 696000),
('Lublin', 342000);


INSERT INTO districts (city_id, name, population)
VALUES
(1, 'Mokotow', 220682),
(1, 'Praga Poludnie', 174741),
(1, 'Ursynow', 145938),
(1, 'Bielany', 131738),
(1, 'Targowek', 123278),
(1, 'Srodmiescie', 122646),
(1, 'Bemowo', 120141),
(1, 'Wola', 119614),
(1, 'Bialoleka', 98418),
(1, 'Ochota', 87447),
(2, 'Chelm', 32099),
(2, 'Ujescisko-Lostowice', 27731),
(2, 'Piecki-Migowo', 27495),
(2, 'Przymorze Wielkie', 27015),
(2, 'Srodmiescie', 25127),
(2, 'Wrzeszcz Dolny', 22635),
(2, 'Wrzeszcz Gorny', 22014),
(2, 'Orunia Gorna-Gdansk Poludnie', 20488),
(2, 'Jasien', 20100),
(2, 'Osowa', 16114),
(3, 'Czyzkowko', 8020),
(3, 'Stary Fordon', 9134),
(3, 'Bielawy', 6622),
(3, 'Bartodzieje', 24540),
(3, 'Kapusciska', 24060),
(3, 'Szwederowo', 32760),
(3, 'Wzgorze Wolnosci', 11430),
(3, 'Wyzyny', 30513),
(3, 'Piaski', 2400),
(3, 'Okole', 11290),
(4, 'Stare Miasto', 31359),
(4, 'Krowodrza', 30223),
(4, 'Podgorze', 36885),
(4, 'Nowa Huta', 51234),
(4, 'Grzegorzki', 29474),
(4, 'Pradnik Bialy', 70647),
(4, 'Bronowice', 22428),
(4, 'Lagiewniki-Borek Falecki', 15259),
(4, 'Swoszowice', 27493),
(4, 'Debniki', 61637),
(5, 'Jezyce', 24489),
(5, 'Wilda', 29205),
(5, 'Grunwald', 41727),
(5, 'Stare Miasto', 30433),
(5, 'Chartowo', 24552),
(5, 'Piatkowo', 36479),
(5, 'Naramowice', 15128),
(5, 'Rataje', 40328),
(5, 'Winiary', 15991),
(5, 'Junikowo', 8837),
(6, 'Srodmiecie', 25320),
(6, 'Ligota', 28186),
(6, 'Zawodzie', 10835),
(6, 'Dab', 6914),
(6, 'Osiedle Paderewskiego-Muchowiec', 11336),
(6, 'Bogucice', 13426),
(6, 'Giszowiec', 15409),
(6, 'Brynow-Osiedle Zgrzebnioka', 6384),
(6, 'Osiedle Witosa', 12123),
(6, 'Murcki', 4840),
(7, 'Stare Miasto', 10343),
(7, 'Krzyki', 19312),
(7, 'Olbin', 34689),
(7, 'Psie Pole-Zawidawie', 29615),
(7, 'Karlowice-Rozanka', 33690),
(7, 'Lesnica', 28159),
(7, 'Przedmiescie Swidnickie', 14623),
(7, 'Maslice', 10184),
(7, 'Gaj', 20377),
(7, 'Borek', 13005),
(8, 'Srodmiecie-Polnoc', 11647),
(8, 'Gumience', 22116),
(8, 'Pogodno', 24000),
(8, 'Niebuszewo-Bolinko', 20789),
(8, 'Pomorzany', 20505),
(8, 'Turzyn', 20426),
(8, 'Swierczewo', 15673),
(8, 'Dabie', 12986),
(8, 'Golecino-Goclaw', 3142),
(8, 'Stare Miasto', 4947),
(9, 'Baluty Centrum', 41843),
(9, 'Stare Polesie', 29400),
(9, 'Katedralna', 31797),
(9, 'Stary Widzew', 19399),
(9, 'Chojny-Dabrowa', 42457),
(9, 'Widzew-Wschod', 35097),
(9, 'Gorniak', 15989),
(9, 'Teofilow-Wielkopolska', 39710),
(9, 'Olechow-Janow', 20523),
(9, 'Chojny', 30905),
(10, 'Srodmiecie', 19260),
(10, 'Wieniawa', 11983),
(10, 'Czechow-Poludniowy', 23469),
(10, 'Tatary', 12031),
(10, 'Dziesiata', 22041),
(10, 'Slawin', 11872),
(10, 'Czuby Poludniowe', 17639),
(10, 'Czuby Polnocne', 26877),
(10, 'Kalinowszczyzna', 22597),
(10, 'Wrotkow', 14785);


INSERT INTO care_types (name, description)
VALUES
('full-day', 'Covers standard hours of child care, monday-friday, 8:00-14:00.'),
('half-day', 'Covers 8:00-11:00 or 11:00-14:00 hours of child care, monday-friday.'),
('extended', 'Covers extended hours of child care, monday-friday, 8:00-16:00.'),
('drop-in', 'Individual, indefinite hours of care, monday-friday.');


BULK INSERT dbo.children FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_children1.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.teachers FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_teachers1.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.parents FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_parents1.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.kindergartens FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_kindergarten1.txt' 
WITH (FIELDTERMINATOR = ';');

BULK INSERT dbo.enrollments FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\insert_enrollments1.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.ratings FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab5\sources\insert_ratings1.txt' 
WITH (FIELDTERMINATOR = ',');

BULK INSERT dbo.kindergarten_addresses FROM 'C:\Users\szymo\OneDrive\Dokumenty\Studies\Semester 4\Data Warehouses\Lab2\txt_file_generator\update_kindergarten_addresses.txt' 
WITH (FIELDTERMINATOR = ';');