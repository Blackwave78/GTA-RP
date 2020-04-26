INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_thelostmc','TheLostMC',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_thelostmc','TheLostMC',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_thelostmc', 'TheLostMC', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('thelostmc', 'TheLostMC', 1);

--
-- This is German write your Language by Job_name, name, label
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('thelostmc', 0, 'Rookie', 'Neuling', 1500, '{}', '{}'),
('thelostmc', 1, 'Trooper', 'Mitglied', 1800, '{}', '{}'),           
('thelostmc', 2, 'Recruiter', 'Rekrutierung', 2100, '{}', '{}'), 
('thelostmc', 3, 'Vize-Boss', 'Co-Leader', 2400, '{}', '{}'),
('thelostmc', 4, 'Boss', 'Leader', 2700, '{}', '{}');

CREATE TABLE `fine_types_thelostmc` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types_thelostmc` (label, amount, category) VALUES 
	('Raket',3000,0),
	('Raket',5000,0),
	('Raket',10000,1),
	('Raket',20000,1),
	('Raket',50000,2),
	('Raket',150000,3),
	('Raket',350000,3)
;