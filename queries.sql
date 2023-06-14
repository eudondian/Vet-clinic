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

