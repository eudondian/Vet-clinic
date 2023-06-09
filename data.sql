/* Populate database with sample data. */

INSERT INTO animals (id, name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    (1, 'Agumon', '2020-02-03', 0, true, 10.23),
    (2, 'Gabumon', '2018-11-15', 2, true, 8),
    (3, 'Pikachu', '2021-01-07', 1, false, 15.04),
    (4, 'Devimon', '2017-05-12', 5, true, 11),
    ( 5, 'Charmander', '2020-02-08', 0, false, 11),
    ( 6, 'Plantmon', '2021-11-15', 2, true, 5.7),
    ( 7, 'Squirtle', '1993-04-02', 3, false, 12.13),
    ( 8, 'Angemon', '2005-06-12', 1, true, 45),
    ( 9, 'Boarmon', '2005-06-07', 7, true, 20.4),
    ( 10, 'Blossom', '1998-10-13', 3, true, 17),
    ( 11, 'Ditto', '2022-05-14', 4, true, 22);

  /* Populate owners/species database with sample data. */  

INSERT INTO owners (id, full_name, age)
VALUES 
   (1, 'Sam Smith', 34),
   (2, 'Jennifer Onwell', 19),
   (3, 'Bob', 45),
   (4, 'Melody Pond', 77),
   (5, 'Dean Winchester', 14),
   (6, 'Jodie Whittaker', 38);

SELECT * FROM owners

INSERT INTO species (id, name)
VALUES 
  (1, 'Pokeman'),
  (2, 'Digimon');

  /*Modify insert animals to include species_id values */

  UPDATE animals 
SET species_id = CASE
WHEN name LIKE '%mon%' THEN (SELECT id FROM species WHERE name = 'Digimon') 
END;

UPDATE animals 
SET species_id = CASE
WHEN name NOT LIKE '%mon%' THEN (SELECT id FROM species WHERE name = 'Pokemon') 
END;

SELECT * FROM species


UPDATE animals
SET owner_id = (
CASE
 	WHEN name = 'Agumon' THEN (SELECT id FROM owners WHERE full_name ='Sam Smith')
 	WHEN name IN ('Gabumon', 'Pikachu') THEN (SELECT id FROM owners WHERE full_name = 'Jennifer Onwell')
 	WHEN name IN ('Devimon', 'Plantmon') THEN (SELECT id FROM owners WHERE full_name = 'Bob')
 	WHEN name IN ('Charmander', 'Squirtle', 'Blossom') THEN (SELECT id FROM owners WHERE full_name = 'Melody Pond')
 	WHEN name IN ('Angemon', 'Boarmon') THEN (SELECT id FROM owners WHERE full_name = 'Dean Winchester')
END
);	

/* Multiple tables */

INSERT INTO vets ( name, age, date_of_graduation)
VALUES
	( 'Vet William Tatcher', 45, '2000-04-23'),
	( 'Vet Maisy Smith', 26, '2019-01-17'),
	( 'Vet Stephanie Mendez', 64, '1981-05-04'),
	( 'Vet Jack Harkness', 38, '2008-06-08');

  /* Data for Spacialties*/

INSERT INTO specializations (vets_id, species_id)
VALUES
	(1, 1),
	(3, 2),
	(3, 1),
	(4, 2);
	
/* Data for visits*/

INSERT INTO visits (animals_id, vets_id, date_of_visit)
VALUES
	(1, 1, '2020-05-24'),
	(1, 3, '2020-07-22'),
	(2, 4, '2021-02-02'),
	(7, 2, '2020-01-05'),
	(7, 2, '2020-03-08'),
	(7, 2, '2020-05-14'),
	(3, 3, '2021-05-04'),
	(8, 4, '2021-02-24'),
	(4, 2, '2019-12-21'),
	(4, 1, '2020-08-10'),
	(4, 2, '2021-04-07'),
	(9, 3, '2019-09-29'),
	(5, 4, '2020-10-03'), 
	(5, 4, '2020-11-04'),
	(6, 2, '2019-01-24'),
	(6, 2, '2019-05-15'),
	(6, 2, '2020-02-27'),
	(6, 2, '2020-08-03'),
	(10, 3, '2020-05-24'),
	(10, 1, '2021-01-11');
	
	