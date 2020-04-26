USE `essentialmode`;

INSERT INTO `jobs` (name, label) VALUES
  ('pompiste','Pompiste')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('pompiste',0,'recrue','Etudiant',50,'{}','{}'),
  ('pompiste',1,'experimente','Employé',80,'{}','{}'),
  ('pompiste',2,'chef','Associé',100,'{}','{}'),
  ('pompiste',3,'boss','Patron',150,'{}','{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES
('petrole', 'Petrole', 100, 0, 1),
('essence', 'Essence', 100, 0, 1);


CREATE TABLE IF NOT EXISTS `essence` (
`id` int(11) NOT NULL,
  `montant` varchar(100) NOT NULL DEFAULT '1000'
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

INSERT INTO `essence` (`id`, `montant`) VALUES
(1, '1000'),
(2, '1000'),
(3, '95'),
(4, '10'),
(5, '10'),
(6, '1000'),
(7, '1000'),
(8, '1000'),
(9, '1000'),
(10, '1000'),
(11, '1000'),
(12, '1000'),
(13, '1000'),
(14, '1000'),
(15, '1000'),
(16, '1000'),
(17, '1000'),
(18, '1000'),
(19, '1000'),
(20, '1000'),
(21, '1000'),
(22, '1000'),
(23, '1000'),
(24, '1000'),
(25, '1000'),
(26, '1000'),
(27, '1000'),
(28, '1000'),
(29, '1000'),
(30, '1000'),
(31, '1000');

ALTER TABLE `essence`
 ADD PRIMARY KEY (`id`);
 
ALTER TABLE `essence`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=26;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
 
 

