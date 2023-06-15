/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
	id             INT PRIMARY KEY,
	name 		    VARCHAR(100),
	date_of_birth 	DATE,
	escape_attempts INT,
	neutered 		BOOLEAN,
	weight_kg		DECIMAL(10, 2)
);

ALTER TABLE animals ADD species VARCHAR(30);

/* Query multiple tables. */

CREATE TABLE owner(
   id  SERIAL PRIMARY KEY,
   full_name VARCHAR (30),
   AGE INT
);

CREATE TABLE species(
	id  SERIAL PRIMARY KEY,
   name VARCHAR (30)
);

/* Modify Animal Table (such that id is set as autoincremented PRIMARY KEY )*/

ALTER TABLE animals
ADD COLUMN new_id SERIAL;

ALTER TABLE animals
ADD PRIMARY KEY (new_id);

ALTER TABLE animals
DROP COLUMN id;

ALTER TABLE animals
RENAME COLUMN new_id TO id;

SELECT * FROM animals;

/* Modify Species Column to include foreign key*/

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT REFERENCES species(id);

ALTER TABLE animals
ADD COLUMN owner_id INT REFERENCES owner(id);


/* Multiple tables */

CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR (30),
	age INT,
	date_of_graduation DATE
);

CREATE TABLE specializations (
    specializations_id SERIAL PRIMARY KEY,
	vets_id INT REFERENCES vets (id),
    species_id INT REFERENCES species (id)
);

CREATE TABLE visits (
    visits_id SERIAL PRIMARY KEY,
	animals_id INT REFERENCES animals(id),
    vets_id INT REFERENCES vets(id),
	date_of_visit DATE
);

ALTER TABLE owners ADD COLUMN email VARCHAR (120);

CREATE INDEX idx_visits_animals_id ON visits (animals_id);
CREATE INDEX idx_visits_vet_id ON visits (vets_id_id);
CREATE INDEX vets_id ON vets (id);

