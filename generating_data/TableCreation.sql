CREATE TABLE cities(
	id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
	name VARCHAR(16) CHECK (name IN ('Warszawa', 'Gdansk', 'Bydgoszcz', 'Krakow', 'Poznan', 'Katowice', 'Wroclaw', 'Szczecin', 'Lodz', 'Lublin')),
	population INT
);


CREATE TABLE parents(
	pesel VARCHAR(11) PRIMARY KEY NOT NULL,
	name VARCHAR(16),
	surname VARCHAR(30),
	gender VARCHAR(10) CHECK (gender IN ('male', 'female')),
	email VARCHAR(60),
	phone VARCHAR(10)
);


CREATE TABLE children(
	pesel VARCHAR(11) PRIMARY KEY NOT NULL,
	parent_pesel VARCHAR(11) REFERENCES parents(pesel) ON DELETE CASCADE ON UPDATE CASCADE,
	name VARCHAR(16),
	surname VARCHAR(30),
	gender VARCHAR(10) CHECK (gender IN ('male', 'female')),
	address VARCHAR(60)
);


CREATE TABLE care_types(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	name VARCHAR(16) CHECK (name IN ('full-day', 'half-day', 'extended', 'drop-in')),
	description VARCHAR(100)
);


CREATE TABLE districts(
	id INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	city_id INT REFERENCES cities(id) ON DELETE CASCADE ON UPDATE CASCADE,
	name VARCHAR(50),
	population INT
);


CREATE TABLE kindergartens(
	id INT PRIMARY KEY NOT NULL,
	district_id INT REFERENCES districts(id) ON DELETE CASCADE ON UPDATE CASCADE,
	name VARCHAR (50),
	email VARCHAR(60),
	address VARCHAR(60),
	phone VARCHAR(10)
);


CREATE TABLE teachers(
	pesel VARCHAR(11) PRIMARY KEY NOT NULL,
	kindergarten_id INT REFERENCES kindergartens(id) ON DELETE CASCADE ON UPDATE CASCADE,
	name VARCHAR(16),
	surname VARCHAR(30),
	gender VARCHAR(10) CHECK (gender IN ('male', 'female')),
	email VARCHAR(60), 
	phone VARCHAR(10),
	birth_year INT
);


CREATE TABLE enrollments(
	id INT PRIMARY KEY NOT NULL,
	kindergarten_id INT REFERENCES kindergartens(id) ON DELETE CASCADE ON UPDATE CASCADE,
	child_pesel VARCHAR(11) REFERENCES children(pesel) ON DELETE CASCADE ON UPDATE CASCADE,
	care_type_id INT REFERENCES care_types(id) ON DELETE CASCADE ON UPDATE CASCADE,
	year INT,
	age_group VARCHAR(16) CHECK (age_group IN ('toddler', 'junior', 'preschooler')),
	price INT
);


CREATE TABLE ratings(
	id INT PRIMARY KEY NOT NULL,
	enrollment_id INT REFERENCES enrollments(id) ON DELETE CASCADE ON UPDATE CASCADE,
	child_dev_rating INT CHECK (child_dev_rating > 0 AND child_dev_rating <= 10),
	contact_rating INT CHECK (contact_rating > 0 AND contact_rating <= 10),
	safety_hygiene_rating INT CHECK (safety_hygiene_rating > 0 AND safety_hygiene_rating <= 10)
);


CREATE TABLE kindergarten_addresses(
	id INT PRIMARY KEY NOT NULL,
	address VARCHAR(60)
);