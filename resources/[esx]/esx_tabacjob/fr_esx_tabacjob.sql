INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_tabac','tabac',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_tabac','tabac', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_tabac', 'tabac', 1)
;

INSERT INTO `jobs`(`name`, `label`, `whitelisted`) VALUES
	('tabac', 'tabac', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('tabac',0,'recrue','Intérimaire', 500),
	('tabac',1,'novice','tabac', 750),
	('tabac',2,'cdisenior','Chef déquipe', 1200),
	('tabac',3,'boss','Patron', 1600)
;


INSERT INTO `items` (`name`, `label`) VALUES
	('feuilletab', 'Feuille de tabac'),
	('tabacsec', 'Tabac')
;