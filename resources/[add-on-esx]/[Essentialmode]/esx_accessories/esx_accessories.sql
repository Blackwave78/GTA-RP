USE `essentialmode`;

INSERT INTO `datastore` (name, label, shared) VALUES
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0),
	('user_bags', 'Sac', 0),
	('user_bracelets', 'Bracelets', 0),
	('user_chain', 'Chaine', 0),
	('user_watches', 'Watches', 0)
;

UPDATE `datastore_data` set data = '{}' where name like 'user_%'