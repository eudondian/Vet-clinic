/*Queries that provide answers to the questions from all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon%';

SELECT * FROM animals WHERE date_of_birth >= '2016-01-01' AND date_of_birth <= '2019-01-01';

SELECT * FROM animals WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals WHERE weight_kg >10.5;

SELECT * FROM animals WHERE neutered = true;

SELECT * FROM animals WHERE name <> 'Gabumon';

SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;


BEGIN;
UPDATE animals SET species = 'unspecified';
SELECT * FROM animals;
ROLLBACK;


UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon%';

UPDATE animals SET species = 'Pokemon' WHERE name NOT LIKE '%mon%';

BEGIN;
DELETE FROM animals;

ROLLBACK;

DELETE FROM animals
WHERE date_of_birth >'2022-01-01';
SELECT * FROM animals;

SAVEPOINT; vet_savepoint_1;

UPDATE animals SET weight_kg = weight_kg * -1;

ROLLBACK;

UPDATE animals
SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

COMMIT;

SELECT COUNT (name) From animals;

SELECT COUNT (escape_attempts) FROM animals WHERE escape_attempts = 0;

SELECT AVG (weight_kg) FROM animals;

SELECT neutered, COUNT(*) AS escape_count FROM animals GROUP BY neutered ORDER BY escape_count DESC LIMIT 1;

SELECT MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;

SELECT AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'GROUP BY species;

/* Foreign Key queries*/

SELECT animals.name
FROM animals 
JOIN owners  ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';


SELECT animals.name
FROM animals 
JOIN species  ON animals.species_id = species.id
WHERE species.name = 'Pokemon';


SELECT owners.full_name, animals.name
FROM owners 
LEFT JOIN animals  ON owners.id = animals.owner_id;


SELECT species.name, COUNT(*) AS ani_count
FROM species 
JOIN animals  ON species.id = animals.species_id
GROUP BY species.name;


SELECT a.name
FROM animals a
JOIN owners ON a.owner_id = owners.id
JOIN species ON a.species_id =species.id
WHERE owners.full_name = 'Jennifer Onwell' AND species.name = 'Digimon';

SELECT animals.name
FROM animals 
JOIN owners ON animals.owner_id = owners.id
JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts =0;


SELECT owners.full_name, COUNT(*) AS ani_count
FROM owners
JOIN animals  ON animals.owner_id = owners.id
GROUP BY owners.full_name
ORDER BY ani_count DESC
LIMIT 1;



