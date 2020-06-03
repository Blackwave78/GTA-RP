INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_mineur','mineur', 1)
;
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_mineur','mineur', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_mineur', 'mineur')
;
INSERT INTO `jobs`(`name`, `label`, `whitelisted`) VALUES
	('mineur', 'mineur', 1)
;
INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('mineur',0,'recrue','Intérimaire', 500),
	('mineur',1,'novice','tabac', 750),
	('mineur',2,'cdisenior','Chef déquipe', 1200),
	('mineur',3,'boss','Patron', 1600)
;
INSERT INTO `items` (`name`, `label`) VALUES
	('pierreb', 'pierre'),
	('or','or'),
	('diamon','diamant')
;