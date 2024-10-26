INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Fluffy', '2020-10-15', 'vet', 'antibiotics')

-- First, ensure Hammy exists in petPet
INSERT INTO petPet (petname, owner, species, gender, birth, death) 
VALUES ('Hammy', 'Diane', 'hamster', 'M', '2010-10-30', NULL);

-- Then add Hammy's vet event
INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Hammy', '2020-10-15', 'vet', 'antibiotics');

INSERT INTO petPet (petname, owner, species, gender, birth, death) 
VALUES ('Kitten1', 'Owner_of_Fluffy', 'cat', 'F', NULL, NULL),
       ('Kitten2', 'Owner_of_Fluffy', 'cat', 'F', NULL, NULL),
       ('Kitten3', 'Owner_of_Fluffy', 'cat', 'M', NULL, NULL),
       ('Kitten4', 'Owner_of_Fluffy', 'cat', 'M', NULL, NULL),
       ('Kitten5', 'Owner_of_Fluffy', 'cat', 'F', NULL, NULL);

INSERT INTO petEvent (petname, eventdate, eventtype, remark) 
VALUES ('Claws', '1997-08-03', 'injury', 'broke rib');

UPDATE petPet 
SET death = '2020-09-01' 
WHERE petname = 'Puffball';

DELETE FROM petPet 
WHERE owner = 'Harold' AND species = 'dog';
