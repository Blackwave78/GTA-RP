INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_buche','buche',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_buche','buche', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_buche', 'buche', 1)
;

INSERT INTO `jobs`(`name`, `label`, `whitelisted`) VALUES
	('buche', 'buche', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('buche',0,'recrue','Intérimaire', 500),
	('buche',1,'novice','tabac', 750),
	('buche',2,'cdisenior','Chef déquipe', 1200),
	('buche',3,'boss','Patron', 1600)
;


INSERT INTO `items` (`name`, `label`) VALUES
	('wood', 'Bois'),
	('cutted_wood', 'Bois Traiter'),
	('packaged_plank', 'Paquet de planches'
;