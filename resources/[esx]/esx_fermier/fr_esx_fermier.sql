INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_ferme','ferme',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ferme','ferme', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_ferme', 'ferme', 1)
;

INSERT INTO `jobs`(`name`, `label`, `whitelisted`) VALUES
	('ferme', 'Ferme', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('ferme', 0, 'recrue', 'Intérimaire', 500, '{}', '{}'),
	('ferme',1,'novice','fermier', 750, '{}', '{}'),
	('ferme',2,'cdisenior','Chef déquipe', 1200, '{}', '{}'),
	('ferme',3,'boss','Patron', 1600, '{}', '{}')
;

INSERT INTO `items` (`name`, `label`) VALUES
	('blé', 'Blé'),
	('farine_blé', 'Farine'),
	('vegetables', 'Légume')
;