/*	
	CSE 385 Midterm Exam
	3.16.2022

	Run this script to create the RunningLog database
*/

USE master;
GO

DROP DATABASE IF EXISTS RunningLog;
GO

CREATE DATABASE RunningLog;
GO

USE RunningLog;
GO

--============================== Tables
CREATE TABLE WorkoutTypes (
	workoutTypeId			int				not null	primary key		identity,
	[description]			varchar(100)	not null,
	sortOrder				int				not null	default(1000)
); 
GO

CREATE TABLE TimeOfDay (
	timeOfDayId				int				not null	primary key		identity,
	[description]			varchar(100)	not null,
	sortOrder				int				not null	default(100)
); 
GO

CREATE TABLE ShoeBrands (
	shoeBrandId		int				not null	primary key		identity,
	[description]	varchar(100)	not null,
	sortOrder		int				not null	default(500),
	isDeleted		bit				not null	default(0)
); 
GO

CREATE TABLE Users (
	userId			int		not null	primary key		identity,
	email			varchar(100)	not null,
	password		varchar(20)		not null,
	encryptedPW		varbinary(64)	null,
	userName		varchar(100)	not null,
	firstName		varchar(50)		not null,
	lastName		varchar(50)		not null,
	gender			char(1)			not null,
	usesMetric		bit				not null	default(0),
	goodLoginCount	int				not null	default(0),
	badLoginCount	int				not null	default(0),
	isDeleted		bit				not null	default(0)
); 
GO

CREATE TABLE Shoes (
	shoeId		int				not null	primary key		identity,
	userId		int				not null	foreign key	references Users(userId),
	shoeBrandId	int				not null	foreign key	references ShoeBrands(shoeBrandId),
	model		varchar(100)	not null	default(''),
	totalMiles	int				not null	default(0),
	isDeleted	bit				not null	default(0)
); 
GO

CREATE TABLE Workouts (
	workoutId		int				not null	primary key		identity,
	userId			int				not null	foreign key		references Users(userId),
	workoutTypeId	int				not null	foreign key		references WorkoutTypes(workoutTypeId),
	timeOfDayId		int				not null,
	shoeId			int				null		foreign key		references Shoes(shoeId),
	workoutDate		datetime		not null,
	totalMiles		float			not null	default(0),
	totalSeconds	int				not null	default(0),
	comments		varchar(MAX)	not null	default('')
); 
GO

/*-------------------------------------------------------------------------------- 
									SHOE BRANDS
  --------------------------------------------------------------------------------*/
INSERT INTO ShoeBrands (description) VALUES
	 ('Adidas'),('Asics'),('Avia'),('Brooks'),('Diadora')
	,('Etonic'),('Fila'),('Mizuno'),('Montrail')
	,('New Balance'),('Nike'),('Pearl Izimi'),('Puma')
	,('Reebok'),('Ryka'),('Saucony'),('WalMart')
	,('Other'),('Merrell'),('Loco'),('Newton')
	,('Salomon'),('Spira'),('North Face'),('Bite')
	,('Ecco'),('Fusion'),('Inov8'),('K-Swiss')
	,('Kalenji'),('Karhu'),('Keen'),('Patagonia')
	,('Payless'),('Riddell'),('Under Armour'),('Vasque')
	,('Vibram'),('Vitruvian'),('Wilson'),('Skora')
	,('Hoka'),('Skechers'),('Altra')
INSERT INTO ShoeBrands(description, sortOrder) VALUES ('None',0)

/*-------------------------------------------------------------------------------- 
									TIME OF DAY 
  --------------------------------------------------------------------------------*/
INSERT INTO TimeOfDay ([description],sortOrder) VALUES
	 ('Morning',	2)
	,('Afternoon',	1)
	,('Evening',	3)
	,('None (off)',	6)
	,('Night',  	4)

/*-------------------------------------------------------------------------------- 
									USERS 
  --------------------------------------------------------------------------------*/
INSERT INTO Users (email, [password], userName, firstName, lastName, gender, usesMetric, goodLoginCount, badLoginCount, isDeleted) values 
	 ('tgoggan0@woothemes.com','8wZKebfRp', 'tgoggan0', 'Thebault', 'Goggan', 'M',0,476,16, 0)
	,('talfonsini1@vk.com', 'gGu3HDop0a3f', 'talfonsini1', 'Terrel', 'Alfonsini', 'M',1,943,3, 0)
	,('sizakson2@nps.gov', '0tibW8ahjiYr', 'sizakson2', 'Shelia', 'Izakson', 'F',1,4,17, 0)
	,('hhuriche3@spiegel.de', 'eygvJzmbzM', 'hhuriche3', 'Hildegarde', 'Huriche', 'F',1,448,16, 0)
	,('callder4@github.io', 'QM0V6oa', 'callder4', 'Clemmy', 'Allder', 'F',0,380,20, 0)
	,('ggowthorpe5@businessinsider.com', 'm8B70lS', 'ggowthorpe5', 'Gregoire', 'Gowthorpe', 'M',1,551,14, 0)
	,('dwretham6@twitter.com', 'fXQGl1uLD', 'dwretham6', 'Donnie', 'Wretham', 'M',1,782,16, 0)
	,('destick7@altervista.org', '9HSIFmoZBmx', 'destick7', 'Darin', 'Estick', 'M',1,521,1, 0)
	,('anotman8@ning.com', 'zVN2KUzTYYA', 'anotman8', 'Andriette', 'Notman', 'F',0,696,4, 0)
	,('cjeduch9@amazon.de', '4JvHLX6', 'cjeduch9', 'Corney', 'Jeduch', 'M',1,935,1, 0)
	,('ghaseleya@businessweek.com', 'CJ55cR', 'ghaseleya', 'Gelya', 'Haseley', 'F',0,227,15, 0)
	,('krobbieb@blinklist.com', 'hIEcqc', 'krobbieb', 'Katti', 'Robbie', 'F',0,932,9, 0)
	,('eovertonc@drupal.org', 'nSjT3BONi7J', 'eovertonc', 'Esme', 'Overton', 'F',0,685,11, 0)
	,('kbraunleind@msu.edu', 'roTjah', 'kbraunleind', 'Kiel', 'Braunlein', 'M',1,535,1, 0)
	,('aieldene@netscape.com', '5NXzFHan9m', 'aieldene', 'Annie', 'Ielden', 'F',0,681,17, 0)
	,('mchantreef@blinklist.com', 'vgmxXfHX', 'mchantreef', 'Morey', 'Chantree', 'M',1,430,16, 0)
	,('ewhottong@archive.org', 'Eb1txKhyjB2X', 'ewhottong', 'Earvin', 'Whotton', 'M',0,919,8, 0)
	,('tmapowderh@ezinearticles.com', 'Wbks6VkdouEJ', 'tmapowderh', 'Tillie', 'Mapowder', 'F',1,264,9, 0)
	,('cwagoni@wikispaces.com', '5SEZpZZb', 'cwagoni', 'Charley', 'Wagon', 'M',1,146,17, 0)
	,('eheislerj@canalblog.com', 'XGZxMDFNA2VA', 'eheislerj', 'Eilis', 'Heisler', 'F',0,219,16, 0)
	,('mgynnik@chicagotribune.com', 'dPpaVyBICH', 'mgynnik', 'Malchy', 'Gynni', 'M',0,588,11, 0)
	,('chorderl@tinyurl.com', 'Zy6f8uJR', 'chorderl', 'Christy', 'Horder', 'M',1,382,16, 0)
	,('okleinhandlerm@wikispaces.com', 'VJtDpGUzeY', 'okleinhandlerm', 'Obediah', 'Kleinhandler', 'M',0,394,13, 0)
	,('ahenriquen@networkadvertising.org', 'ldGMHYp', 'ahenriquen', 'Augie', 'Henrique', 'M',1,969,0, 0)
	,('gjuzao@oracle.com', 'YxfjytaC', 'gjuzao', 'Gibb', 'Juza', 'M',0,225,4, 0)
	,('scurrellp@berkeley.edu', 'NqJbjpRLOMls', 'scurrellp', 'Selle', 'Currell', 'F',1,666,17, 0)
	,('nsalleq@odnoklassniki.ru', 'cbOAtFwJ1v', 'nsalleq', 'Niko', 'Salle', 'M',0,827,0, 0)
	,('mnieassr@shutterfly.com', 'CmFUvYXhGM', 'mnieassr', 'Mohandas', 'Nieass', 'M',0,355,11, 0)
	,('wshaws@nytimes.com', 'RjgR0ULpfm7', 'wshaws', 'Willi', 'Shaw', 'M',1,752,16, 0)
	,('bkalderont@ucsd.edu', 'qdiCdjuz3rC', 'bkalderont', 'Batsheva', 'Kalderon', 'F',1,649,6, 0)
	,('lhanu@is.gd', 'eRDgknb4', 'lhanu', 'Lorri', 'Han', 'F',1,638,16, 0)
	,('ishoardv@google.com.hk', '4PiXMKAnCSgR', 'ishoardv', 'Iseabal', 'Shoard', 'F',1,970,14, 0)
	,('hrentelllw@quantcast.com', 'IF9jGe', 'hrentelllw', 'Horton', 'Rentelll', 'M',0,11,5, 0)
	,('hfinnesx@nymag.com', '1TDLmWuPC', 'hfinnesx', 'Hernando', 'Finnes', 'M',0,817,15, 0)
	,('bcoppledikey@dell.com', '078jNeVisC', 'bcoppledikey', 'Benedick', 'Coppledike', 'M',0,404,0, 0)
	,('bmcreynoldz@chicagotribune.com', '0z6GgchIz', 'bmcreynoldz', 'Benedicta', 'McReynold', 'F',1,88,7, 0)
	,('miban10@oracle.com', 'AEDQZWEfANrs', 'miban10', 'Maire', 'Iban', 'F',1,829,19, 0)
	,('dhenningham11@icio.us', 'PXV3HwO0LPek', 'dhenningham11', 'Deck', 'Henningham', 'M',1,26,19, 0)
	,('gstanman12@wired.com', 'MYv2tOnz', 'gstanman12', 'Gwenneth', 'Stanman', 'F',0,181,14, 0)
	,('lwordington13@dot.gov', 'kQBxZ94y', 'lwordington13', 'Lexie', 'Wordington', 'F',1,209,2, 0)
	,('nmaffy14@arizona.edu', '0wPj48jT07wy', 'nmaffy14', 'Nial', 'Maffy', 'M',1,545,16, 0)
	,('ccutajar15@g.co', 'WZ35DFM', 'ccutajar15', 'Charlean', 'Cutajar', 'F',0,318,15, 0)
	,('dgodmer16@apache.org', '0laynq', 'dgodmer16', 'Dyanne', 'Godmer', 'F',1,374,6, 0)
	,('aocoskerry17@icq.com', 'vRcXWVdlKs', 'aocoskerry17', 'Annamaria', 'O''Coskerry', 'F',0,732,4, 0)
	,('lcurrall18@nationalgeographic.com', 'cYcfjO9', 'lcurrall18', 'Lannie', 'Currall', 'M',0,445,18, 0)
	,('ddagworthy19@ucsd.edu', 'JtQWU0', 'ddagworthy19', 'Davidson', 'Dagworthy', 'M',1,911,9, 0)
	,('vmullan1a@chronoengine.com', 'vo00S3JOrme', 'vmullan1a', 'Valencia', 'Mullan', 'F',0,48,19, 0)
	,('mkeggins1b@1und1.de', 'xtjRwsSSefi', 'mkeggins1b', 'Mickey', 'Keggins', 'M',1,336,8, 0)
	,('cfordyce1c@spiegel.de', 'NfEaGy4hMzfA', 'cfordyce1c', 'Carlin', 'Fordyce', 'M',1,917,11, 0)
	,('lfeavearyear1d@china.com.cn', 'Sjuwj7Pn8', 'lfeavearyear1d', 'Lily', 'Feavearyear', 'F',0,583,14, 0)
	,('gdepport1e@bravesites.com', '7oULJpL11q', 'gdepport1e', 'Giselle', 'Depport', 'F',1,133,0, 0)
	,('mpopworth1f@sourceforge.net', 'afmJxk3', 'mpopworth1f', 'Manolo', 'Popworth', 'M',1,802,1, 0)
	,('jroyste1g@w3.org', 'T4wKaRs', 'jroyste1g', 'Jens', 'Royste', 'M',0,757,17, 0)
	,('ngoult1h@i2i.jp', 'IxsREq', 'ngoult1h', 'Nickolaus', 'Goult', 'M',0,918,15, 0)
	,('fslaght1i@ftc.gov', 'qiOTOl', 'fslaght1i', 'Fernando', 'Slaght', 'M',1,539,6, 0)
	,('cshackel1j@last.fm', 'wtIDhu', 'cshackel1j', 'Corbett', 'Shackel', 'M',0,165,12, 0)
	,('vbowick1k@loc.gov', 'GuUBkkunLs', 'vbowick1k', 'Virge', 'Bowick', 'M',1,45,9, 0)
	,('fdwight1l@nasa.gov', 'TmeMkGysa', 'fdwight1l', 'Fonzie', 'Dwight', 'M',0,436,15, 0)
	,('rletertre1m@woothemes.com', 'HKhYMCpKO3M', 'rletertre1m', 'Ritchie', 'Letertre', 'M',0,439,2, 0)
	,('kkitchingman1n@furl.net', 'DGZYyCSO', 'kkitchingman1n', 'Kelci', 'Kitchingman', 'F',1,707,12, 0)
	,('cgonzales1o@tripadvisor.com', 'IAWrs7t0TLms', 'cgonzales1o', 'Case', 'Gonzales', 'M',1,181,2, 0)
	,('tweatherdon1p@t-online.de', '8n85ZQ1GuQk', 'tweatherdon1p', 'Thaine', 'Weatherdon', 'M',0,588,0, 0)
	,('edalgleish1q@linkedin.com', 'V3cSb0fCyZkm', 'edalgleish1q', 'Effie', 'Dalgleish', 'F',1,850,3, 0)
	,('acrowch1r@skype.com', 'JZ8Cqux', 'acrowch1r', 'Amby', 'Crowch', 'M',1,482,3, 0)
	,('efewless1s@github.com', '8Rd2I8d', 'efewless1s', 'Elizabeth', 'Fewless', 'F',0,902,8, 0)
	,('eblois1t@samsung.com', 'aR33D1wXuP', 'eblois1t', 'Edvard', 'Blois', 'M',0,730,11, 0)
	,('dwaadenburg1u@sciencedirect.com', 'R7Jht9vI', 'dwaadenburg1u', 'Demetria', 'Waadenburg', 'F',1,686,1, 0)
	,('caltham1v@free.fr', 'BEwlM8FHFwYH', 'caltham1v', 'Cece', 'Altham', 'M',1,639,4, 0)
	,('rdeners1w@meetup.com', '9s6yHDmXMx', 'rdeners1w', 'Rip', 'Deners', 'M',0,288,2, 0)
	,('tpyner1x@icq.com', '0gqBZftk9ncY', 'tpyner1x', 'Trula', 'Pyner', 'F',0,94,13, 0)
	,('nmacavaddy1y@statcounter.com', 'h1OMD2', 'nmacavaddy1y', 'Nat', 'MacAvaddy', 'M',1,845,17, 0)
	,('cdewbury1z@springer.com', 'o84rYjL', 'cdewbury1z', 'Carine', 'Dewbury', 'F',0,450,11, 0)
	,('eshevlane20@nature.com', 'rcu7bigbAogu', 'eshevlane20', 'Edyth', 'Shevlane', 'F',0,659,19, 0)
	,('anuttall21@wisc.edu', 'Z67zMEJAZrW', 'anuttall21', 'Agretha', 'Nuttall', 'F',0,99,12, 0)
	,('xsymms22@ed.gov', 'KMgKCTIJic', 'xsymms22', 'Ximenez', 'Symms', 'M',1,101,3, 0)
	,('jvanyushin23@usnews.com', 'xRt1wUNbRq', 'jvanyushin23', 'Justinn', 'Vanyushin', 'F',0,799,15, 0)
	,('ileworthy24@php.net', 'A1945u', 'ileworthy24', 'Igor', 'Leworthy', 'M',0,979,2, 0)
	,('tortega25@house.gov', 'ajI7gGpPzB7k', 'tortega25', 'Torry', 'Ortega', 'M',0,736,14, 0)
	,('cabson26@washingtonpost.com', 'wjAkhm', 'cabson26', 'Cullan', 'Abson', 'M',1,337,13, 0)
	,('lbeedon27@nsw.gov.au', 'QEhzjNdWhv28', 'lbeedon27', 'Lauren', 'Beedon', 'M',0,908,10, 0)
	,('thellens28@msn.com', 'CzQtTtloZ', 'thellens28', 'Thane', 'Hellens', 'M',1,668,8, 0)
	,('dstanton29@discovery.com', '8iQjPWD89', 'dstanton29', 'Denise', 'Stanton', 'F',0,225,17, 0)
	,('hskingley2a@oracle.com', 'AUqiVHkQ4ZWE', 'hskingley2a', 'Haleigh', 'Skingley', 'M',1,749,14, 0)
	,('ccamelli2b@edublogs.org', 'H5pCJcRs7w', 'ccamelli2b', 'Celinka', 'Camelli', 'F',0,896,0, 0)
	,('rmcgoldrick2c@google.pl', 'taWjshNRJkxj', 'rmcgoldrick2c', 'Reynold', 'McGoldrick', 'M',1,649,15, 0)
	,('twinsborrow2d@nytimes.com', '0s8UcqlsoO', 'twinsborrow2d', 'Tiebold', 'Winsborrow', 'M',0,149,17, 0)
	,('bandrejevic2e@soup.io', 'nIh4GL01', 'bandrejevic2e', 'Britney', 'Andrejevic', 'F',1,308,7, 0)
	,('sdungay2f@phpbb.com', '8TI3ln', 'sdungay2f', 'Seth', 'Dungay', 'M',0,828,12, 0)
	,('awederell2g@answers.com', 'yK3fQN2vvm', 'awederell2g', 'Akim', 'Wederell', 'M',0,361,10, 0)
	,('aessery2h@ucoz.ru', '2a1H8xPM8', 'aessery2h', 'Aldous', 'Essery', 'M',1,525,19, 0)
	,('fburr2i@japanpost.jp', 'M8YZpWPzJA15', 'fburr2i', 'Freddy', 'Burr', 'M',0,17,4, 0)
	,('ahendrick2j@huffingtonpost.com', 'vewQMLrNgg', 'ahendrick2j', 'Alameda', 'Hendrick', 'F',1,905,2, 0)
	,('rgaven2k@homestead.com', 'W9uJjJ4', 'rgaven2k', 'Ruby', 'Gaven', 'F',1,478,14, 0)
	,('ocayle2l@marriott.com', 'xUYQJalZKB', 'ocayle2l', 'Ozzy', 'Cayle', 'M',0,9,10, 0)
	,('dskyrm2m@whitehouse.gov', 'h1NmdIrXpb', 'dskyrm2m', 'Devonna', 'Skyrm', 'F',0,170,11, 0)
	,('tsmees2n@unicef.org', 'cCcvFuw2oJr', 'tsmees2n', 'Tessy', 'Smees', 'F',0,80,8, 0)
	,('sdurtnel2o@nifty.com', 'hMbAO8mBoa', 'sdurtnel2o', 'Skye', 'Durtnel', 'M',0,921,6000, 0)
	,('pdeatta2p@nhs.uk', 'zsEjgFUygp', 'pdeatta2p', 'Portia', 'De Atta', 'F',0,974,13, 0)
	,('aabramamov2q@github.com', 'drH7GZ7ModP', 'aabramamov2q', 'Abdel', 'Abramamov', 'M',0,562,18, 0)
	,('redden2r@fda.gov', 'e7M140', 'redden2r', 'Raleigh', 'Edden', 'M',1,456,4, 0)
	,('tdearlove2s@webs.com', 'H7t2mkcouK8', 'tdearlove2s', 'Talbot', 'Dearlove', 'M',1,660,1, 0)
	,('cpretorius2t@tinypic.com', 'aqJCuH', 'cpretorius2t', 'Corina', 'Pretorius', 'F',1,187,1000, 0)
	,('tchadbourne2u@tripadvisor.com', 'pxKPGATsof', 'tchadbourne2u', 'Thorstein', 'Chadbourne', 'M',0,718,4, 0)
	,('scapel2v@nymag.com', 'cvqmmMUBFNR9', 'scapel2v', 'Saree', 'Capel', 'F',0,112,3, 0)
	,('agoney2w@topsy.com', 'pPhwuY', 'agoney2w', 'Ardelia', 'Goney', 'F',1,752,14, 0)
	,('fclotworthy2x@creativecommons.org', '8I9zKGM4RTd', 'fclotworthy2x', 'Felike', 'Clotworthy', 'M',1,400,8, 0)
	,('barrighi2y@reddit.com', 'EclV2PU', 'barrighi2y', 'Berri', 'Arrighi', 'F',1,295,16, 0)
	,('hfullbrook2z@amazon.co.jp', 'bT6EQshbv', 'hfullbrook2z', 'Hilliary', 'Fullbrook', 'F',0,179,3, 0)
	,('ghodge30@furl.net', 'InUmyb', 'ghodge30', 'Gloriane', 'Hodge', 'F',1,564,0, 0)
	,('roheaney31@dmoz.org', 'x8678B', 'roheaney31', 'Rip', 'O''Heaney', 'M',1,767,4, 0)
	,('lpfeffer32@typepad.com', 'YV7E80rk', 'lpfeffer32', 'Lewie', 'Pfeffer', 'M',1,884,7, 0)
	,('cstainer33@columbia.edu', 'wKWSBOtuaYJB', 'cstainer33', 'Chelsie', 'Stainer', 'F',1,801,10, 0)
	,('tmanna34@ibm.com', '636iKHaU', 'tmanna34', 'Travus', 'Manna', 'M',1,972,13, 0)
	,('hbudgett35@multiply.com', 'tKstQB70', 'hbudgett35', 'Hinda', 'Budgett', 'F',1,59,7, 0)
	,('eerrowe36@webnode.com', 'kLmjn6yMRt', 'eerrowe36', 'Ellynn', 'Errowe', 'F',1,340,2, 0)
	,('wdrover37@disqus.com', 'mBVPZ26', 'wdrover37', 'Wilton', 'Drover', 'M',1,909,0, 0)
	,('lcaudray38@mayoclinic.com', 'f0zJH3Kp9j', 'lcaudray38', 'Lenard', 'Caudray', 'M',1,225,2, 0)
	,('rlacoste39@washingtonpost.com', 'kMjYCSP', 'rlacoste39', 'Reece', 'Lacoste', 'M',1,907,16, 0)
	,('msmee3a@nba.com', 'x90sjMzCQiy', 'msmee3a', 'Myles', 'Smee', 'M',1,836,14, 0)
	,('gmcphillimey3b@creativecommons.org', 'FvzMbRIyf', 'gmcphillimey3b', 'Godiva', 'McPhillimey', 'F',0,193,14, 0)
	,('cmartygin3c@dmoz.org', 'ov4y3TXDe9yx', 'cmartygin3c', 'Chandra', 'Martygin', 'F',0,505,18, 0)
	,('rkeeffe3d@google.ca', 'KZBfScvqDhQW', 'rkeeffe3d', 'Rudolf', 'Keeffe', 'M',1,130,16, 0)
	,('sthorpe3e@bing.com', 'K49mkS', 'sthorpe3e', 'Shannah', 'Thorpe', 'F',0,724,13, 0)
	,('dchupin3f@nifty.com', 'eQLE27c', 'dchupin3f', 'Dianne', 'Chupin', 'F',1,982,10, 0)
	,('cguise3g@guardian.co.uk', 'd455Jc5aT5', 'cguise3g', 'Carmel', 'Guise', 'F',1,913,3, 0)
	,('ndashwood3h@salon.com', '8J7GPtAAL', 'ndashwood3h', 'Norri', 'Dashwood', 'F',1,856,16, 0)
	,('nkonerding3i@wix.com', 'wq58ubD', 'nkonerding3i', 'Norton', 'Konerding', 'M',1,239,9, 0)
	,('ccopestake3j@microsoft.com', 'o2zDKo853', 'ccopestake3j', 'Constantin', 'Copestake', 'M',1,746,14, 0)
	,('gbleier3k@deliciousdays.com', 'um4duy', 'gbleier3k', 'Glendon', 'Bleier', 'M',0,116,5, 0)
	,('gabercrombie3l@newyorker.com', '3WQhzDiy', 'gabercrombie3l', 'Granny', 'Abercrombie', 'M',1,961,1, 0)
	,('sewan3m@purevolume.com', 'hZkp458fe', 'sewan3m', 'Stanford', 'Ewan', 'M',0,12,14, 0)
	,('pdittson3n@behance.net', 'p2foJoZfcZJo', 'pdittson3n', 'Pyotr', 'Dittson', 'M',1,925,7, 0)
	,('fcargen3o@un.org', 'EhuVCI2o', 'fcargen3o', 'Felic', 'Cargen', 'M',0,227,20000, 0)
	,('kdenidge3p@slideshare.net', 'bhKj3ngXa', 'kdenidge3p', 'Kippy', 'Denidge', 'M',1,737,11, 0)
	,('bgalliver3q@blog.com', 'kGZbx3a', 'bgalliver3q', 'Brendis', 'Galliver', 'M',0,308,13, 0)
	,('mwyburn3r@smugmug.com', 'B82YfQLg9H', 'mwyburn3r', 'Mavra', 'Wyburn', 'F',1,701,2, 0)
	,('aruoss3s@zimbio.com', 'iDJeEfC', 'aruoss3s', 'Anders', 'Ruoss', 'M',1,253,15, 0)
	,('ejankin3t@dot.gov', 'zv78VE', 'ejankin3t', 'Elise', 'Jankin', 'F',0,886,16, 0)
	,('jlaight3u@accuweather.com', 'Od1yOEOwvz', 'jlaight3u', 'Jean', 'Laight', 'M',0,110,14, 0)
	,('ccopley3v@dedecms.com', 'bQFy4KOD9', 'ccopley3v', 'Cleve', 'Copley', 'M',0,664,7, 0)
	,('hbeevors3w@senate.gov', 'TLaXzZi3', 'hbeevors3w', 'Heinrick', 'Beevors', 'M',0,769,19, 0)
	,('gshillingford3x@free.fr', 'poa0bOw', 'gshillingford3x', 'Gibby', 'Shillingford', 'M',0,293,19, 0)
	,('mlucio3y@bloglovin.com', 'CZpxygLzr', 'mlucio3y', 'Madalena', 'Lucio', 'F',0,319,16, 0)
	,('cmebius3z@comsenz.com', 'E1DTrJ4lex', 'cmebius3z', 'Corney', 'Mebius', 'M',1,367,14, 0)
	,('nbrauner40@simplemachines.org', 'sA1H5ad', 'nbrauner40', 'Nicolis', 'Brauner', 'M',1,131,6, 0)
	,('bupcraft41@themeforest.net', 'Qau6LC8U2VH', 'bupcraft41', 'Berny', 'Upcraft', 'M',1,944,14, 0)
	,('ppeotz42@shop-pro.jp', 'vNtI00Hpl', 'ppeotz42', 'Padraic', 'Peotz', 'M',0,534,0, 0)
	,('cbungey43@ucoz.ru', 'nU8d010sIy4', 'cbungey43', 'Cully', 'Bungey', 'M',1,840,16, 0)
	,('azumbusch44@scientificamerican.com', 'rQlNm0dK8Xkv', 'azumbusch44', 'Anet', 'Zumbusch', 'F',1,563,7, 0)
	,('ehedge45@latimes.com', 'ZuDgaqm', 'ehedge45', 'Evelin', 'Hedge', 'M',1,605,13, 0)
	,('jconnock46@privacy.gov.au', 'EEzwdpVOS', 'jconnock46', 'Joni', 'Connock', 'F',0,367,13, 0)
	,('mnorville47@ucla.edu', 'r3JeQmZUZ', 'mnorville47', 'Matthieu', 'Norville', 'M',1,40,17, 0)
	,('adargie48@vkontakte.ru', 'KZUeK5', 'adargie48', 'Ariadne', 'Dargie', 'F',0,698,20, 0)
	,('hmannock49@kickstarter.com', 'YcUHmSIPbVWC', 'hmannock49', 'Hilarius', 'Mannock', 'M',0,445,2, 0)
	,('aick4a@tripod.com', 'cCsHnPCYX', 'aick4a', 'Annnora', 'Ick', 'F',0,779,15, 0)
	,('pmccerery4b@umn.edu', 'uHefVV8c', 'pmccerery4b', 'Patti', 'McCerery', 'F',0,529,6, 0)
	,('lhandforth4c@1und1.de', 's5NLCB', 'lhandforth4c', 'Lucho', 'Handforth', 'M',0,800,15, 0)
	,('mcomerford4d@naver.com', 'Y1C0su', 'mcomerford4d', 'Mavra', 'Comerford', 'F',1,342,1, 0)
	,('vmyall4e@wisc.edu', 'lnNm5F', 'vmyall4e', 'Vincents', 'Myall', 'M',0,147,18, 0)
	,('pgarvey4f@hubpages.com', 'o9AKkHrq', 'pgarvey4f', 'Pippa', 'Garvey', 'F',1,583,18, 0)
	,('smarrion4g@jugem.jp', 'fy5X0oZM2', 'smarrion4g', 'Shir', 'Marrion', 'F',1,195,6, 0)
	,('sgostage4h@wunderground.com', 'ehPeMPJ4o', 'sgostage4h', 'Simone', 'Gostage', 'F',0,678,16, 0)
	,('ahebblewaite4i@columbia.edu', 'vaRgAwher', 'ahebblewaite4i', 'Annabal', 'Hebblewaite', 'F',0,948,4, 0)
	,('dkrates4j@foxnews.com', 'TeksU9rM', 'dkrates4j', 'Dyna', 'Krates', 'F',1,287,4, 0)
	,('dgladebeck4k@ehow.com', 'hC9pkj05', 'dgladebeck4k', 'Doe', 'Gladebeck', 'F',0,776,16, 0)
	,('cbrownsea4l@vistaprint.com', 'ml4zRSD4Xf', 'cbrownsea4l', 'Cynthea', 'Brownsea', 'F',1,371,14, 0)
	,('ngunner4m@drupal.org', 'APnpZqkFot', 'ngunner4m', 'Nestor', 'Gunner', 'M',0,876,10, 0)
	,('twimbury4n@jalbum.net', 'g0FbvxUNNr', 'twimbury4n', 'Trudey', 'Wimbury', 'F',0,840,20, 0)
	,('jkenwrick4o@army.mil', 'rnjXh1O1FJHL', 'jkenwrick4o', 'Jock', 'Kenwrick', 'M',1,400,1, 0)
	,('mboissier4p@webeden.co.uk', 'bpruOl5LIlgi', 'mboissier4p', 'Monah', 'Boissier', 'F',0,338,3, 0)
	,('ccarruthers4q@meetup.com', 'E01v1pLq3z', 'ccarruthers4q', 'Chaunce', 'Carruthers', 'M',0,130,13, 0)
	,('mtillerton4r@netvibes.com', '6hBhlX1bMmN', 'mtillerton4r', 'Martino', 'Tillerton', 'M',0,19,1, 0)
	,('omourton4s@amazon.co.uk', '8Y72WSE', 'omourton4s', 'Ortensia', 'Mourton', 'F',1,898,14, 0)
	,('ecroome4t@about.com', 'nCu69lg3W', 'ecroome4t', 'Elbert', 'Croome', 'M',0,985,15, 0)
	,('acrier4u@exblog.jp', 'hIeSEDn', 'acrier4u', 'Artemas', 'Crier', 'M',1,937,18, 0)
	,('jcarrell4v@columbia.edu', 'C7coec8PM6S', 'jcarrell4v', 'Jaynell', 'Carrell', 'F',0,731,13, 0)
	,('rmajury4w@canalblog.com', 'oliyj2OKJ', 'rmajury4w', 'Rustie', 'Majury', 'M',1,746,9, 0)
	,('khuot4x@posterous.com', '0mUhOALGcJgR', 'khuot4x', 'Korella', 'Huot', 'F',0,688,14, 0)
	,('rmaharey4y@hc360.com', 'EQiqwgnLE', 'rmaharey4y', 'Ron', 'Maharey', 'M',0,790,9, 0)
	,('ebradman4z@scientificamerican.com', 'ArM3FUj0msC', 'ebradman4z', 'Eric', 'Bradman', 'M',0,71,6, 0)
	,('ebernardoni50@biblegateway.com', '2ZkQXWwz0H3', 'ebernardoni50', 'Elliott', 'Bernardoni', 'M',1,568,11, 0)
	,('ldowda51@biglobe.ne.jp', 'fakuRk7inAVQ', 'ldowda51', 'Lowrance', 'Dowda', 'M',1,285,19, 0)
	,('oscyone52@example.com', '5ZC2ZH', 'oscyone52', 'Osmund', 'Scyone', 'M',0,621,5, 0)
	,('gmatusson53@bbc.co.uk', 'xk874Yd', 'gmatusson53', 'Genevieve', 'Matusson', 'F',1,424,10, 0)
	,('asummerhayes54@fema.gov', '5ZPPLm3fjw7d', 'asummerhayes54', 'Annie', 'Summerhayes', 'F',0,614,11, 0)
	,('amarkushkin55@jigsy.com', 'OgtTCoy', 'amarkushkin55', 'Alan', 'Markushkin', 'M',0,540,2, 0)
	,('jhearfield56@tripod.com', 'igsX1BoQWK', 'jhearfield56', 'Jorrie', 'Hearfield', 'F',0,407,16, 0)
	,('aphettiplace57@webnode.com', 'Jrr51pWHfUlb', 'aphettiplace57', 'Aleen', 'Phettiplace', 'F',0,496,6, 0)
	,('qbool58@barnesandnoble.com', 'EJHKOhLgS9xn', 'qbool58', 'Quinn', 'Bool', 'F',1,119,6, 0)
	,('rmcelvogue59@hao123.com', 'biOYzTvhO', 'rmcelvogue59', 'Regan', 'McElvogue', 'F',0,839,1, 1)
	,('dricca5a@xing.com', 'ouFidG3N26', 'dricca5a', 'Denyse', 'Ricca', 'F',0,616,18, 0)
	,('imulbry5b@spiegel.de', 'ONUIv8InOu', 'imulbry5b', 'Isadora', 'Mulbry', 'F',0,30,7, 0)
	,('dbertie5c@discuz.net', 'mIGbkK5', 'dbertie5c', 'Dimitri', 'Bertie', 'M',1,507,12, 0)
	,('wseamarke5d@instagram.com', 'Cg6hdnVtif9', 'wseamarke5d', 'Wylma', 'Seamarke', 'F',0,517,4, 0)
	,('smckerley5e@engadget.com', 'BxYF7q', 'smckerley5e', 'Sidonia', 'McKerley', 'F',0,969,1, 0)
	,('cglencrosche5f@devhub.com', 'IDIDtPc', 'cglencrosche5f', 'Caz', 'Glencrosche', 'M',0,971,5, 0)
	,('aspelman5g@theguardian.com', 'Uq0rzwdy9e', 'aspelman5g', 'Alaine', 'Spelman', 'F',0,706,7, 0)
	,('bmuglestone5h@mac.com', '5EsdafTm', 'bmuglestone5h', 'Bonnie', 'Muglestone', 'F',0,903,17, 0)
	,('qlampett5i@bigcartel.com', 'cHeOx2c', 'qlampett5i', 'Quinn', 'Lampett', 'M',0,644,8, 0)
	,('hmargrett5j@princeton.edu', 'pNSbxb', 'hmargrett5j', 'Halie', 'Margrett', 'F',0,448,2, 0)
	,('sparlour5k@imageshack.us', 'ylyORk', 'sparlour5k', 'Siffre', 'Parlour', 'M',0,669,7, 0)
	,('sstuehmeyer5l@jiathis.com', 'HGFORu0', 'sstuehmeyer5l', 'Stephan', 'Stuehmeyer', 'M',1,150,13, 0)
	,('sblakden5m@wordpress.com', 'oWo2G0X6', 'sblakden5m', 'Stanislaus', 'Blakden', 'M',1,687,14, 0)
	,('kscadding5n@reference.com', 'cBq3rr3N1i', 'kscadding5n', 'Karlotta', 'Scadding', 'F',0,857,2, 0)
	,('swyett5o@unesco.org', 'tWcu1NUhZbO', 'swyett5o', 'Shell', 'Wyett', 'M',1,794,10, 0)
	,('amalmar5p@merriam-webster.com', 'VePBLw', 'amalmar5p', 'Ariadne', 'Malmar', 'F',0,389,19, 0)
	,('cgalway5q@wp.com', 'UUmDeNT3aIXt', 'cgalway5q', 'Cathyleen', 'Galway', 'F',0,26,16, 0)
	,('tmarler5r@discuz.net', 'ALo4v0keEI', 'tmarler5r', 'Temple', 'Marler', 'M',1,967,11, 0)
	,('cworman5s@tinypic.com', 'hrctNg', 'cworman5s', 'Cassie', 'Worman', 'M',1,27,14, 0)
	,('sreadshaw5t@bbc.co.uk', 'zx5MDwSlvkn', 'sreadshaw5t', 'Shelton', 'Readshaw', 'M',0,144,8, 0)
	,('mmasse5u@techcrunch.com', 'pkPhId1pC', 'mmasse5u', 'Minna', 'Masse', 'F',1,812,14, 0)
	,('eissitt5v@bravesites.com', 'llyLB4hmBP', 'eissitt5v', 'Ernesta', 'Issitt', 'F',0,212,5, 0)
	,('jwickey5w@imageshack.us', 'WrXV19a', 'jwickey5w', 'Jason', 'Wickey', 'M',1,478,5, 0)
	,('reastmond5x@nps.gov', 'Calcwq3Ips5', 'reastmond5x', 'Rozamond', 'Eastmond', 'F',1,600,17, 0)
	,('hmacsween5y@wix.com', 'CFGd3A', 'hmacsween5y', 'Hewett', 'MacSween', 'M',0,228,10, 0)
	,('gcavy5z@oakley.com', 'TB7N28', 'gcavy5z', 'Gavra', 'Cavy', 'F',0,103,14, 0)
	,('cdubarry60@ucoz.ru', 'BTDJWZOKbca', 'cdubarry60', 'Craggy', 'Du Barry', 'M',1,300,18, 0)
	,('gcadogan61@altervista.org', 'UdG6u6xmK9Tv', 'gcadogan61', 'Gaspard', 'Cadogan', 'M',0,726,0, 0)
	,('cgammie62@who.int', 'ahIzXXL', 'cgammie62', 'Curtice', 'Gammie', 'M',1,172,13, 0)
	,('gdallender63@ezinearticles.com', 'BAhSzm', 'gdallender63', 'Guillaume', 'Dallender', 'M',1,328,9, 0)
	,('dmichelmore64@usgs.gov', 'WD09GtOU4', 'dmichelmore64', 'Dagny', 'Michelmore', 'M',0,556,18, 0)
	,('garnley65@stanford.edu', 'kNweZYJf96zI', 'garnley65', 'Gibbie', 'Arnley', 'M',0,469,8, 0)
	,('mvernall66@patch.com', 'RKr5fHH', 'mvernall66', 'Milly', 'Vernall', 'F',0,967,17, 0)
	,('mpothbury67@constantcontact.com', 'UcgaIvEucml', 'mpothbury67', 'Mose', 'Pothbury', 'M',1,54,7, 1)
	,('sewins68@wordpress.com', 'EHMItZRLM', 'sewins68', 'Symon', 'Ewins', 'M',0,909,3, 1)
	,('tbelton69@aboutads.info', '5MjpMF8', 'tbelton69', 'Trevar', 'Belton', 'M',0,827,17, 1)
	,('jcarding6a@fda.gov', 'mDFBUTzE86', 'jcarding6a', 'Jodie', 'Carding', 'M',1,187,5, 0)
	,('jmilan6b@yale.edu', 'X1bKgPIJvgv', 'jmilan6b', 'Johnette', 'Milan', 'F',0,390,17, 0)
	,('edyka6c@google.co.uk', 'S1XefJS', 'edyka6c', 'Eric', 'Dyka', 'M',0,333,50000, 0)
	,('kspender6d@mapy.cz', 'uZnMkMK3n', 'kspender6d', 'Kaitlynn', 'Spender', 'F',0,235,1, 0)
	,('cfagge6e@furl.net', 'kKHpCDlA', 'cfagge6e', 'Claudianus', 'Fagge', 'M',0,411,4, 0)
	,('bleborgne6f@zimbio.com', 'IbxiFcaZg', 'bleborgne6f', 'Bethanne', 'Le Borgne', 'F',1,654,14, 0)
	,('pmccrorie6g@hugedomains.com', 'iKWqYFK', 'pmccrorie6g', 'Piper', 'McCrorie', 'F',1,621,18, 0)
	,('ltalby6h@wikia.com', 'PH946p', 'ltalby6h', 'Loren', 'Talby', 'F',1,806,2, 0)
	,('gniesel6i@imdb.com', 'f9iVHGR', 'gniesel6i', 'Garik', 'Niesel', 'M',1,391,20, 0)
	,('mcrab6j@yellowpages.com', 'LOoqEIQbGlXB', 'mcrab6j', 'Moll', 'Crab', 'F',1,649,7, 0)
	,('isuermeier6k@google.nl', 'IrB8gfezzt', 'isuermeier6k', 'Ilyssa', 'Suermeier', 'F',1,686,20, 0)
	,('fdominguez6l@addthis.com', 'I3kocUZ3', 'fdominguez6l', 'Francisco', 'Dominguez', 'M',1,726,11, 0)
	,('ocanning6m@oracle.com', '8b7GaBb2xefy', 'ocanning6m', 'Otto', 'Canning', 'M',0,850,15, 0)
	,('fmorritt6n@exblog.jp', 'tk7njV', 'fmorritt6n', 'Ferdinande', 'Morritt', 'F',1,509,4, 0)
	,('zbowkett6o@biglobe.ne.jp', 'BBSay4jK2f7s', 'zbowkett6o', 'Zaria', 'Bowkett', 'F',0,887,5, 0)
	,('amenezes6p@zdnet.com', 's0ZOGgJZlhBE', 'amenezes6p', 'Augustus', 'Menezes', 'M',0,111,5, 0)
	,('sjudkins6q@linkedin.com', 'DitXiaVaN', 'sjudkins6q', 'Steffie', 'Judkins', 'F',1,248,20, 0)
	,('sbeamiss6r@businessweek.com', 'hQxL5UtIzCl', 'sbeamiss6r', 'Sasha', 'Beamiss', 'M',1,400,1, 0)
	,('renglish6s@vk.com', 'MoPnvAk', 'renglish6s', 'Ralina', 'English', 'F',0,751,4, 0)
	,('dbonham6t@yolasite.com', 'c8VG6d4BW', 'dbonham6t', 'Dino', 'Bonham', 'M',0,664,15, 0)
	,('sdeangelo6u@zimbio.com', 'mGyae2lIkxK', 'sdeangelo6u', 'Shelden', 'De Angelo', 'M',0,960,2, 0)
	,('wmcgeagh6v@godaddy.com', 'lV4AVpbW', 'wmcgeagh6v', 'Webb', 'McGeagh', 'M',1,275,3, 0)
	,('csheers6w@hexun.com', 'D3CsW4rpnhV', 'csheers6w', 'Cece', 'Sheers', 'M',1,4,13, 0)
	,('wcurrum6x@youku.com', 'G6Brx2VWam1', 'wcurrum6x', 'Webster', 'Currum', 'M',0,787,13, 0)
	,('kyuryshev6y@marriott.com', 'vfVXm2oh', 'kyuryshev6y', 'Kele', 'Yuryshev', 'M',0,415,14, 0)
	,('mtreweela6z@umich.edu', 'ppTmOgNvGA4', 'mtreweela6z', 'Mandi', 'Treweela', 'F',0,313,3, 0)
	,('schettle70@twitter.com', 'Ikpc04HrY0B', 'schettle70', 'Staffard', 'Chettle', 'M',0,930,14, 0)
	,('wimlach71@geocities.com', '2D9OkT', 'wimlach71', 'Wilhelm', 'Imlach', 'M',0,91,18, 0)
	,('ebrood72@adobe.com', 'IeLBWdOs4PK', 'ebrood72', 'Eleanora', 'Brood', 'F',0,244,10, 0)
	,('ichaffin73@springer.com', 'e8qJozT36', 'ichaffin73', 'Ivonne', 'Chaffin', 'F',0,230,2, 0)
	,('ysquibe74@opensource.org', 'kGKhVRwx', 'ysquibe74', 'Yurik', 'Squibe', 'M',1,686,3, 0)
	,('jmaes75@webs.com', 'a44mQo4CCo67', 'jmaes75', 'Jarret', 'Maes', 'M',1,516,8, 0)
	,('osimmings76@baidu.com', '8oIENugGy4Z', 'osimmings76', 'Osgood', 'Simmings', 'M',1,319,3, 0)
	,('bsecretan77@google.it', '4T2txDQo6t', 'bsecretan77', 'Babb', 'Secretan', 'F',1,989,14, 0)
	,('lmowsdill78@npr.org', '1djAM8OP', 'lmowsdill78', 'Lotte', 'Mowsdill', 'F',1,524,13, 0)
	,('abuyers79@youtu.be', 'AmT2kpQm94S', 'abuyers79', 'Alf', 'Buyers', 'M',1,421,5, 0)
	,('ccadogan7a@tripadvisor.com', '3tP6A6fR', 'ccadogan7a', 'Charin', 'Cadogan', 'F',1,554,1, 0)
	,('jokeaveny7b@hexun.com', 'twsA4p5R', 'jokeaveny7b', 'Jerrold', 'O''Keaveny', 'M',0,335,2, 0)
	,('epotten7c@livejournal.com', 'VDU9biJA0P', 'epotten7c', 'Evelyn', 'Potten', 'M',1,958,10, 0)
	,('dlanfere7d@ftc.gov', '4y5TKzW6Dw3P', 'dlanfere7d', 'Delila', 'Lanfere', 'F',0,133,11, 0)
	,('prycraft7e@tmall.com', '9cqSEIjzo', 'prycraft7e', 'Pincus', 'Rycraft', 'M',1,107,2, 0)
	,('dtorrese7f@princeton.edu', 'POMEL8E', 'dtorrese7f', 'Delainey', 'Torrese', 'M',1,57,3, 0)
	,('dbiffin7g@alexa.com', 'Ht6X0MH2', 'dbiffin7g', 'Drusy', 'Biffin', 'F',1,699,3, 0)
	,('clankester7h@narod.ru', 'T4uGG5n', 'clankester7h', 'Cort', 'Lankester', 'M',0,833,18, 0)
	,('chattigan7i@globo.com', '6JlLDH9v', 'chattigan7i', 'Cassey', 'Hattigan', 'F',1,730,10, 0)
	,('rworsalls7j@google.com', 'PbJG1Ff', 'rworsalls7j', 'Ruddy', 'Worsalls', 'M',1,48,19, 0)
	,('lgaymar7k@wikia.com', '1peqTPqDL3S', 'lgaymar7k', 'Leola', 'Gaymar', 'F',0,96,2, 0)
	,('pbarsham7l@tinyurl.com', 'OkUcagabXGbb', 'pbarsham7l', 'Phillipe', 'Barsham', 'M',1,244,11, 0)
	,('bgartshore7m@issuu.com', 'uAwHrRqYPvb', 'bgartshore7m', 'Blithe', 'Gartshore', 'F',0,522,13, 0)
	,('shartell7n@cocolog-nifty.com', '8zMFDgEH', 'shartell7n', 'Spence', 'Hartell', 'M',1,524,13, 0)
	,('gmcvittie7o@imageshack.us', 'Oq72FA9Y', 'gmcvittie7o', 'Gerick', 'McVittie', 'M',0,461,19, 0)
	,('tniesing7p@blog.com', 'aA2rnM', 'tniesing7p', 'Thomasine', 'Niesing', 'F',1,334,15, 0)
	,('llamperti7q@g.co', 'VYQrY5jJ9P', 'llamperti7q', 'Leo', 'Lamperti', 'M',1,513,10, 0)
	,('bhulson7r@yahoo.co.jp', '8axOsa8', 'bhulson7r', 'Bradan', 'Hulson', 'M',0,121,8, 0)
	,('ckrale7s@disqus.com', 'AraBpfYvSZcI', 'ckrale7s', 'Carolyn', 'Krale', 'F',1,178,2, 0)
	,('ceaken7t@bloomberg.com', 'SgIhcrSOJfZ', 'ceaken7t', 'Carilyn', 'Eaken', 'F',0,660,8, 0)
	,('jsalvatore7u@wordpress.org', 'oXZHIVL', 'jsalvatore7u', 'Juli', 'Salvatore', 'F',0,716,17, 0)
	,('rchat7v@jiathis.com', 'GgKH2vQh', 'rchat7v', 'Rosalynd', 'Chat', 'F',0,208,1, 0)
	,('kchavey7w@sakura.ne.jp', 'Uurc1X7vd8lG', 'kchavey7w', 'Keelby', 'Chavey', 'M',1,627,11, 0)
	,('gbrigden7x@drupal.org', 'vzzJ5Sw', 'gbrigden7x', 'Garrard', 'Brigden', 'M',0,908,3, 0)
	,('emckerley7y@google.cn', 'zjxhTF3pPjj', 'emckerley7y', 'Ellerey', 'Mc-Kerley', 'M',0,244,6, 0)
	,('hdurham7z@dropbox.com', 'cmQTbBs', 'hdurham7z', 'Helga', 'Durham', 'F',0,472,2, 0)
	,('mgerrill80@answers.com', 'gn2ukkJgXI', 'mgerrill80', 'Mel', 'Gerrill', 'F',0,142,9, 0)
	,('atayloe81@fema.gov', '7H7DFqq', 'atayloe81', 'Addia', 'Tayloe', 'F',1,469,8, 0)
	,('wbabst82@whitehouse.gov', 'PB4Rm9', 'wbabst82', 'Wallie', 'Babst', 'F',1,227,4, 0)
	,('splease83@hud.gov', 'twu7UiJmdvM4', 'splease83', 'Sallee', 'Please', 'F',1,13,16, 0)
	,('bbeetham84@hhs.gov', 'RN8COP7I3h', 'bbeetham84', 'Burnaby', 'Beetham', 'M',1,842,10, 0)
	,('bcuxon85@mysql.com', 'PEzaxC0K', 'bcuxon85', 'Buddy', 'Cuxon', 'M',0,142,5, 0)
	,('etunnicliffe86@chronoengine.com', 'q0BNG3x62', 'etunnicliffe86', 'Emili', 'Tunnicliffe', 'F',0,560,11, 0)
	,('sdayes87@slashdot.org', 'uVUhEUmhOQYp', 'sdayes87', 'Simmonds', 'Dayes', 'M',1,502,2, 0)
	,('ztumber88@redcross.org', 'GQTa4KR', 'ztumber88', 'Zorah', 'Tumber', 'F',0,134,16, 0)
	,('fmacconnell89@apache.org', 'zEDbY9iZHPt', 'fmacconnell89', 'Frederico', 'MacConnell', 'M',1,788,2, 0)
	,('pteffrey8a@un.org', 'YAmZEQAfIAg', 'pteffrey8a', 'Pyotr', 'Teffrey', 'M',1,304,2, 0)
	,('gtidmarsh8b@google.cn', 'k5dE3pw0JT', 'gtidmarsh8b', 'Greggory', 'Tidmarsh', 'M',0,92,0, 0)
	,('cdillway8c@typepad.com', '0XDKf5t8P59', 'cdillway8c', 'Cos', 'Dillway', 'M',1,712,18, 0)
	,('sdutchburn8d@ed.gov', 'o7vhtR6iF', 'sdutchburn8d', 'Saunders', 'Dutchburn', 'M',1,400,17, 0)
	,('psambrok8e@delicious.com', 'rbvrfHXYj', 'psambrok8e', 'Peggie', 'Sambrok', 'F',1,29,20, 0)
	,('acollin8f@mediafire.com', '3iWIBzN', 'acollin8f', 'Allison', 'Collin', 'F',1,690,8, 0)
	,('mmcgloughlin8g@yellowbook.com', 'r1g0hg1YQ', 'mmcgloughlin8g', 'Manolo', 'McGloughlin', 'M',1,182,6, 0)
	,('kserraillier8h@dot.gov', 'BdpZjpxA', 'kserraillier8h', 'Kim', 'Serraillier', 'M',1,800,13, 0)
	,('bpenvarden8i@google.com', '5iz7aJ4Q2', 'bpenvarden8i', 'Barbaraanne', 'Penvarden', 'F',0,91,0, 0)
	,('lduesberry8j@amazon.co.uk', 'yjN094D7X', 'lduesberry8j', 'Linc', 'Duesberry', 'M',0,602,14, 0)
	,('ldickman8k@printfriendly.com', 'qjgFSM', 'ldickman8k', 'Luci', 'Dickman', 'F',0,911,5, 0)
	,('astronach8l@opera.com', 'P4JvD7jlBu', 'astronach8l', 'Aloin', 'Stronach', 'M',0,529,5, 0)
	,('bfelder8m@disqus.com', 'CnBtfOCmJ', 'bfelder8m', 'Brandyn', 'Felder', 'M',1,712,6, 0)
	,('mbenbough8n@google.nl', 'tTGC2dM', 'mbenbough8n', 'Maureene', 'Benbough', 'F',0,960,7, 0)
	,('acissen8o@pagesperso-orange.fr', 'l3EmpLjtfx', 'acissen8o', 'Alphonse', 'Cissen', 'M',0,819,20, 0)
	,('marboine8p@google.cn', '6QfPcGMz', 'marboine8p', 'Micheline', 'Arboine', 'F',0,784,1, 0)
	,('cmartineau8q@tumblr.com', 'wUaTFu', 'cmartineau8q', 'Chucho', 'Martineau', 'M',0,318,19, 0)
	,('dhuckerbe8r@prnewswire.com', 'fm4BHqlES', 'dhuckerbe8r', 'Dorine', 'Huckerbe', 'F',0,165,4, 0)
	,('fskelton8s@epa.gov', 'o8i3Jkx96H3f', 'fskelton8s', 'Florencia', 'Skelton', 'F',0,563,16, 0)
	,('yschiementz8t@tmall.com', 'Gyro2cF1WUqO', 'yschiementz8t', 'Yolande', 'Schiementz', 'F',1,273,16, 0)
	,('lgregoletti8u@patch.com', 'E1fszG', 'lgregoletti8u', 'Lotti', 'Gregoletti', 'F',0,673,1, 0)
	,('ravraam8v@stanford.edu', '462qXA', 'ravraam8v', 'Reuven', 'Avraam', 'M',0,355,4, 0)
	,('yschutze8w@qq.com', 'P6dsaXf8W', 'yschutze8w', 'Yvor', 'Schutze', 'M',0,909,4, 0)
	,('rramelot8x@upenn.edu', 'x36WCirR', 'rramelot8x', 'Rollo', 'Ramelot', 'M',1,299,13, 0)
	,('lgoldsworthy8y@webnode.com', '8420QZX', 'lgoldsworthy8y', 'Lewes', 'Goldsworthy', 'M',1,208,9, 0)
	,('slethley8z@friendfeed.com', 'ngGgNlPTWk', 'slethley8z', 'Silvie', 'Lethley', 'F',1,864,19, 0)
	,('vgauchier90@twitter.com', 'DAVLvYb', 'vgauchier90', 'Verena', 'Gauchier', 'F',1,244,15, 0)
	,('gvaadeland91@flickr.com', 'UABMaxk', 'gvaadeland91', 'Giuditta', 'Vaadeland', 'F',1,583,9, 0)
	,('ccauley92@cafepress.com', '7HWOPvI', 'ccauley92', 'Cass', 'Cauley', 'F',0,687,15, 0)
	,('kfife93@merriam-webster.com', 'C2Quzs', 'kfife93', 'Kippy', 'Fife', 'M',0,998,11, 0)
	,('fodevey94@diigo.com', 'ZKMrP72OKHS', 'fodevey94', 'Frederico', 'O''Devey', 'M',0,963,6, 0)
	,('lacey95@symantec.com', 'WHq5KlS', 'lacey95', 'Lucina', 'Acey', 'F',1,15,13, 0)
	,('sferryn96@delicious.com', 'QbcsdNV4bO', 'sferryn96', 'Siffre', 'Ferryn', 'M',0,364,10, 0)
	,('fghelarducci97@wikispaces.com', 'vj0MSEtz', 'fghelarducci97', 'Faber', 'Ghelarducci', 'M',0,683,12, 0)
	,('cmannooch98@linkedin.com', 'zX1X2xMJV', 'cmannooch98', 'Connor', 'Mannooch', 'M',0,547,8, 0)
	,('nwellard99@tripod.com', '1mFJ6gEirecm', 'nwellard99', 'Neron', 'Wellard', 'M',0,550,16, 0)
	,('lpeto9a@sogou.com', 'XGUD5ulaCT2d', 'lpeto9a', 'Liuka', 'Peto', 'F',0,849,9, 0)
	,('rwright9b@cdbaby.com', 'NWaBFi', 'rwright9b', 'Ruddy', 'Wright', 'M',1,663,16, 0)
	,('cgiocannoni9c@yahoo.co.jp', 'RIPAaff', 'cgiocannoni9c', 'Cassi', 'Giocannoni', 'F',1,492,4, 0)
	,('jronayne9d@delicious.com', 'tLjjyj8wH', 'jronayne9d', 'Jamison', 'Ronayne', 'M',1,200,3, 0)
	,('kchallenor9e@biblegateway.com', 'TbRc4Hr', 'kchallenor9e', 'Knox', 'Challenor', 'M',1,844,12, 0)
	,('dtenant9f@ameblo.jp', 'KVLZ9HdNZHCY', 'dtenant9f', 'Darrell', 'Tenant', 'M',0,198,2, 0)
	,('hbeadle9g@dedecms.com', '9DsXJB5k2wcR', 'hbeadle9g', 'Hamilton', 'Beadle', 'M',1,841,10, 0)
	,('bbaudinot9h@indiegogo.com', 'H8mq7GbaaE', 'bbaudinot9h', 'Bastian', 'Baudinot', 'M',0,232,15, 0)
	,('renrietto9i@un.org', 'uhYbLkKo', 'renrietto9i', 'Robbert', 'Enrietto', 'M',0,824,15, 0)
	,('bmangin9j@sogou.com', 'TqLCcPoJ0CJ', 'bmangin9j', 'Brod', 'Mangin', 'M',0,408,6, 0)
	,('bnewlove9k@cdbaby.com', 'l90pFZox6j', 'bnewlove9k', 'Blair', 'Newlove', 'F',0,541,10, 0)
	,('echasney9l@rediff.com', 'UZreD00r0h', 'echasney9l', 'Engelbert', 'Chasney', 'M',0,144,20, 0)
	,('ggallafant9m@wp.com', 'H2S0TMIHhp0T', 'ggallafant9m', 'Gwennie', 'Gallafant', 'F',0,182,16, 0)
	,('mdunk9n@reuters.com', 'akni3Op7F1r', 'mdunk9n', 'Martino', 'Dunk', 'M',0,84,2, 0)
	,('ljillett9o@odnoklassniki.ru', 'QLY7GZN6', 'ljillett9o', 'Lanette', 'Jillett', 'F',0,828,9, 0)
	,('csemechik9p@elpais.com', 'mVtOrad1VI4T', 'csemechik9p', 'Curr', 'Semechik', 'M',1,305,6, 0)
	,('dhollebon9q@blogs.com', 'KV6C9MUKJxU', 'dhollebon9q', 'Doloritas', 'Hollebon', 'F',0,522,13, 0)
	,('wrottger9r@hostgator.com', 'xR8DSHv1z9Z', 'wrottger9r', 'Wilbert', 'Rottger', 'M',1,756,12, 0)
	,('scroisier9s@hibu.com', 'nyHdj9v', 'scroisier9s', 'Saundra', 'Croisier', 'F',0,726,12, 0)
	,('gpostin9t@weather.com', 'hFRQWo', 'gpostin9t', 'Gwenni', 'Postin', 'F',0,207,16, 0)
	,('varch9u@yale.edu', 'KhwhZRN3S', 'varch9u', 'Vivyanne', 'Arch', 'F',0,668,0, 0)
	,('mmasurel9v@un.org', 'DaVPKld', 'mmasurel9v', 'Minor', 'Masurel', 'M',1,702,1, 0)
	,('jriguard9w@patch.com', 'r2sHoj6E', 'jriguard9w', 'Jobyna', 'Riguard', 'F',0,841,0, 0)
	,('eszapiro9x@sitemeter.com', 'i7zVKGObpp', 'eszapiro9x', 'Emmy', 'Szapiro', 'M',0,33,2, 0)
	,('cradloff9y@illinois.edu', 'h1fS8Y0', 'cradloff9y', 'Cody', 'Radloff', 'M',0,322,6, 0)
	,('tasals9z@slideshare.net', 'bOCvuzurZc6', 'tasals9z', 'Timofei', 'Asals', 'M',1,851,16, 0)
	,('smandrya0@histats.com', 'Kxd3hqah', 'smandrya0', 'Samson', 'Mandry', 'M',0,232,0, 0)
	,('mmeiera1@zdnet.com', '0HIgZUCq', 'mmeiera1', 'Markos', 'Meier', 'M',1,815,7, 0)
	,('dhoverta2@go.com', 'zjFOl4YqSmMO', 'dhoverta2', 'Dean', 'Hovert', 'M',0,536,20, 0)
	,('rgasgartha3@soup.io', 'LLaC6hRBso', 'rgasgartha3', 'Rina', 'Gasgarth', 'F',0,796,12, 0)
	,('npitrolloa4@ehow.com', 'yQEX3jhfWyE4', 'npitrolloa4', 'Nichols', 'Pitrollo', 'M',1,823,19, 0)
	,('lnaiseya5@loc.gov', 'P5dmiHyzDLtK', 'lnaiseya5', 'Lothaire', 'Naisey', 'M',1,170,13, 0)
	,('ppeartreea6@alibaba.com', 'v6FzYzjkQ', 'ppeartreea6', 'Prentiss', 'Peartree', 'M',1,739,17, 0)
	,('cstringmana7@psu.edu', 'OVhpb3yo5Xq', 'cstringmana7', 'Con', 'Stringman', 'M',1,107,5, 0)
	,('ddraudea8@edublogs.org', 'MmAa8QmzMY6', 'ddraudea8', 'Damien', 'Draude', 'M',0,630,9, 0)
	,('dcasebornea9@sbwire.com', 'Of1p8Ulzjt', 'dcasebornea9', 'Dalila', 'Caseborne', 'F',0,413,19, 0)
	,('amacsweeneyaa@sbwire.com', '5HwXwsv', 'amacsweeneyaa', 'Amata', 'MacSweeney', 'F',1,994,15, 0)
	,('kewingab@google.com', 'EwaPRZHTK2fN', 'kewingab', 'Katinka', 'Ewing', 'F',0,379,9, 0)
	,('hmclenaghanac@nhs.uk', 'oqk7PIu', 'hmclenaghanac', 'Harlene', 'McLenaghan', 'F',0,790,7, 0)
	,('tbelliveauad@hugedomains.com', 'NXy8zlkvdZ', 'tbelliveauad', 'Tim', 'Belliveau', 'F',1,867,9, 0)
	,('gcastrilloae@i2i.jp', 'usf89ELkS', 'gcastrilloae', 'Giraud', 'Castrillo', 'M',1,384,14, 0)
	,('rjosephoffaf@diigo.com', '93ZiX4YICUsI', 'rjosephoffaf', 'Reuben', 'Josephoff', 'M',1,570,8, 0)
	,('bpietruszkaag@domainmarket.com', 'sA3AmpZ93X', 'bpietruszkaag', 'Birch', 'Pietruszka', 'M',1,433,9, 0)
	,('rgoveah@flickr.com', 'vxjHQ6KWn', 'rgoveah', 'Rad', 'Gove', 'M',0,827,4, 0)
	,('mmanhoodai@goo.ne.jp', 'oIrIVSc7kfwl', 'mmanhoodai', 'Maggy', 'Manhood', 'F',1,80,13, 0)
	,('hwestcottaj@ameblo.jp', 'Hm7XIGS', 'hwestcottaj', 'Hillie', 'Westcott', 'M',0,732,7, 0)
	,('sschankelborgak@imdb.com', '59jtaPvLIpZU', 'sschankelborgak', 'Shaine', 'Schankelborg', 'M',0,111,17, 0)
	,('lburgettal@cloudflare.com', 'EkduJFj2rJas', 'lburgettal', 'Loutitia', 'Burgett', 'F',1,637,4, 0)
	,('fshepherdsonam@samsung.com', 's640wLWESfu3', 'fshepherdsonam', 'Fairfax', 'Shepherdson', 'M',1,146,19, 0)
	,('slockneyan@craigslist.org', 'CnDZkjNr', 'slockneyan', 'Sonny', 'Lockney', 'F',0,236,2, 0)
	,('mbrehautao@washington.edu', 'Ybvk6Nbc', 'mbrehautao', 'Mari', 'Brehaut', 'F',0,999,14, 0)
	,('haharoniap@altervista.org', 'oqOQX7xLMHP', 'haharoniap', 'Huey', 'Aharoni', 'M',0,145,8, 0)
	,('bgarfootaq@sbwire.com', 'XbQvs6', 'bgarfootaq', 'Bruce', 'Garfoot', 'M',0,24,12, 0)
	,('htrevearar@ehow.com', 'aj1lr6vW', 'htrevearar', 'Hall', 'Trevear', 'M',0,691,8, 0)
	,('bnewcomeas@cpanel.net', 'exF2VnW', 'bnewcomeas', 'Bartolemo', 'Newcome', 'M',0,284,10, 0)
	,('fseysat@nsw.gov.au', 'Mw3JAmC', 'fseysat', 'Felecia', 'Seys', 'F',1,135,4, 0)
	,('cofihillieau@newyorker.com', 'qMUVC0QY', 'cofihillieau', 'Carny', 'O''Fihillie', 'M',0,203,3, 0)
	,('webornav@hhs.gov', 'RGDrwR', 'webornav', 'Wolfie', 'Eborn', 'M',1,143,5, 0)
	,('jplentyaw@mail.ru', 'AuaI8Pqlxhbv', 'jplentyaw', 'Jana', 'Plenty', 'F',1,507,17, 0)
	,('mbeardwellax@i2i.jp', 'YuRiqcDiD', 'mbeardwellax', 'Mallorie', 'Beardwell', 'F',0,219,20, 0)
	,('sbevanay@usnews.com', '2kKBq7xKIReE', 'sbevanay', 'Siana', 'Bevan', 'F',1,722,9, 0)
	,('ebloodwortheaz@nydailynews.com', '7z1BjHVN', 'ebloodwortheaz', 'Elena', 'Bloodworthe', 'F',1,518,2, 0)
	,('gbielefeldb0@flickr.com', 'uM7Djq', 'gbielefeldb0', 'Gael', 'Bielefeld', 'F',0,491,19, 0)
	,('fplettsb1@live.com', 'tKhmH2l', 'fplettsb1', 'Fina', 'Pletts', 'F',1,788,6, 0)
	,('aroddellb2@hao123.com', 'lHBMYqM8h', 'aroddellb2', 'Archaimbaud', 'Roddell', 'M',0,157,20, 0)
	,('skleinpeltzb3@multiply.com', '3xqKWAFd', 'skleinpeltzb3', 'Saleem', 'Kleinpeltz', 'M',1,693,13, 0)
	,('efrearb4@salon.com', '31EAxclorAal', 'efrearb4', 'Emili', 'Frear', 'F',0,728,12, 0)
	,('risworthb5@multiply.com', 'vdnpUcrh', 'risworthb5', 'Randa', 'Isworth', 'F',1,725,20, 0)
	,('fantonuttib6@dmoz.org', 'zcJIhnd8K3c', 'fantonuttib6', 'Felizio', 'Antonutti', 'M',0,426,7, 0)
	,('cemmanuelib7@mtv.com', 'RbQGUaU', 'cemmanuelib7', 'Cal', 'Emmanueli', 'M',1,202,13, 0)
	,('kcolliardb8@wikimedia.org', 'uqAfnH1a', 'kcolliardb8', 'Kelsy', 'Colliard', 'F',1,638,11, 0)
	,('pravensb9@artisteer.com', 'yds6r9', 'pravensb9', 'Paloma', 'Ravens', 'F',1,765,13, 0)
	,('avialsba@psu.edu', 'IDlOHYyUfb', 'avialsba', 'Abey', 'Vials', 'M',1,460,9, 0)
	,('hswiersbb@wisc.edu', '6DJCAFC', 'hswiersbb', 'Hillary', 'Swiers', 'F',0,800,14, 0)
	,('mclevelandbc@live.com', 'ipshAJlBt', 'mclevelandbc', 'Merle', 'Cleveland', 'F',0,821,19, 0)
	,('sdormandbd@csmonitor.com', 'ylYzJp', 'sdormandbd', 'Stefanie', 'Dormand', 'F',1,320,6, 0)
	,('duppettbe@unblog.fr', 'v8yhvA', 'duppettbe', 'De witt', 'Uppett', 'M',0,566,6, 0)
	,('mboogbf@examiner.com', 'NVeelu2Ky', 'mboogbf', 'Matthias', 'Boog', 'M',1,667,10, 0)
	,('ssworderbg@noaa.gov', 'k1GF2q', 'ssworderbg', 'Sherman', 'Sworder', 'M',1,143,1, 0)
	,('cjillardbh@shareasale.com', 'rGPCsz', 'cjillardbh', 'Chancey', 'Jillard', 'M',1,964,10, 0)
	,('ntaschbi@craigslist.org', 'wyngCafElL', 'ntaschbi', 'Natalee', 'Tasch', 'F',0,982,8, 0)
	,('rquenellbj@tamu.edu', '3e3h0ydAz', 'rquenellbj', 'Rutledge', 'Quenell', 'M',0,123,18, 0)
	,('kparkeybk@msn.com', 'pCW2jBLZyf6', 'kparkeybk', 'Kareem', 'Parkey', 'M',0,286,13, 0)
	,('aolneybl@yale.edu', 'e26j87r', 'aolneybl', 'Annissa', 'Olney', 'F',1,26,12, 0)
	,('dkabischbm@t.co', '0HYHvTDBJX7', 'dkabischbm', 'Drugi', 'Kabisch', 'M',0,306,17, 0)
	,('dzealebn@blogtalkradio.com', '1p4qUwnGF4', 'dzealebn', 'Debbie', 'Zeale', 'F',0,810,14, 0)
	,('ocullneanbo@alibaba.com', 'tbNHkxm4db', 'ocullneanbo', 'Orsa', 'Cullnean', 'F',1,891,15, 0)
	,('lapfelbp@paginegialle.it', 'pgLbTqA', 'lapfelbp', 'Lindi', 'Apfel', 'F',1,658,20, 0)
	,('blambertibq@wikispaces.com', 'QDFTUDBGLLcn', 'blambertibq', 'Budd', 'Lamberti', 'M',0,572,3, 0)
	,('esimonsbr@bloglines.com', 'XKBLLPlzc7z', 'esimonsbr', 'Elfie', 'Simons', 'F',1,375,11, 0)
	,('kmacgillivraybs@earthlink.net', 'o7fmUWf6zhY', 'kmacgillivraybs', 'Kahlil', 'MacGillivray', 'M',1,711,5, 0)
	,('cmixbt@nsw.gov.au', 'SSCnnffXIrn', 'cmixbt', 'Cletis', 'Mix', 'M',1,834,11, 0)
	,('lbierlingbu@fema.gov', 'IBwdOrDB', 'lbierlingbu', 'Lyman', 'Bierling', 'M',0,386,15, 0)
	,('kdearlovebv@sfgate.com', '0VkOKC8ZZ', 'kdearlovebv', 'Konstance', 'Dearlove', 'F',1,801,9, 0)
	,('gshipmanbw@state.gov', 'SInIwKSo', 'gshipmanbw', 'Ginny', 'Shipman', 'F',1,629,7, 0)
	,('jsimonichbx@tripod.com', '2MlyswC', 'jsimonichbx', 'Jard', 'Simonich', 'M',0,840,0, 0)
	,('cechelleby@wisc.edu', 'XaM5t4Vpq1s', 'cechelleby', 'Carlo', 'Echelle', 'M',1,42,10, 0)
	,('agrimsditchbz@miibeian.gov.cn', 'krmR7K', 'agrimsditchbz', 'Aldridge', 'Grimsditch', 'M',0,202,14, 0)
	,('lbogeyc0@fc2.com', 'AqZ7K2pEaVFw', 'lbogeyc0', 'Lurline', 'Bogey', 'F',1,551,13, 0)
	,('mshouldersc1@meetup.com', 'zYhCX2', 'mshouldersc1', 'Meredith', 'Shoulders', 'F',0,466,15, 0)
	,('rlilbournec2@people.com.cn', 'ipdCHirrUnfm', 'rlilbournec2', 'Roseanne', 'Lilbourne', 'F',1,31,7, 0)
	,('rgarmansc3@hud.gov', '3YznOorTpK3', 'rgarmansc3', 'Rosalinde', 'Garmans', 'F',0,808,11, 0)
	,('ldaidc4@rakuten.co.jp', 'py0Eqxss7BB', 'ldaidc4', 'Leanora', 'Daid', 'F',1,191,1, 0)
	,('mgrimwadec5@mlb.com', '4QS31ED', 'mgrimwadec5', 'Maritsa', 'Grimwade', 'F',1,94,5, 0)
	,('wheninghamc6@woothemes.com', '0oiCwimMGPs', 'wheninghamc6', 'Walton', 'Heningham', 'M',0,918,14, 0)
	,('hbonhamc7@walmart.com', 'AhtoZ10bkGa', 'hbonhamc7', 'Hadria', 'Bonham', 'F',0,695,5, 0)
	,('alarkinsc8@wp.com', 'YbotNU32oS', 'alarkinsc8', 'Arnoldo', 'Larkins', 'M',0,845,8, 0)
	,('kcoggellc9@newsvine.com', 'c1TGqkMo', 'kcoggellc9', 'Kailey', 'Coggell', 'F',1,679,2, 0)
	,('nstairsca@time.com', '8o1mpdi', 'nstairsca', 'Noak', 'Stairs', 'M',1,586,20, 0)
	,('ahassurcb@behance.net', 'rGx2xbWyxj', 'ahassurcb', 'Alejandrina', 'Hassur', 'F',0,918,6, 0)
	,('kmccutheoncc@microsoft.com', 'hrGyC5cl', 'kmccutheoncc', 'Kaia', 'McCutheon', 'F',0,48,10, 0)
	,('apattlelcd@sciencedirect.com', 'OVDyN1Han', 'apattlelcd', 'Alexina', 'Pattlel', 'F',1,486,18, 0)
	,('hlandce@eventbrite.com', 'AunfVnOX3Nt', 'hlandce', 'Harriette', 'Land', 'F',1,914,9, 0)
	,('dhinrichscf@patch.com', 'XuvWHM', 'dhinrichscf', 'Davidde', 'Hinrichs', 'M',1,66,11, 0)
	,('nmorrisseycg@ibm.com', '74V2E71Nht', 'nmorrisseycg', 'Norrie', 'Morrissey', 'M',0,548,11, 0)
	,('fscreatonch@nhs.uk', 'HsJmbVNEDYy', 'fscreatonch', 'Fletch', 'Screaton', 'M',1,391,5, 0)
	,('ascawtonci@gravatar.com', 'WtW8zpBwjI', 'ascawtonci', 'Ado', 'Scawton', 'M',1,661,17, 0)
	,('bphytheancj@fotki.com', 'tdwxUTU68XT', 'bphytheancj', 'Becca', 'Phythean', 'F',1,204,5, 0)
	,('smerryfieldck@livejournal.com', 'lnzaEl6', 'smerryfieldck', 'Silvana', 'Merryfield', 'F',0,865,2, 0)
	,('mfairhurstcl@scientificamerican.com', '6rjIy3s', 'mfairhurstcl', 'Muire', 'Fairhurst', 'F',0,91,8, 0)
	,('usilmoncm@mayoclinic.com', 'UR54Jk', 'usilmoncm', 'Ulrica', 'Silmon', 'F',0,686,18, 0)
	,('mjegercn@vistaprint.com', 'ACllmm6tsG0', 'mjegercn', 'Monica', 'Jeger', 'F',0,102,18, 0)
	,('nmurfettco@whitehouse.gov', 'UpXhsErLWBE3', 'nmurfettco', 'Nixie', 'Murfett', 'F',0,388,5, 0)
	,('vgwatkinscp@disqus.com', 'isomnJWBE', 'vgwatkinscp', 'Vikki', 'Gwatkins', 'F',1,551,7, 0)
	,('khunecq@ca.gov', '8Uf8cq30Q', 'khunecq', 'Kelcey', 'Hune', 'F',1,102,14, 0)
	,('jpriestnercr@163.com', 'pzxiVL2jlC', 'jpriestnercr', 'Joelly', 'Priestner', 'F',1,228,20, 0)
	,('tvasilikcs@godaddy.com', 'xgdTnw6nk', 'tvasilikcs', 'Thom', 'Vasilik', 'M',1,707,17, 0)
	,('byukhtinct@alibaba.com', 'R97ykVdNgu6', 'byukhtinct', 'Bryce', 'Yukhtin', 'M',1,469,20, 0)
	,('hdenningcu@delicious.com', 'kYBJq5XNdzG', 'hdenningcu', 'Holly', 'Denning', 'M',0,314,18, 0)
	,('vbarwoodcv@sourceforge.net', 'Ljz08ONL4th', 'vbarwoodcv', 'Vinny', 'Barwood', 'M',1,941,5, 0)
	,('wchristercw@unc.edu', 'z2qF4mPBvJ3G', 'wchristercw', 'Worthington', 'Christer', 'M',1,1000,14, 0)
	,('tgonnelcx@tripadvisor.com', '1doMARtGb', 'tgonnelcx', 'Terri-jo', 'Gonnel', 'F',1,891,0, 0)
	,('dbrimleycy@nature.com', 'BkvIAekUUabQ', 'dbrimleycy', 'Drugi', 'Brimley', 'M',0,760,9, 0)
	,('acammockecz@tmall.com', 'z9YG5I', 'acammockecz', 'Aubrey', 'Cammocke', 'M',0,53,20, 0)
	,('aborehamd0@google.co.uk', 'Lhoxv1fUncVm', 'aborehamd0', 'Abigail', 'Boreham', 'F',0,969,6, 0)
	,('aramsdelld1@elpais.com', 'IWy9v0mr2G', 'aramsdelld1', 'Auria', 'Ramsdell', 'F',0,213,12, 0)
	,('jmerwed2@soup.io', 'eLEXSa', 'jmerwed2', 'Johnette', 'Merwe', 'F',1,360,3, 0)
	,('mumbersd3@skyrock.com', '5rBhqVjvuUq', 'mumbersd3', 'Melisse', 'Umbers', 'F',1,305,0, 0)
	,('awristd4@icio.us', 'ZagWAbzRv1', 'awristd4', 'Arabelle', 'Wrist', 'F',1,149,16, 0)
	,('tduttond5@desdev.cn', 'tJXJUTRJx', 'tduttond5', 'Tadio', 'Dutton', 'M',0,699,1, 0)
	,('rarmatysd6@storify.com', 'QtUH0YsD1D', 'rarmatysd6', 'Ray', 'Armatys', 'M',0,664,12, 0)
	,('pgraved7@timesonline.co.uk', 'JmipuUn', 'pgraved7', 'Phaedra', 'Grave', 'F',1,125,6, 0)
	,('sellingfordd8@accuweather.com', 'BIk8lTPxs7v', 'sellingfordd8', 'Sarajane', 'Ellingford', 'F',1,397,20, 0)
	,('mattled9@opera.com', 'F30lNiiLHII', 'mattled9', 'Mella', 'Attle', 'F',1,31,1, 0)
	,('ayurinda@drupal.org', 'n0BvO61VEjD', 'ayurinda', 'Ardelle', 'Yurin', 'F',0,88,19, 0)
	,('astilledb@nydailynews.com', 'TsWBsKF9dX', 'astilledb', 'Alisha', 'Stille', 'F',1,925,3, 0)
	,('lelbournedc@yellowpages.com', 'JvIQ7QLj', 'lelbournedc', 'Lisette', 'Elbourne', 'F',0,246,0, 0)
	,('bgonzalvodd@java.com', 'ZCiEKyKSQ', 'bgonzalvodd', 'Bent', 'Gonzalvo', 'M',0,456,17, 0)
	,('kstledgerde@cdc.gov', 'HzDvvM1', 'kstledgerde', 'Kareem', 'St. Ledger', 'M',1,91,12, 0)
	,('rdanielsendf@webeden.co.uk', 'AVvGYBzFF', 'rdanielsendf', 'Reagen', 'Danielsen', 'M',0,403,17, 0)
	,('dmenendesdg@chicagotribune.com', 'vxFRu5giwn1', 'dmenendesdg', 'Donnie', 'Menendes', 'M',0,339,7, 0)
	,('bgeramdh@instagram.com', 'CjjmLRUWB', 'bgeramdh', 'Brett', 'Geram', 'F',1,155,7, 0)
	,('cdehailesdi@miitbeian.gov.cn', 'jD51d3T', 'cdehailesdi', 'Crysta', 'De Hailes', 'F',1,472,3, 0)
	,('gdastdj@goodreads.com', 'IJw6fxy', 'gdastdj', 'Grover', 'Dast', 'M',1,246,19, 0)
	,('esparshottdk@xing.com', 'cv8Wae', 'esparshottdk', 'Emmott', 'Sparshott', 'M',0,976,5, 0)
	,('pbuckhurstdl@nyu.edu', 'FeVlHMOk', 'pbuckhurstdl', 'Parry', 'Buckhurst', 'M',1,896,3, 0)
	,('senriquedm@creativecommons.org', 'MVQiojrB', 'senriquedm', 'Sabina', 'Enrique', 'F',1,323,1, 0)
	,('bfogdendn@discovery.com', 'D1wQw7rPJeR', 'bfogdendn', 'Burnard', 'Fogden', 'M',1,13,12, 0)
	,('gcavillado@4shared.com', 'sk7tzM7xT', 'gcavillado', 'Gabby', 'Cavilla', 'M',1,541,2, 0)
	,('agregorettidp@europa.eu', 'S4LRqah', 'agregorettidp', 'Amalia', 'Gregoretti', 'F',0,738,5, 0)
	,('awintourdq@census.gov', 'EH7XcxiTyBS', 'awintourdq', 'Avivah', 'Wintour', 'F',0,9,4, 0)
	,('gkingsdr@yolasite.com', 'Frw8OVTYD81B', 'gkingsdr', 'Goldia', 'Kings', 'F',0,908,20, 0)
	,('tdelgadods@twitpic.com', 'KY2s8yYZ0hH', 'tdelgadods', 'Trev', 'Delgado', 'M',0,959,1, 0)
	,('bswiggdt@webmd.com', 'ZcPzL2s7', 'bswiggdt', 'Bonnibelle', 'Swigg', 'F',0,349,9, 0)
	,('hcarbertdu@ehow.com', 'TZajxmA9Mdl', 'hcarbertdu', 'Harris', 'Carbert', 'M',0,219,5, 0)
	,('tespasadv@hp.com', 'zm8VzZZFh53', 'tespasadv', 'Tades', 'Espasa', 'M',1,501,9, 0)
	,('smchaledw@cbsnews.com', '11Bsp6OPy', 'smchaledw', 'Sarine', 'McHale', 'F',0,457,5, 0)
	,('pandrejsdx@home.pl', 'Jrm0h0G6w', 'pandrejsdx', 'Patricio', 'Andrejs', 'M',0,90,9, 0)
	,('gwybrowdy@theatlantic.com', 'ZejXbj', 'gwybrowdy', 'Grantley', 'Wybrow', 'M',1,707,7, 0)
	,('rlindldz@jiathis.com', 'A1gDhmq', 'rlindldz', 'Roma', 'Lindl', 'M',0,884,1, 0)
	,('dreye0@com.com', '4S7Kpq2', 'dreye0', 'Darb', 'Rey', 'F',1,169,3, 0)
	,('tughettie1@auda.org.au', 'K9oUNuYhr', 'tughettie1', 'Tildi', 'Ughetti', 'F',1,207,4, 0)
	,('gnijse2@dedecms.com', 'DkjakOpPMG', 'gnijse2', 'Gerrie', 'Nijs', 'F',1,527,6, 0)
	,('bduere3@cbslocal.com', 'lUeYOPsv', 'bduere3', 'Brewer', 'Duer', 'M',1,723,18, 0)
	,('cpaxfordee4@mayoclinic.com', 'GAi5TI5rkH', 'cpaxfordee4', 'Culley', 'Paxforde', 'M',0,121,0, 0)
	,('eguerreaue5@spiegel.de', 'y0bn7yB7So9N', 'eguerreaue5', 'Englebert', 'Guerreau', 'M',1,20,13, 0)
	,('mgenningse6@1und1.de', 'u7c9WmO', 'mgenningse6', 'Michale', 'Gennings', 'M',0,160,15, 0)
	,('cfranzolinie7@nymag.com', 'kOLoLKRNBg7I', 'cfranzolinie7', 'Cesare', 'Franzolini', 'M',1,770,11, 0)
	,('jiberte8@nationalgeographic.com', '7sWiqHlO', 'jiberte8', 'Jinny', 'Ibert', 'F',1,455,8, 0)
	,('snollete9@xing.com', 'fvVAj8bp', 'snollete9', 'Stepha', 'Nollet', 'F',1,373,7, 0)
	,('nkerinsea@google.co.uk', 'NGZSQfcdp', 'nkerinsea', 'Nani', 'Kerins', 'F',0,960,6, 0)
	,('nlowndesbrougheb@home.pl', 'sCQ735R1QKXh', 'nlowndesbrougheb', 'Netty', 'Lowndesbrough', 'F',1,458,15, 0)
	,('tmarfellec@wiley.com', 'tAqtxCbfwDi', 'tmarfellec', 'Tiffani', 'Marfell', 'F',1,317,10, 0)
	,('tsmoothed@statcounter.com', 'UF5NP9', 'tsmoothed', 'Trumann', 'Smooth', 'M',1,278,20, 0)
	,('ajakuboviczee@yahoo.co.jp', '9xXxGF', 'ajakuboviczee', 'Angelika', 'Jakubovicz', 'F',0,139,15, 0)
	,('beagleshamef@pinterest.com', 'C9VGCffF', 'beagleshamef', 'Boone', 'Eaglesham', 'M',1,247,15, 0)

/*-------------------------------------------------------------------------------- 
									SHOES 
  --------------------------------------------------------------------------------*/
  INSERT INTO Shoes (userId, shoeBrandId, model, totalMiles) VALUES
	 (103, 11, 'Pegasus 1', 178)
	,(102, 11, 'Runner', 71)
	,(113, 4, 'Glycerin', 136)
	,(105, 4, 'Summer trainers', 11)
	,(115, 11, 'nike elite', 324)
	,(111, 1, 'Workout shoe', 0)
	,(116, 2, '7th grade cross', 0)
	,(111, 1, 'Training Shoe', 0)
	,(117, 1, 'Supernova Classic 1', 74)
	,(123, 1, 'Adiprene', 44)
	,(80, 11, 'Pegasus', 3)
	,(80, 11, 'Eldoret', 0)
	,(80, 11, 'Zoom Vapor', 25)
	,(102, 11, 'Pegasus', 68)
	,(113, 11, 'Vapor', 117)
	,(128, 1, 'Swisher', 12)
	,(113, 11, 'Eldoret', 137)
	,(112, 11, 'Pegesus', 158)
	,(137, 1, 'P.F. Flyers', 0)
	,(137, 1, 'asdf', 0)
	,(113, 4, 'Glycerin Gold', 145)
	,(1, 2, 'GBlank', 0)
	,(102, 1, 'Nova Cushion', 30)
	,(225, 11, 'Nike Air Tempest', 3)
	,(112, 11, 'OLD Pegasus', 138)
	,(117, 1, 'Supernova Cushion', 58)
	,(102, 4, 'Brooks Trance', 35)
	,(149, 11, 'vapors', 0)
	,(161, 8, 'About to be Retired', 163)
	,(161, 11, 'Pegasus Racer', 195)
	,(168, 1, 'Gel', 155)
	,(170, 2, 'Gel Landreth', 21)
	,(171, 4, 'Adrenaline GTS 4', 41)
	,(178, 2, '1090', 99)
	,(183, 2, 'Gel DS-lyte Trainers', 15)
	,(113, 4, 'WINTER', 108)
	,(105, 10, 'Winter', 25)
	,(161, 2, 'Gel-Landreth', 128)
	,(206, 8, 'winter training', 205)
	,(152, 1, 'GEL''N', 0)
	,(80, 11, 'Pegasus 1', 0)
	,(225, 8, 'Mizuno', 5)
	,(81, 11, 'Air Pegasus', 115)
	,(228, 1, 'Q''s Shoe', 0)
	,(228, 1, 'Zap''s Shoe', 0)
	,(102, 11, 'Pegasus 2', 37)
	,(225, 8, 'Mizuno', 7)
	,(205, 2, '2090s', 11)
	,(123, 1, 'Addidas - Red', 57)
	,(174, 2, '1090s', 102)
	,(175, 8, 'Riders VII Spring 1', 59)
	,(206, 8, 'maverick', 145)
	,(281, 2, '2080''s', 0)
	,(289, 4, 'trainer', 0)
	,(289, 16, 'indoor racing flats', 6)
	,(148, 2, 'Old Asics', 0)
	,(302, 11, 'Nike Free', 5)
	,(302, 1, 'Adidas Trail', 2)
	,(290, 1, 'Boston Classic', 0)
	,(303, 3, 'Sweet Running Shoes', 0)
	,(296, 1, 'adidas', 36)
	,(296, 4, 'Books', 25)
	,(81, 11, 'Air Pegasus', 115)
	,(305, 2, 'toast', 5)
	,(302, 11, 'Hero''s', 24)
	,(299, 8, 'Wave Rider 7', 15)
	,(309, 11, 'Green Elite 1', 7)
	,(279, 11, 'air structure', 20)
	,(279, 11, 'Nike Waflles', 29)
	,(299, 11, 'Zoom Elite', 10)
	,(311, 11, 'Nike', 48)
	,(313, 8, 'Wave Nirvana #1', 44)
	,(313, 8, 'Wave Nirvana #2', 56)
	,(318, 11, 'Nike', 35)
	,(319, 1, '1', 18)
	,(179, 8, 'wave precision', 172)
	,(324, 11, 'Favorite', 37)
	,(327, 4, 'Burn2', 20)
	,(327, 4, 'Trance', 0)
	,(1, 2, 'Gel - 1100', 0)
	,(178, 2, 'gt-2100', 69)
	,(314, 1, 'Tough', 20)
	,(314, 11, 'Blue Flash', 22)
	,(320, 18, 'shoe1', 11)
	,(112, 11, '05 Pegasus', 162)
	,(299, 8, 'Wave Rider 8', 5)
	,(293, 8, 'Wave Mustang', 0)
	,(302, 1, 'New Trail', 0)
	,(113, 4, 'Sping Glycerin', 98)
	,(333, 1, 'Cushion 2', 26)
	,(333, 8, 'Revolvers', 10)
	,(126, 8, '1', 0)
	,(126, 4, '2', 8)
	,(333, 11, 'Kennedy XC''s Camo', 15)
	,(333, 1, 'Adidas Spikes', 8)
	,(333, 1, 'Cushion 1', 27)
	,(313, 8, 'Wave Nirvana #3', 43)
	,(337, 2, 'Trainers', 10)
	,(337, 1, 'Adistars', 36)
	,(325, 2, 'Ace', 0)
	,(102, 11, 'Pegasus 3', 10)
	,(105, 10, 'NB kicks', 23)
	,(289, 18, 'Bare Feet', 13)
	,(289, 4, 'trainer 2', 9)
	,(1, 2, 'GT - 2100', 0)
	,(352, 2, 'shoe', 43)
	,(309, 12, 'Patti', 27)
	,(337, 2, 'Trainers2', 18)
	,(349, 11, 'T-Bomb', 0)
	,(340, 2, 'New Trainers', 0)
	,(289, 4, 'track spike', 12)
	,(349, 1, 'Old Skul', 12)
	,(351, 4, 'Radius', 5)
	,(358, 4, 'Brooks 1', 0)
	,(296, 11, 'solas', 44)
	,(333, 1, 'Cushion 3', 6)
	,(330, 11, 'Moto', 0)
	,(309, 11, 'green elite 2', 40)
	,(363, 8, 'Aero', 0)
	,(363, 8, 'Rider 8', 0)
	,(363, 8, 'Rider 8 (2)', 0)
	,(363, 8, 'Rider 8 (3)', 0)
	,(363, 8, 'Rider 8 (4)', 7)
	,(175, 8, 'Wave Rider VIII Spring', 63)
	,(374, 11, 'Pegasus', 0)
	,(375, 2, 'duomax', 0)
	,(375, 1, 'fbvfwevgfr', 0)
	,(299, 11, 'Zoom Ethiopia', 20)
	,(299, 1, 'Cosmos', 16)
	,(379, 2, 'april', 0)
	,(384, 2, '2080', 0)
	,(384, 2, 'Orange Spikes', 0)
	,(382, 11, 'Track Workout Shoe', 0)
	,(382, 8, 'Best Since Triax', 0)
	,(392, 4, 'training shoe', 0)
	,(309, 10, '900 #1', 12)
	,(392, 4, 'training shoe', 0)
	,(392, 4, 'track racing shoe', 0)
	,(399, 11, 'pegasus', 0)
	,(174, 8, 'Gorby', 74)
	,(313, 8, 'Wave Nirvana #4', 53)
	,(102, 11, 'Air Max Moto', 33)
	,(358, 4, 'Brooks 05(1)', 9)
	,(358, 11, 'Steeple Spikes', 0)
	,(396, 2, 'Bob', 0)
	,(384, 1, '2100', 0)
	,(384, 1, '2100', 0)
	,(337, 2, 'Trainers3', 8)
	,(402, 1, 'Supernova Control', 0)
	,(402, 1, 'Supernova Control(2)', 0)
	,(367, 11, 'Grey Pegasus', 0)
	,(337, 4, 'T3s', 10)
	,(367, 11, 'Streak Ekidens', 0)
	,(409, 1, 'Supernova classic', 0)
	,(409, 4, 'Adrenaline GTS 5', 0)
	,(409, 1, 'New Classics', 0)
	,(352, 2, 'ds trainer', 9)
	,(408, 4, 'Trance', 0)
	,(414, 11, 'Perseus', 0)
	,(415, 1, 'Cubato', 0)
	,(415, 11, 'Zoom Elite', 0)
	,(338, 2, 'Gel Nimbus', 0)
	,(383, 4, 'Spring 1', 0)
	,(353, 8, 'running Shoes', 0)
	,(383, 11, 'Spring 2', 0)
	,(352, 1, 'rotterdam II', 30)
	,(205, 2, '2100s', 17)
	,(197, 2, 'asics 2100(1)', 0)
	,(434, 11, 'bob', 0)
	,(434, 1, 'bob', 0)
	,(192, 11, 'christine', 0)
	,(192, 11, 'Veronica', 0)
	,(431, 8, 'Mizuno Wave Maverick', 0)
	,(439, 2, 'Best shoe ever', 0)
	,(451, 2, 'Asics part 2', 0)
	,(458, 14, 'The Dawg', 0)
	,(458, 2, 'Steeple Spikes', 0)
	,(457, 11, 'blue and gold', 0)
	,(363, 8, 'Mustang', 0)
	,(460, 11, 'Trail Exposure II', 0)
	,(457, 11, 'blue and white', 0)
	,(398, 8, 'Summer Shoes', 0)
	,(178, 8, '1st mizuno', 83)
	,(445, 13, 'H52', 0)
	,(175, 8, 'Wave Rider VIII Summer', 33)
	,(112, 11, 'Summer Peg', 151)
	,(457, 11, 'red and white', 0)
	,(485, 11, 'Peg', 0)
	,(487, 2, 'Cumulus', 0)
	,(149, 1, 'Jet Streams', 0)
	,(175, 8, 'Mizuno Wave Rider VI Fall 1', 24)
	,(309, 8, 'Mavy', 22)
	,(500, 8, 'Inspire', 0)
	,(495, 11, 'Pegasus 1', 0)
	,(501, 8, 'Trainers 1', 0)
	,(445, 13, 'h55', 0)
	,(495, 11, 'Span 1', 0)
	,(445, 11, 'jasari', 0)
	,(471, 11, 'zoom air miler', 0)
	,(520, 10, 'NB 690', 0);

/*-------------------------------------------------------------------------------- 
							WORKOUT TYPES
  --------------------------------------------------------------------------------*/
INSERT INTO WorkoutTypes (description, sortOrder) VALUES
	 ('Easy Run', 10)
	,('Normal Run', 0)
	,('Hard Run', 30)
	,('Long Run', 40)
	,('Interval Workout', 5000)
	,('Cross Training/Other', 7000)
	,('Recovery', 100)
	,('Endurance', 50)
	,('Tempo', 70)
	,('Race', 6000)
	,('NO RUN - OFF', 500)
	,('Medium Run', 20)
	,('Hill Training', 60)
	,('Aqua Jogging', 90)
	,('Fartlek', 80)
	,('Threshold', 120)
	,('wu/cd', 130)
	,('Speed Training', 110)
	,('Progression Run', 45)
	,('Cycling', 200)
	,('Elliptical', 201)
	,('Hiking', 202)
	,('VO2 Max', 46)
	,('Steady State', 55)
	,('Other', 10000)

/*-------------------------------------------------------------------------------- 
									WORKOUTS 
  --------------------------------------------------------------------------------*/
INSERT INTO Workouts (userid, workoutTypeid, timeOfDayId, shoeId, workoutDate, totalMiles, totalSeconds) VALUES
	(105,2,1,37,'8/21/2004',5,2400),
	(105,2,3,102,'8/16/2004',3,1500),
	(105,2,3,37,'8/23/2004',3,1500),
	(113,2,2,36,'8/24/2004',7,2940),
	(105,2,2,102,'8/28/2004',3,1500),
	(105,2,2,37,'8/29/2004',4,1800),
	(117,2,2,9,'8/31/2004',7,2867),
	(117,2,2,26,'9/1/2004',5,3300),
	(115,2,3,5,'9/1/2004',5,2008),
	(105,2,1,4,'9/4/2004',5,2700),
	(113,2,1,17,'9/5/2004',7,2980),
	(113,2,2,15,'9/3/2004',6,0),
	(113,2,20,15,'9/6/2004',9,3641),
	(117,2,1,26,'9/2/2004',7,0),
	(117,2,1,26,'9/3/2004',7,0),
	(80,2,2,13,'9/7/2004',9,0),
	(105,2,3,37,'9/7/2004',3,1500),
	(113,2,2,17,'9/7/2004',4,0),
	(117,2,2,9,'9/8/2004',9,3270),
	(102,2,2,2,'9/8/2004',9,3600),
	(128,2,1,16,'9/2/2004',7,2482),
	(102,2,2,46,'9/9/2004',8,3240),
	(113,2,2,17,'9/9/2004',8,3143),
	(113,2,2,3,'9/8/2004',7,3101),
	(117,2,1,26,'9/11/2004',2,0),
	(112,2,1,186,'9/12/2004',7,3081),
	(105,2,1,102,'9/11/2004',5,2100),
	(117,2,2,9,'9/15/2004',6,2520),
	(112,2,1,85,'9/15/2004',10,3696),
	(80,2,2,13,'9/15/2004',10,3569),
	(113,2,2,21,'9/15/2004',10,3597),
	(113,2,2,21,'9/13/2004',9,0),
	(117,2,2,26,'9/17/2004',7,0),
	(117,2,1,9,'9/18/2004',7,2940),
	(112,2,1,18,'9/19/2004',10,4142),
	(117,2,2,26,'9/21/2004',9,3321),
	(102,2,2,2,'9/21/2004',9,3660),
	(102,2,2,14,'9/23/2004',9,3600),
	(113,2,2,17,'9/23/2004',8,3266),
	(112,2,2,18,'9/23/2004',8,3274),
	(102,2,11,46,'9/25/2004',9,3600),
	(102,2,1,2,'9/26/2004',9,3605),
	(113,2,1,3,'9/26/2004',7,2989),
	(113,2,2,15,'9/28/2004',9,3631),
	(102,2,2,2,'9/28/2004',9,3600),
	(123,2,1,49,'9/24/2004',3,1680),
	(112,2,2,18,'9/29/2004',7,2982),
	(117,2,2,9,'9/29/2004',7,2940),
	(117,2,1,26,'9/30/2004',7.5,0),
	(112,2,3,18,'10/2/2004',7,2917),
	(113,2,2,21,'9/29/2004',7,2953),
	(105,2,3,102,'10/4/2004',3,1800),
	(105,2,2,37,'9/27/2004',3,1680),
	(113,2,2,15,'10/4/2004',8,3307),
	(117,2,2,9,'10/4/2004',9,0),
	(113,2,2,3,'10/5/2004',10,0),
	(112,2,2,18,'10/4/2004',8,3237),
	(112,2,1,85,'10/6/2004',8,3234),
	(113,2,1,36,'10/6/2004',8,3284),
	(112,2,1,85,'10/7/2004',8,3215),
	(112,2,1,186,'10/9/2004',7,2909),
	(102,2,2,14,'10/9/2004',9,3600),
	(112,2,1,18,'10/10/2004',8,3231),
	(113,2,2,17,'10/7/2004',6,2368),
	(102,2,1,142,'10/10/2004',9,3600),
	(113,2,3,17,'10/10/2004',5,2102),
	(117,2,2,9,'10/8/2004',7,0),
	(117,2,2,9,'10/6/2004',8,0),
	(112,2,1,25,'10/12/2004',8,3374),
	(123,2,1,10,'10/12/2004',3.7,1862),
	(113,2,2,3,'10/12/2004',8,3330),
	(128,2,1,16,'10/10/2004',5,2100),
	(117,2,3,9,'10/15/2004',7,2520),
	(113,2,2,15,'10/14/2004',7.5,3300),
	(117,2,2,26,'10/16/2004',9,0),
	(112,2,1,25,'10/15/2004',5,0),
	(112,2,1,85,'10/17/2004',9,3732),
	(113,2,1,36,'10/17/2004',7,2779),
	(102,2,2,23,'10/18/2004',9.5,3720),
	(112,2,1,85,'10/18/2004',10,4002),
	(113,2,2,89,'10/18/2004',9,3701),
	(112,2,1,186,'10/20/2004',7,2789),
	(113,2,2,15,'10/20/2004',6,2483),
	(113,2,2,17,'10/21/2004',8,3272),
	(112,2,1,85,'10/21/2004',8,0),
	(117,2,2,9,'10/22/2004',7,0),
	(117,2,2,26,'10/18/2004',5,0),
	(112,2,1,18,'10/23/2004',6,2633),
	(113,2,3,17,'10/23/2004',6.5,2623),
	(113,2,2,21,'10/24/2004',6,2492),
	(112,2,1,186,'10/24/2004',5,2128),
	(102,2,2,2,'10/24/2004',6,2400),
	(113,2,2,17,'10/26/2004',8,3360),
	(112,2,1,25,'10/26/2004',8,3372),
	(113,2,2,89,'10/28/2004',6,2482),
	(112,2,2,85,'10/28/2004',6,2547),
	(112,2,2,85,'10/29/2004',5,0),
	(112,2,1,186,'10/31/2004',7.5,0),
	(112,2,2,18,'11/1/2004',8,3262),
	(102,2,2,14,'11/2/2004',7,2880),
	(112,2,2,25,'11/2/2004',8,3273),
	(113,2,2,17,'10/31/2004',8,0),
	(113,2,2,36,'10/29/2004',5,0),
	(113,2,2,36,'11/4/2004',6,2437),
	(102,2,2,14,'11/4/2004',6,2400),
	(112,2,2,186,'11/4/2004',6,0),
	(105,2,3,102,'11/4/2004',3,1800),
	(105,2,3,4,'11/1/2004',3,1800),
	(105,2,3,4,'11/5/2004',3,1800),
	(112,2,2,18,'11/7/2004',6,2496),
	(102,2,2,14,'11/7/2004',7.5,3000),
	(105,2,2,37,'11/7/2004',4,1980),
	(112,2,2,186,'11/9/2004',6,2542),
	(123,2,3,10,'11/9/2004',4.5,2367),
	(123,2,2,10,'11/11/2004',3,1685),
	(112,2,2,186,'11/11/2004',6,2505),
	(112,2,2,85,'11/12/2004',5,0),
	(113,2,2,21,'11/12/2004',5,2160),
	(113,2,2,21,'11/9/2004',7,2880),
	(123,2,2,49,'11/16/2004',3,1770),
	(123,2,2,10,'11/18/2004',4.5,2338),
	(123,2,1,49,'11/20/2004',6.2,3180),
	(123,2,2,49,'11/21/2004',3,1440),
	(123,2,2,10,'11/23/2004',3,1742),
	(102,2,2,142,'11/25/2004',4,1680),
	(102,2,3,46,'11/26/2004',4,1680),
	(102,2,2,101,'11/27/2004',4,1498),
	(102,2,2,2,'11/28/2004',4,1680),
	(102,2,2,14,'11/29/2004',4,0),
	(123,2,1,49,'11/27/2004',3.6,1860),
	(112,2,2,25,'11/30/2004',5,0),
	(102,2,2,27,'11/30/2004',6,0),
	(113,2,2,21,'11/29/2004',6,2498),
	(102,2,2,27,'12/1/2004',4.5,1800),
	(113,2,1,36,'12/1/2004',5,2132),
	(102,2,2,101,'12/2/2004',4,0),
	(170,2,2,32,'12/1/2004',8,3480),
	(168,2,2,31,'8/19/2004',0,0),
	(112,2,2,186,'12/2/2004',7,2909),
	(112,2,2,18,'12/3/2004',6,2702),
	(168,2,2,31,'12/3/2004',6,2490),
	(178,2,2,34,'12/1/2004',4,1627),
	(178,2,2,183,'12/2/2004',4,1644),
	(178,2,2,183,'12/3/2004',4,1665),
	(178,2,2,34,'11/30/2004',3,0),
	(168,2,2,31,'9/2/2004',8,0),
	(171,2,2,33,'11/30/2004',4,1800),
	(171,2,2,33,'11/29/2004',3,1348),
	(123,2,2,10,'12/2/2004',3,1811),
	(161,2,1,30,'12/4/2004',6.5,2632),
	(102,2,2,142,'12/4/2004',6,0),
	(170,2,2,32,'12/4/2004',13,0),
	(183,2,1,35,'12/5/2004',11,4380),
	(112,2,1,186,'12/6/2004',6,2590),
	(183,2,1,35,'12/6/2004',4.5,1980),
	(178,2,2,183,'12/6/2004',4,1721),
	(113,2,2,89,'12/6/2004',6,2560),
	(113,2,2,36,'12/5/2004',6.5,3000),
	(113,2,2,36,'12/4/2004',6,0),
	(113,2,2,3,'12/2/2004',7,2904),
	(102,2,2,2,'12/6/2004',6,0),
	(178,2,2,183,'12/7/2004',3,1210),
	(102,2,2,27,'12/7/2004',5,0),
	(112,2,3,18,'12/7/2004',4,0),
	(178,2,2,81,'12/8/2004',4,1710),
	(161,2,2,30,'12/8/2004',7,2905),
	(102,2,2,2,'12/8/2004',6,0),
	(178,2,2,81,'12/9/2004',3,1298),
	(161,2,2,29,'12/9/2004',4.5,1865),
	(178,2,2,34,'12/10/2004',4,1693),
	(168,2,2,31,'12/10/2004',7,0),
	(171,2,2,33,'12/7/2004',4,1800),
	(171,2,2,33,'12/8/2004',1,507),
	(171,2,2,33,'12/11/2004',6,2400),
	(161,2,1,30,'12/12/2004',4.5,1860),
	(178,2,2,183,'12/12/2004',4,1703),
	(178,2,2,81,'12/13/2004',3,1315),
	(102,2,2,142,'12/13/2004',6,0),
	(178,2,2,34,'12/14/2004',3,1275),
	(102,2,2,27,'12/14/2004',6.5,0),
	(178,2,2,183,'12/15/2004',4,1680),
	(115,2,3,5,'12/13/2004',6,2520),
	(115,2,2,5,'12/15/2004',6,2400),
	(161,2,1,30,'12/16/2004',4,1620),
	(102,2,2,23,'12/15/2004',7,0),
	(178,2,2,34,'12/16/2004',4,1677),
	(178,2,2,34,'12/17/2004',4,1650),
	(115,2,3,5,'12/17/2004',7,3084),
	(178,2,2,81,'12/19/2004',4,1689),
	(161,2,1,30,'12/19/2004',6.5,2728),
	(178,2,2,34,'12/20/2004',4.6,2100),
	(115,2,2,5,'12/18/2004',6.2,2463),
	(161,2,1,30,'12/20/2004',5.5,2280),
	(161,2,1,30,'12/21/2004',3,1260),
	(161,2,2,29,'12/21/2004',4,1654),
	(178,2,2,34,'12/21/2004',4,1678),
	(115,2,3,5,'12/21/2004',6,2520),
	(168,2,2,31,'12/21/2004',7,2858),
	(178,2,2,183,'12/22/2004',4,1657),
	(161,2,1,38,'12/22/2004',5,2040),
	(102,2,2,27,'12/22/2004',6,2520),
	(206,2,2,39,'12/20/2004',8,2932),
	(115,2,2,5,'12/23/2004',0,0),
	(115,2,2,5,'12/23/2004',0,0),
	(115,2,2,5,'12/23/2004',0,0),
	(206,2,2,39,'12/23/2004',7,2820),
	(171,2,2,33,'12/23/2004',1,420),
	(102,2,2,14,'12/23/2004',5,0),
	(161,2,1,29,'12/24/2004',5,0),
	(178,2,2,81,'12/24/2004',4,1698),
	(102,2,2,142,'12/24/2004',8,3360),
	(105,2,1,102,'12/19/2004',3,1800),
	(115,2,2,5,'12/26/2004',10.5,4500),
	(161,2,2,29,'12/26/2004',6,2520),
	(178,2,2,81,'12/27/2004',4.6,0),
	(171,2,2,33,'12/26/2004',7,3049),
	(168,2,2,31,'12/27/2004',8.5,3244),
	(102,2,2,14,'12/27/2004',7,2940),
	(115,2,2,5,'12/27/2004',0,0),
	(161,2,1,30,'12/27/2004',4.5,0),
	(161,2,1,29,'12/28/2004',5.5,0),
	(178,2,2,34,'12/28/2004',4.4,1978),
	(115,2,2,5,'12/28/2004',5,2100),
	(161,2,1,38,'12/29/2004',6,0),
	(206,2,2,52,'12/29/2004',7,2683),
	(168,2,2,31,'12/29/2004',8,0),
	(178,2,2,34,'12/29/2004',4,1808),
	(161,2,1,29,'12/30/2004',6,0),
	(178,2,2,81,'12/30/2004',2.5,1208),
	(168,2,2,31,'12/30/2004',6,2393),
	(161,2,1,30,'12/31/2004',4,1555),
	(206,2,2,39,'12/31/2004',10,3859),
	(168,2,2,31,'12/31/2004',7,2828),
	(112,2,2,18,'12/31/2004',5,2106),
	(178,2,2,183,'1/1/2005',4,1718),
	(206,2,2,52,'1/1/2005',5,1963),
	(205,2,1,48,'1/2/2005',1.84,1212),
	(115,2,2,5,'1/2/2005',0,0),
	(113,2,2,15,'1/2/2005',8,3013),
	(113,2,2,3,'1/1/2005',6.5,2708),
	(161,2,1,38,'1/2/2005',8,3120),
	(178,2,2,183,'1/2/2005',4,1578),
	(161,2,1,29,'1/3/2005',7,0),
	(115,2,3,5,'1/3/2005',5,2100),
	(178,2,2,183,'1/3/2005',5,2178),
	(206,2,2,39,'1/3/2005',10,3914),
	(113,2,2,15,'1/3/2005',7,2788),
	(178,2,2,34,'1/4/2005',5,0),
	(80,2,2,13,'1/4/2005',6,0),
	(206,2,2,52,'1/4/2005',6,2384),
	(168,2,2,31,'1/5/2005',5,1935),
	(113,2,2,3,'1/5/2005',9,3631),
	(113,2,2,21,'1/4/2005',6.5,2605),
	(80,2,2,11,'1/5/2005',3,1184),
	(115,2,3,5,'1/5/2005',8,3360),
	(171,2,2,33,'1/5/2005',4.25,1800),
	(178,2,2,183,'1/5/2005',4,0),
	(178,2,2,34,'1/6/2005',4,1573),
	(178,2,2,34,'1/6/2005',1,0),
	(161,2,1,29,'1/5/2005',5,0),
	(161,2,2,29,'1/6/2005',5,0),
	(113,2,2,36,'1/6/2005',6,2422),
	(225,2,3,47,'1/6/2005',0,0),
	(161,2,1,30,'1/7/2005',6,0),
	(161,2,2,30,'1/7/2005',5,2068),
	(171,2,2,33,'1/7/2005',5.5,2400),
	(178,2,2,183,'1/7/2005',5,2074),
	(178,2,2,81,'1/7/2005',1,0),
	(178,2,2,183,'1/8/2005',4,1802),
	(115,2,2,5,'1/7/2005',0,0),
	(161,2,2,38,'1/9/2005',5.5,0),
	(178,2,1,81,'1/9/2005',7,2889),
	(81,2,2,43,'1/7/2005',7,2880),
	(113,2,2,3,'1/9/2005',5,2081),
	(113,2,2,36,'1/8/2005',7,2676),
	(113,2,2,15,'1/7/2005',7.5,3080),
	(102,2,1,46,'1/10/2005',8,3240),
	(168,2,2,31,'1/10/2005',8,3028),
	(178,2,2,34,'1/10/2005',2,788),
	(112,2,2,25,'1/10/2005',6,2222),
	(205,2,3,167,'1/10/2005',2.24,1200),
	(161,2,2,29,'1/10/2005',6,0),
	(178,2,3,81,'1/10/2005',3,0),
	(113,2,2,3,'1/10/2005',8,3160),
	(225,2,3,24,'1/10/2005',3,0),
	(178,2,2,34,'1/11/2005',3,1248),
	(178,2,2,183,'1/11/2005',1,0),
	(81,2,2,43,'1/11/2005',9,3720),
	(206,2,2,39,'1/11/2005',5.5,2253),
	(115,2,2,5,'1/11/2005',5,2080),
	(113,2,2,17,'1/11/2005',6,2485),
	(178,2,2,81,'1/12/2005',2,807),
	(113,2,2,89,'1/12/2005',8,3142),
	(112,2,2,85,'1/11/2005',6,2495),
	(112,2,2,25,'1/12/2005',8,3136),
	(178,2,3,34,'1/12/2005',5,0),
	(168,2,2,31,'1/8/2001',4.5,1800),
	(168,2,2,31,'1/9/2001',4.5,1800),
	(168,2,2,31,'1/12/2001',5,0),
	(168,2,2,31,'1/14/2001',6,0),
	(168,2,2,31,'1/15/2001',6,0),
	(168,2,2,31,'1/16/2001',6,0),
	(168,2,2,31,'1/17/2001',6.5,0),
	(168,2,2,31,'1/19/2001',3,0),
	(168,2,2,31,'1/21/2001',8,0),
	(168,2,2,31,'1/22/2001',6,0),
	(168,2,2,31,'1/23/2001',7,0),
	(168,2,2,31,'1/25/2001',7,0),
	(168,2,2,31,'1/28/2001',8,0),
	(168,2,2,31,'1/29/2001',7,0),
	(123,2,3,10,'1/12/2005',3,1623),
	(123,2,3,49,'1/9/2005',3,1800),
	(81,2,2,63,'1/12/2005',8,3000),
	(113,2,2,17,'1/13/2005',7,2916),
	(161,2,2,38,'1/12/2005',5,0),
	(161,2,1,38,'1/13/2005',6,0),
	(112,2,2,186,'1/13/2005',7,2927),
	(178,2,2,183,'1/14/2005',5,2207),
	(225,2,3,42,'1/13/2005',2,0),
	(161,2,2,38,'1/14/2005',6,0),
	(115,2,2,5,'1/14/2005',5.5,2213),
	(112,2,2,186,'1/14/2005',10,4140),
	(161,2,1,29,'1/15/2005',5.5,0),
	(206,2,2,39,'1/14/2005',0,2700),
	(174,2,2,50,'1/15/2005',1,480),
	(112,2,2,18,'1/15/2005',6,2500),
	(81,2,2,43,'1/15/2005',6,2460),
	(81,2,2,63,'1/15/2005',3,1260),
	(178,2,2,183,'1/15/2005',5.5,2278),
	(178,2,2,34,'1/15/2005',1,0),
	(161,2,1,30,'1/16/2005',6,0),
	(178,2,2,183,'1/16/2005',4,1768),
	(113,2,2,89,'1/16/2005',7,3439),
	(113,2,2,3,'1/14/2005',10,4128),
	(113,2,2,17,'1/15/2005',7,2928),
	(112,2,2,85,'1/16/2005',7,3439),
	(161,2,1,30,'1/17/2005',6,0),
	(112,2,2,18,'1/17/2005',8,3374),
	(174,2,2,140,'1/17/2005',3,1250),
	(113,2,2,3,'1/17/2005',8,3374),
	(171,2,2,33,'1/11/2005',6,2400),
	(178,2,2,183,'1/17/2005',5.5,0),
	(113,2,2,89,'1/18/2005',8,3317),
	(174,2,3,140,'1/18/2005',4,1660),
	(206,2,2,52,'1/18/2005',6,2470),
	(206,2,2,52,'1/19/2005',7,2891),
	(161,2,2,30,'1/18/2005',7,0),
	(161,2,2,29,'1/19/2005',7,0),
	(112,2,2,25,'1/18/2005',8,3174),
	(178,2,2,81,'1/18/2005',6,2703),
	(178,2,2,183,'1/18/2005',0.5,0),
	(178,2,2,34,'1/19/2005',3,1388),
	(178,2,2,81,'1/19/2005',4.5,0),
	(161,2,2,30,'1/20/2005',7,0),
	(174,2,2,50,'1/19/2005',3,1420),
	(174,2,3,50,'1/19/2005',5,0),
	(174,2,2,140,'1/20/2005',5,2311),
	(113,2,2,15,'1/20/2005',8,3314),
	(112,2,2,18,'1/20/2005',8,3299),
	(178,2,2,81,'1/20/2005',5,2314),
	(81,2,2,63,'1/20/2005',7,2880),
	(81,2,2,43,'1/21/2005',8,3169),
	(81,2,2,63,'1/17/2005',7,2700),
	(178,2,2,34,'1/21/2005',0.5,0),
	(206,2,2,52,'1/21/2005',8.5,3477),
	(161,2,2,38,'1/21/2005',6,0),
	(112,2,2,25,'1/21/2005',6,2326),
	(123,2,1,10,'1/16/2005',2.5,2040),
	(123,2,1,49,'1/17/2005',3.2,1890),
	(123,2,1,10,'1/18/2005',3.2,1890),
	(123,2,1,49,'1/20/2005',3.2,1830),
	(161,2,2,38,'1/22/2005',7,0),
	(174,2,2,50,'1/22/2005',3,1320),
	(206,2,2,39,'1/22/2005',9.5,3600),
	(178,2,2,183,'1/22/2005',4,1654),
	(115,2,2,5,'1/22/2005',0,0),
	(161,2,1,29,'1/23/2005',6,0),
	(174,2,2,50,'1/23/2005',4.5,0),
	(178,2,2,183,'1/23/2005',5,2296),
	(175,2,2,124,'1/23/2005',5.7,2416),
	(112,2,2,25,'1/23/2005',7,2669),
	(225,2,1,47,'1/22/2005',3,0),
	(225,2,2,47,'1/23/2005',4,0),
	(113,2,2,3,'1/22/2005',7,2751),
	(113,2,2,21,'1/21/2005',8,3353),
	(113,2,2,15,'1/23/2005',7,2669),
	(178,2,2,34,'1/24/2005',3,1284),
	(175,2,2,185,'1/24/2005',3,1287),
	(161,2,2,30,'1/24/2005',6,0),
	(115,2,2,5,'1/24/2005',5.5,2220),
	(175,2,2,191,'1/24/2005',4,0),
	(178,2,3,81,'1/24/2005',4,0),
	(225,2,3,42,'1/24/2005',3,0),
	(161,2,1,30,'1/25/2005',6.5,0),
	(178,2,2,81,'1/25/2005',5,0),
	(112,2,2,18,'1/25/2005',8,3174),
	(174,2,2,140,'1/24/2005',3,1290),
	(174,2,2,50,'1/24/2005',4,0),
	(175,2,2,51,'1/25/2005',5,0),
	(115,2,2,5,'1/25/2005',6,2460),
	(206,2,2,52,'1/25/2005',10.5,4208),
	(113,2,2,21,'1/25/2005',8,3174),
	(81,2,2,43,'1/25/2005',10,4020),
	(161,2,2,38,'1/26/2005',6.5,0),
	(115,2,2,5,'1/26/2005',7,2940),
	(174,2,2,50,'1/27/2005',5,2097),
	(112,2,2,18,'1/27/2005',7,2906),
	(161,2,2,29,'1/27/2005',7,0),
	(206,2,2,39,'1/27/2005',7.5,3010),
	(113,2,2,89,'1/27/2005',7,2888),
	(206,2,2,52,'1/28/2005',8,3117),
	(123,2,3,49,'1/27/2005',3.5,1891),
	(175,2,2,185,'1/28/2005',5,2078),
	(112,2,2,85,'1/28/2005',6,2532),
	(174,2,2,50,'1/28/2005',5,2080),
	(115,2,2,5,'1/28/2005',5,2004),
	(174,2,1,50,'1/29/2005',7,2927),
	(178,2,2,34,'1/28/2005',5,2082),
	(178,2,2,81,'1/29/2005',7,2951),
	(161,2,2,38,'1/29/2005',8.5,0),
	(115,2,2,5,'1/29/2005',7,2870),
	(175,2,2,51,'1/29/2005',7,2962),
	(102,2,1,2,'1/30/2005',13,5040),
	(279,2,2,68,'1/30/2005',5,0),
	(174,2,2,50,'1/30/2005',2,840),
	(279,2,2,68,'1/26/2005',3,0),
	(279,2,2,69,'1/28/2005',5,0),
	(174,2,2,140,'1/30/2005',4,1840),
	(115,2,2,5,'1/30/2005',10,4131),
	(113,2,1,15,'1/29/2005',5,2125),
	(113,2,2,3,'1/30/2005',7,2864),
	(161,2,1,29,'1/30/2005',6.5,0),
	(81,2,2,63,'1/30/2005',12,4800),
	(123,2,2,49,'1/30/2005',5,2400),
	(112,2,2,186,'1/30/2005',7,2864),
	(174,2,2,50,'1/31/2005',5,0),
	(115,2,2,5,'1/31/2005',7,2896),
	(161,2,1,30,'2/1/2005',6.5,0),
	(178,2,2,34,'2/1/2005',1,420),
	(174,2,2,50,'2/1/2005',5,1966),
	(174,2,2,140,'2/1/2005',1,0),
	(115,2,1,5,'2/1/2005',7,2879),
	(112,2,2,85,'2/1/2005',9,0),
	(206,2,2,52,'2/2/2005',6,2612),
	(161,2,1,29,'2/2/2005',6.5,0),
	(279,2,2,69,'2/2/2005',5,0),
	(113,2,2,21,'2/2/2005',9.5,3399),
	(113,2,2,17,'2/1/2005',7,2820),
	(115,2,2,5,'2/2/2005',8,3222),
	(105,2,2,37,'1/30/2005',3,1500),
	(161,2,2,29,'2/3/2005',6,0),
	(302,2,3,65,'2/3/2005',4,0),
	(178,2,2,34,'2/3/2005',7,2971),
	(175,2,2,124,'2/3/2005',7,2968),
	(296,2,3,61,'2/3/2005',4,0),
	(296,2,3,115,'2/2/2005',2,0),
	(174,2,2,50,'2/3/2005',7,2965),
	(81,2,2,63,'2/3/2005',7,2520),
	(279,2,2,68,'2/3/2005',4,0),
	(305,2,2,64,'2/4/2005',5.5,2400),
	(205,2,2,167,'2/4/2005',2,1038),
	(302,2,2,58,'2/4/2005',2.5,0),
	(161,2,2,30,'2/4/2005',7.5,0),
	(115,2,2,5,'2/4/2005',8,3137),
	(112,2,2,186,'2/3/2005',7,2913),
	(206,2,2,52,'2/4/2005',6,2388),
	(113,2,2,17,'2/3/2005',7,2903),
	(161,2,2,38,'2/5/2005',6,0),
	(279,2,2,68,'2/5/2005',4,0),
	(123,2,2,10,'2/3/2005',4.5,2072),
	(123,2,2,49,'2/5/2005',4,2028),
	(296,2,1,62,'2/5/2005',6,2490),
	(112,2,2,186,'2/5/2005',6.5,2724),
	(206,2,2,52,'2/5/2005',5,2040),
	(161,2,1,29,'2/6/2005',6.5,0),
	(279,2,2,69,'2/6/2005',5,0),
	(178,2,2,34,'2/7/2005',5,2400),
	(174,2,2,50,'2/6/2005',2,0),
	(175,2,2,191,'2/7/2005',5,0),
	(174,2,2,140,'2/6/2005',4,1860),
	(112,2,2,18,'2/6/2005',6,0),
	(113,2,2,3,'2/5/2005',8,3262),
	(113,2,2,21,'2/6/2005',6,2329),
	(299,2,2,128,'2/7/2005',6,2651),
	(115,2,3,5,'2/7/2005',8,3260),
	(206,2,2,39,'2/7/2005',7,2908),
	(205,2,1,167,'2/8/2005',2.5,1500),
	(309,2,2,118,'2/8/2005',6.5,2511),
	(206,2,2,52,'2/8/2005',8.5,3466),
	(115,2,2,5,'2/8/2005',6.25,2544),
	(311,2,1,71,'1/1/2005',4,2100),
	(311,2,2,71,'1/10/2005',2,1008),
	(311,2,2,71,'1/12/2005',2.5,1263),
	(161,2,1,30,'2/8/2005',6.5,0),
	(161,2,1,29,'2/9/2005',6.5,0),
	(174,2,2,140,'2/9/2005',6,2685),
	(81,2,2,43,'2/9/2005',6,2340),
	(115,2,3,5,'2/9/2005',8,3134),
	(313,2,3,72,'2/7/2005',3.2,1740),
	(313,2,3,141,'2/8/2005',2,1740),
	(112,2,2,18,'2/8/2005',10,0),
	(112,2,2,85,'2/9/2005',7,2941),
	(112,2,2,186,'2/10/2005',8,3314),
	(161,2,2,30,'2/10/2005',7.5,0),
	(289,2,2,111,'2/10/2005',7,3000),
	(81,2,2,43,'2/10/2005',9,3540),
	(115,2,3,5,'2/10/2005',7,2940),
	(206,2,2,39,'2/10/2005',8.5,3276),
	(289,2,1,111,'2/11/2005',3.5,1500),
	(296,2,2,115,'2/9/2005',6,0),
	(296,2,2,61,'2/10/2005',3.5,0),
	(161,2,2,30,'2/11/2005',7,0),
	(206,2,2,52,'2/11/2005',7,2696),
	(115,2,3,5,'2/11/2005',8,3194),
	(81,2,2,43,'2/11/2005',10,3900),
	(112,2,2,186,'2/12/2005',6,2530),
	(206,2,2,39,'2/12/2005',5,2012),
	(81,2,2,43,'2/12/2005',8,3060),
	(175,2,1,124,'2/13/2005',7,2937),
	(309,2,1,118,'2/13/2005',10,3960),
	(289,2,3,55,'2/12/2005',3.5,1500),
	(113,2,3,17,'2/13/2005',10,4040),
	(113,2,1,15,'2/12/2005',6,2529),
	(113,2,2,89,'2/10/2005',8,3374),
	(113,2,2,3,'2/9/2005',7,2933),
	(113,2,2,36,'2/8/2005',8,3214),
	(81,2,3,63,'2/13/2005',5,1980),
	(313,2,3,141,'2/2/2005',2.2,1800),
	(313,2,3,73,'2/3/2005',3.3,1800),
	(313,2,1,72,'2/5/2005',6.7,3600),
	(178,2,2,34,'2/14/2005',7.5,3137),
	(115,2,3,5,'2/13/2005',13,5400),
	(115,2,2,5,'2/12/2005',7,2880),
	(174,2,2,140,'2/14/2005',7,2880),
	(318,2,2,74,'2/14/2005',6,2687),
	(115,2,2,5,'2/14/2005',5,2062),
	(309,2,4,136,'2/14/2005',0,0),
	(175,2,2,185,'2/14/2005',7,2883),
	(161,2,1,38,'2/15/2005',7.5,0),
	(206,2,2,39,'2/15/2005',7,2671),
	(318,2,2,74,'2/15/2005',7,0),
	(103,2,2,1,'2/14/2005',9,0),
	(103,2,2,1,'2/13/2005',10,0),
	(103,2,2,1,'2/15/2005',6,2520),
	(112,2,2,85,'2/15/2005',10,0),
	(205,2,2,48,'2/15/2005',2.5,1500),
	(309,2,2,136,'2/16/2005',6,2250),
	(318,2,2,74,'2/16/2005',7,0),
	(115,2,2,5,'2/16/2005',8,3308),
	(311,2,2,71,'2/16/2005',2,1094),
	(311,2,2,71,'1/13/2005',2,1043),
	(311,2,2,71,'1/19/2005',4,1746),
	(311,2,2,71,'1/26/2005',2,1008),
	(311,2,2,71,'2/1/2005',3.5,1601),
	(311,2,2,71,'2/2/2005',4,1709),
	(311,2,2,71,'2/6/2005',5,2939),
	(311,2,2,71,'2/8/2005',2,912),
	(311,2,2,71,'2/10/2005',2,1102),
	(161,2,2,29,'2/16/2005',9,0),
	(81,2,2,63,'2/15/2005',8,2940),
	(81,2,2,43,'2/16/2005',10,3900),
	(289,2,1,111,'2/15/2005',2,840),
	(289,2,2,103,'2/15/2005',6.5,0),
	(103,2,2,1,'2/16/2005',6.5,0),
	(161,2,2,29,'2/17/2005',6.5,0),
	(112,2,2,186,'2/17/2005',6,2413),
	(206,2,2,39,'2/17/2005',7,2747),
	(289,2,1,104,'2/17/2005',2,0),
	(174,2,2,50,'2/17/2005',1.5,673),
	(174,2,2,140,'2/17/2005',1.5,0),
	(296,2,2,61,'2/17/2005',5.5,2334),
	(302,2,2,57,'2/17/2005',5.5,2334),
	(279,2,2,68,'2/17/2005',1.5,0),
	(115,2,3,5,'2/17/2005',2,840),
	(205,2,1,48,'2/18/2005',2.61,1500),
	(309,2,1,118,'2/18/2005',6,2268),
	(318,2,2,74,'2/18/2005',7,0),
	(174,2,2,50,'2/18/2005',7,2970),
	(175,2,2,124,'2/18/2005',7,0),
	(161,2,2,38,'2/18/2005',6.5,0),
	(115,2,2,5,'2/18/2005',8,3300),
	(179,2,2,76,'2/18/2005',7,0),
	(112,2,2,25,'2/19/2005',8,3278),
	(175,2,2,124,'2/19/2005',4.5,0),
	(206,2,2,52,'2/18/2005',6,2389),
	(279,2,2,69,'2/19/2005',2,0),
	(113,2,3,21,'2/19/2005',6,2598),
	(113,2,2,21,'2/17/2005',6,2415),
	(113,2,2,21,'2/15/2005',8,3240),
	(319,2,2,75,'2/19/2005',10,4380),
	(81,2,2,43,'2/19/2005',5,2040),
	(309,2,1,118,'2/20/2005',10,3756),
	(112,2,2,25,'2/20/2005',5,2058),
	(175,2,2,51,'2/20/2005',7,3030),
	(81,2,2,63,'2/20/2005',10,3900),
	(161,2,1,38,'2/20/2005',5,0),
	(161,2,2,30,'2/21/2005',7.5,0),
	(175,2,1,124,'2/21/2005',6,2646),
	(178,2,2,34,'2/21/2005',7,2958),
	(81,2,1,43,'2/21/2005',4.5,1800),
	(279,2,2,68,'2/21/2005',3,0),
	(324,2,1,77,'2/21/2005',7,2804),
	(324,2,1,77,'2/20/2005',6,2306),
	(311,2,2,71,'2/17/2005',7,3246),
	(311,2,3,71,'2/21/2005',4,1766),
	(112,2,2,25,'2/21/2005',9.5,3850),
	(309,2,4,136,'2/22/2005',0,0),
	(327,2,1,78,'2/22/2005',10,3910),
	(327,2,1,78,'2/21/2005',10.5,4140),
	(161,2,1,30,'2/22/2005',7.5,0),
	(296,2,2,62,'2/22/2005',6.5,2952),
	(206,2,2,39,'2/22/2005',8,3122),
	(103,2,2,1,'2/21/2005',6,0),
	(103,2,2,1,'2/17/2005',7,0),
	(103,2,2,1,'2/19/2005',7.5,3180),
	(324,2,1,77,'2/23/2005',6,2381),
	(314,2,2,82,'2/17/2005',5,0),
	(279,2,1,69,'2/23/2005',4,0),
	(113,2,2,17,'2/20/2005',9,3667),
	(113,2,2,3,'2/21/2005',9.5,3851),
	(311,2,3,71,'2/22/2005',2,1037),
	(102,2,2,23,'2/23/2005',8,3300),
	(112,2,2,25,'2/23/2005',7,2935),
	(115,2,4,5,'2/23/2005',7,2878),
	(161,2,2,38,'2/23/2005',6.5,0),
	(289,2,1,55,'2/23/2005',2.5,1200),
	(289,2,2,103,'2/18/2005',4,1800),
	(313,2,3,73,'2/23/2005',5,3037),
	(113,2,2,15,'2/23/2005',7,2931),
	(313,2,2,73,'1/1/2005',5,0),
	(313,2,2,73,'1/2/2005',2.1,0),
	(313,2,2,72,'1/3/2005',3.2,0),
	(313,2,2,73,'1/4/2005',2.1,0),
	(313,2,2,141,'1/5/2005',3,0),
	(313,2,2,141,'1/6/2005',2.1,0),
	(313,2,2,141,'1/8/2005',7.2,0),
	(313,2,2,141,'1/9/2005',2.1,0),
	(313,2,2,73,'1/10/2005',3.2,0),
	(313,2,2,141,'1/11/2005',2,0),
	(313,2,2,72,'1/13/2005',2.4,0),
	(313,2,2,97,'1/15/2005',14,0),
	(313,2,2,97,'1/16/2005',2.1,0),
	(313,2,2,141,'1/17/2005',3.1,0),
	(313,2,2,97,'1/18/2005',2.3,0),
	(313,2,2,72,'1/19/2005',3.1,0),
	(313,2,2,73,'1/20/2005',2.2,0),
	(313,2,2,141,'1/22/2005',7,0),
	(313,2,2,73,'1/23/2005',2.1,0),
	(313,2,2,141,'1/24/2005',3.3,0),
	(313,2,2,141,'1/25/2005',2,0),
	(313,2,2,97,'1/27/2005',3,0),
	(313,2,2,73,'1/30/2005',1.5,0),
	(313,2,2,72,'1/31/2005',3.2,0),
	(206,2,2,39,'2/24/2005',6,2301),
	(174,2,2,50,'2/24/2005',1.5,707),
	(174,2,2,140,'2/24/2005',1.5,0),
	(318,2,2,74,'2/22/2005',8,0),
	(179,2,2,76,'2/24/2005',4,1547),
	(179,2,2,76,'2/24/2005',3,0),
	(161,2,2,30,'2/24/2005',6.5,0),
	(115,2,3,5,'2/24/2005',5,2013),
	(309,2,1,118,'2/25/2005',5,1827),
	(279,2,1,69,'2/25/2005',3,0),
	(324,2,1,77,'2/25/2005',4,1602),
	(161,2,1,29,'2/25/2005',9,0),
	(206,2,2,52,'2/25/2005',8,3070),
	(319,2,2,75,'2/25/2005',8,3360),
	(179,2,2,76,'2/25/2005',6,0),
	(313,2,3,73,'2/25/2005',3.3,1800),
	(174,2,1,50,'2/26/2005',8,3462),
	(279,2,2,69,'2/26/2005',2,0),
	(115,2,3,5,'2/26/2005',8,3300),
	(206,2,2,39,'2/26/2005',7,2787),
	(175,2,2,185,'2/27/2005',7,2955),
	(179,2,2,76,'2/27/2005',6,0),
	(102,2,2,14,'2/27/2005',10,4200),
	(103,2,2,1,'2/27/2005',6,2340),
	(103,2,2,1,'2/23/2005',7,0),
	(103,2,2,1,'2/24/2005',4.5,1800),
	(161,2,1,29,'2/26/2005',5,0),
	(161,2,1,30,'2/27/2005',5,0),
	(309,2,1,192,'2/27/2005',6,2278),
	(102,2,2,46,'2/28/2005',8,3240),
	(102,2,2,14,'3/2/2005',4,1590),
	(102,2,1,101,'3/3/2005',2,820),
	(320,2,1,84,'2/28/2005',1,1080),
	(320,2,1,84,'2/27/2005',2,1800),
	(320,2,1,84,'2/25/2005',2,1800),
	(320,2,1,84,'2/26/2005',2,1800),
	(205,2,1,48,'2/28/2005',2,1200),
	(123,2,2,10,'2/27/2005',5.5,2783),
	(123,2,2,49,'2/26/2005',5,2469),
	(112,2,2,85,'2/26/2005',7,2903),
	(112,2,2,25,'2/27/2005',8,3276),
	(313,2,2,73,'2/28/2005',5,3360),
	(161,2,2,38,'2/28/2005',6,0),
	(81,2,2,43,'3/2/2005',9,3540),
	(81,2,2,63,'3/3/2005',8,3120),
	(81,2,2,43,'3/5/2005',7,2700),
	(174,2,2,140,'2/28/2005',7,2969),
	(175,2,2,51,'2/28/2005',7,2973),
	(299,2,2,66,'2/28/2005',7,2910),
	(299,2,2,129,'2/27/2005',6.5,2850),
	(299,2,2,70,'2/25/2005',5.25,2340),
	(299,2,2,129,'2/22/2005',4,1560),
	(206,2,2,39,'2/28/2005',6,2366),
	(309,2,4,67,'3/1/2005',0,0),
	(313,2,3,97,'3/1/2005',5.5,3360),
	(81,2,1,63,'3/1/2005',4,1620),
	(320,2,2,84,'3/1/2005',0,0),
	(320,2,1,84,'3/2/2005',2,1800),
	(296,2,2,61,'3/2/2005',6.5,2730),
	(309,2,4,192,'3/2/2005',0,0),
	(179,2,2,76,'3/2/2005',4,0),
	(161,2,2,30,'3/1/2005',5.5,0),
	(161,2,2,29,'3/2/2005',5.5,0),
	(112,2,2,186,'3/2/2005',9,3652),
	(115,2,4,5,'3/1/2005',0,0),
	(313,2,3,97,'3/2/2005',5.6,3314),
	(113,2,2,21,'3/2/2005',9,3652),
	(205,2,2,167,'3/2/2005',2.25,900),
	(206,2,2,52,'3/1/2005',8,3267),
	(206,2,2,39,'3/2/2005',6,2324),
	(174,2,2,140,'3/3/2005',1.5,690),
	(174,2,2,140,'3/3/2005',2.5,0),
	(179,2,2,76,'3/3/2005',6,0),
	(299,2,2,66,'3/1/2005',8.5,3390),
	(112,2,2,85,'3/3/2005',8,3360),
	(333,2,2,96,'3/3/2005',7,2820),
	(333,2,1,94,'3/3/2005',4,1620),
	(309,2,4,118,'3/3/2005',0,0),
	(113,2,2,36,'3/3/2005',8,3360),
	(113,2,2,3,'2/26/2005',6,2566),
	(113,2,2,15,'2/27/2005',8,3157),
	(113,2,2,15,'2/28/2005',8,2810),
	(320,2,1,84,'3/4/2005',2,1800),
	(103,2,2,1,'3/3/2005',6,2580),
	(103,2,2,1,'3/2/2005',6,2520),
	(103,2,2,1,'3/1/2005',6,0),
	(309,2,1,107,'3/4/2005',6,2304),
	(179,2,2,76,'3/4/2005',7,0),
	(333,2,2,91,'2/28/2005',10.5,4320),
	(205,2,3,167,'3/4/2005',4.38,2400),
	(333,2,2,90,'3/2/2005',8.5,3513),
	(296,2,2,61,'3/4/2005',7.5,3221),
	(313,2,2,72,'3/5/2005',5.5,3481),
	(179,2,2,76,'3/5/2005',7,0),
	(112,2,2,186,'3/5/2005',6,2504),
	(161,2,2,30,'3/3/2005',5.5,0),
	(161,2,2,38,'3/4/2005',5,0),
	(161,2,2,30,'3/5/2005',5.5,0),
	(161,2,2,30,'3/6/2005',5.5,0),
	(206,2,2,39,'3/3/2005',7,2700),
	(206,2,2,52,'3/5/2005',8,3089),
	(309,2,1,107,'3/6/2005',10,3783),
	(302,2,2,65,'3/6/2005',5,2133),
	(115,2,2,5,'3/6/2005',7.5,3300),
	(179,2,2,76,'3/6/2005',6,0),
	(337,2,2,108,'2/28/2005',8,3600),
	(337,2,2,99,'3/1/2005',8,3360),
	(112,2,2,25,'3/6/2005',10,4136),
	(175,2,2,51,'3/6/2005',2,0),
	(175,2,2,51,'3/6/2005',4,0),
	(175,2,1,191,'3/7/2005',5,2116),
	(279,2,2,69,'3/7/2005',3,0),
	(289,2,1,103,'3/7/2005',1,600),
	(289,2,2,104,'3/7/2005',3,1620),
	(333,2,3,95,'3/7/2005',8,3196),
	(179,2,2,76,'3/7/2005',6,0),
	(103,2,2,1,'3/7/2005',9.5,0),
	(103,2,2,1,'3/6/2005',2,0),
	(103,2,2,1,'3/5/2005',6,0),
	(112,2,2,25,'3/7/2005',9.5,0),
	(81,2,2,63,'3/7/2005',9.5,0),
	(309,2,2,192,'3/8/2005',6,2295),
	(206,2,2,52,'3/6/2005',6,2383),
	(81,2,2,63,'3/8/2005',8,3300),
	(337,2,2,99,'3/8/2005',10,4200),
	(112,2,2,18,'3/8/2005',8,3306),
	(179,2,2,76,'3/8/2005',2.25,900),
	(115,2,3,5,'3/8/2005',7.9,3300),
	(103,2,2,1,'3/8/2005',7.5,3180),
	(313,2,3,73,'3/8/2005',5.6,3264),
	(175,2,2,51,'3/8/2005',4.25,0),
	(179,2,2,76,'3/9/2005',1,0),
	(179,2,2,76,'3/9/2005',2,0),
	(333,2,1,94,'3/9/2005',7,2930),
	(333,2,3,94,'3/9/2005',4,1666),
	(309,2,4,118,'3/10/2005',0,0),
	(105,2,2,102,'3/4/2005',3,1500),
	(289,2,1,103,'3/10/2005',1.5,900),
	(175,2,2,124,'3/10/2005',5.5,0),
	(179,2,2,76,'3/10/2005',6,0),
	(337,2,2,108,'3/10/2005',10,4260),
	(313,2,3,97,'3/10/2005',5.5,3269),
	(103,2,2,1,'3/10/2005',6,0),
	(179,2,2,76,'3/11/2005',6,0),
	(175,2,2,51,'3/11/2005',1,0),
	(175,2,2,124,'3/11/2005',4.25,0),
	(299,2,2,128,'3/7/2005',7,2895),
	(299,2,2,129,'3/10/2005',6,2640),
	(333,2,1,116,'3/10/2005',6,2387),
	(333,2,2,96,'3/10/2005',6,2435),
	(179,2,2,76,'3/12/2005',5,0),
	(309,2,1,107,'3/11/2005',5,0),
	(206,2,2,52,'3/8/2005',7,2760),
	(206,2,2,39,'3/10/2005',8,3120),
	(206,2,2,39,'3/11/2005',10,3780),
	(206,2,2,52,'3/12/2005',7,2698),
	(313,2,1,141,'3/12/2005',5.6,3525),
	(337,2,2,98,'3/12/2005',10,4200),
	(296,2,3,62,'3/12/2005',6.5,2479),
	(299,2,2,70,'3/13/2005',5,2219),
	(175,2,2,185,'3/13/2005',6,0),
	(175,2,2,51,'3/12/2005',10,0),
	(296,2,2,115,'3/13/2005',9.5,4200),
	(179,2,2,76,'3/13/2005',7,0),
	(333,2,3,90,'3/12/2005',9.5,3853),
	(115,2,2,5,'3/13/2005',8.2,3300),
	(309,2,1,192,'3/13/2005',10,4052),
	(113,2,3,89,'3/13/2005',12,5040),
	(123,2,2,49,'3/13/2005',5,2822),
	(179,2,2,76,'3/14/2005',6,0),
	(313,2,3,72,'3/14/2005',5.4,3480),
	(175,2,2,124,'3/14/2005',1,418),
	(126,2,2,93,'3/10/2005',8,3170),
	(175,2,3,191,'3/14/2005',2.2,912),
	(112,2,2,25,'3/10/2005',6,0),
	(112,2,2,18,'3/13/2005',7,0),
	(112,2,2,186,'3/12/2005',3,0),
	(206,2,2,39,'3/14/2005',8.5,3303),
	(309,2,1,136,'3/15/2005',6,2330),
	(289,2,2,104,'3/15/2005',4,0),
	(302,2,3,65,'3/15/2005',5.5,0),
	(115,2,3,5,'3/15/2005',8,3300),
	(179,2,2,76,'3/15/2005',7,0),
	(337,2,2,99,'3/15/2005',10,4200),
	(112,2,2,85,'3/15/2005',10,4028),
	(313,2,3,72,'3/15/2005',3.5,2160),
	(123,2,2,49,'3/8/2005',4,2040),
	(123,2,2,10,'3/12/2005',4.5,2340),
	(352,2,2,157,'3/15/2005',9,3027),
	(179,2,2,76,'3/16/2005',6.5,0),
	(206,2,2,39,'3/16/2005',8,3064),
	(296,2,3,115,'3/16/2005',6.5,2712),
	(352,2,2,106,'3/16/2005',10,3242),
	(112,2,2,25,'3/17/2005',6,2334),
	(115,2,2,5,'3/17/2005',8.1,3300),
	(123,2,2,49,'3/17/2005',3,1674),
	(179,2,2,76,'3/17/2005',7,0),
	(337,2,2,148,'3/17/2005',8,3600),
	(296,2,2,115,'3/17/2005',7.5,3120),
	(175,2,2,185,'3/17/2005',1,403),
	(175,2,2,185,'3/16/2005',1,0),
	(175,2,2,191,'3/15/2005',1,0),
	(175,2,2,124,'3/15/2005',6.4,0),
	(333,2,2,90,'3/17/2005',8.25,3400),
	(349,2,2,112,'3/17/2005',4.5,1980),
	(313,2,3,141,'3/17/2005',7.5,4669),
	(174,2,2,50,'3/17/2005',1,403),
	(174,2,2,140,'3/17/2005',4,1832),
	(174,2,2,50,'3/16/2005',4,0),
	(174,2,2,50,'3/15/2005',3,0),
	(174,2,2,50,'3/14/2005',3,1391),
	(352,2,2,106,'3/17/2005',6,2302),
	(174,2,2,140,'3/18/2005',1,423),
	(174,2,2,140,'3/18/2005',4,1745),
	(296,2,2,61,'3/18/2005',2,0),
	(296,2,3,115,'3/18/2005',6,0),
	(175,2,2,51,'3/18/2005',1,0),
	(175,2,1,51,'3/19/2005',10.5,4601),
	(313,2,1,72,'3/19/2005',5.6,3434),
	(352,2,2,106,'3/18/2005',5,2042),
	(352,2,1,106,'3/19/2005',9,3784),
	(352,2,4,157,'3/20/2005',0,0),
	(112,2,2,18,'3/19/2005',7,2844),
	(296,2,3,115,'3/19/2005',6.5,2554),
	(333,2,2,96,'3/19/2005',8.5,3420),
	(296,2,2,61,'3/20/2005',7.25,3128),
	(179,2,2,76,'3/20/2005',7,0),
	(115,2,2,5,'3/20/2005',8,3300),
	(174,2,2,140,'3/20/2005',5,0),
	(337,2,2,99,'3/20/2005',8,3600),
	(103,2,2,1,'3/20/2005',7,0),
	(103,2,1,1,'3/19/2005',6,0),
	(103,2,2,1,'3/18/2005',6,0),
	(103,2,2,1,'3/11/2005',6,0),
	(103,2,2,1,'3/12/2005',6,0),
	(103,2,2,1,'3/13/2005',7,0),
	(113,2,2,17,'3/20/2005',8.5,3388),
	(113,2,2,21,'3/19/2005',7,2840),
	(113,2,2,36,'3/17/2005',6,2417),
	(113,2,2,21,'3/16/2005',9.5,3898),
	(113,2,2,89,'3/14/2005',7,2917),
	(113,2,2,36,'3/7/2005',9.5,0),
	(113,2,2,36,'3/8/2005',8,3180),
	(115,2,3,5,'3/21/2005',8,3310),
	(113,2,2,21,'3/6/2005',10,4138),
	(113,2,1,3,'3/5/2005',6,2504),
	(81,2,2,63,'3/21/2005',6,2400),
	(296,2,3,62,'3/21/2005',6.5,2676),
	(299,2,2,128,'3/17/2005',7.5,3120),
	(314,2,2,83,'3/20/2005',7,2645),
	(314,2,2,82,'3/18/2005',3.5,1355),
	(314,2,2,83,'3/16/2005',9,3855),
	(314,2,2,82,'3/14/2005',5,0),
	(314,2,2,83,'3/12/2005',3,1046),
	(314,2,2,82,'3/13/2005',6.5,2611),
	(313,2,3,73,'3/21/2005',6.5,4080),
	(179,2,2,76,'3/21/2005',6,0),
	(175,2,2,124,'3/21/2005',1,397),
	(175,2,2,185,'3/22/2005',1,0),
	(81,2,2,63,'3/22/2005',6,2400),
	(179,2,1,76,'3/22/2005',5,0),
	(112,2,2,85,'3/22/2005',7,2810),
	(349,2,2,112,'3/21/2005',8,3480),
	(313,2,3,73,'3/22/2005',4.8,2940),
	(179,2,1,76,'3/23/2005',8.2,0),
	(352,2,2,166,'3/22/2005',7,2777),
	(352,2,2,106,'3/21/2005',5,1946),
	(161,2,2,30,'3/21/2005',5.5,0),
	(161,2,2,38,'3/22/2005',5.5,0),
	(161,2,2,29,'3/23/2005',6.5,0),
	(174,2,2,140,'3/23/2005',1,435),
	(174,2,1,140,'3/22/2005',1.5,0),
	(358,2,2,143,'3/21/2005',9,3402),
	(302,2,2,65,'3/23/2005',5,0),
	(175,2,2,185,'3/23/2005',1,435),
	(313,2,3,141,'3/23/2005',4.5,3000),
	(337,2,2,152,'3/23/2005',10,4200),
	(81,2,2,63,'3/23/2005',6.5,2520),
	(352,2,2,166,'3/23/2005',7.6,3054),
	(179,2,2,76,'3/24/2005',5,0),
	(161,2,2,38,'3/24/2005',7,0),
	(175,2,2,185,'3/24/2005',1,425),
	(205,2,3,48,'3/24/2005',3,1297),
	(351,2,2,113,'3/24/2005',5.5,2105),
	(115,2,2,5,'3/24/2005',8.01,3300),
	(161,2,3,29,'3/24/2005',6.5,0),
	(174,2,1,50,'3/25/2005',6,0),
	(324,2,2,77,'3/23/2005',5,1977),
	(324,2,2,77,'3/24/2005',5,2008),
	(324,2,2,77,'3/25/2005',4.5,0),
	(81,2,2,43,'3/25/2005',7,2700),
	(175,2,2,124,'3/25/2005',7,2978),
	(313,2,3,73,'3/25/2005',5,3193),
	(352,2,2,106,'3/25/2005',8,3240),
	(179,2,2,76,'3/26/2005',6,0),
	(299,2,2,86,'3/25/2005',5.5,2666),
	(352,2,3,166,'3/26/2005',10,3960),
	(174,2,2,140,'3/27/2005',7,2940),
	(161,2,2,29,'3/25/2005',4,0),
	(161,2,1,30,'3/26/2005',7,0),
	(161,2,2,38,'3/26/2005',4,0),
	(161,2,2,30,'3/27/2005',4,0),
	(175,2,2,191,'3/27/2005',6,2611),
	(103,2,3,1,'3/27/2005',5,0),
	(103,2,2,1,'3/25/2005',6,0),
	(103,2,2,1,'3/24/2005',5,0),
	(103,2,2,1,'3/22/2005',6,0),
	(333,2,2,96,'3/24/2005',5.5,2168),
	(113,2,3,36,'3/27/2005',5,2261),
	(113,2,2,89,'3/25/2005',6,2491),
	(113,2,3,21,'3/24/2005',2,844),
	(113,2,1,89,'3/24/2005',6,2414),
	(113,2,2,17,'3/22/2005',7,2912),
	(112,2,2,85,'3/24/2005',8,3239),
	(112,2,2,186,'3/25/2005',6,2470),
	(112,2,2,186,'3/27/2005',5,2052),
	(302,2,2,65,'3/28/2005',5,1980),
	(313,2,3,72,'3/28/2005',3,1994),
	(179,2,2,76,'3/28/2005',8.5,0),
	(115,2,3,5,'3/28/2005',8.13,3300),
	(115,2,2,5,'3/25/2005',7,0),
	(175,2,2,191,'3/28/2005',1,409),
	(115,2,2,5,'3/26/2005',0,0),
	(115,2,2,5,'3/26/2005',0,0),
	(206,2,2,39,'3/21/2005',9,3447),
	(206,2,2,39,'3/22/2005',10,3921),
	(206,2,2,39,'3/24/2005',7,2700),
	(206,2,2,39,'3/18/2005',6,0),
	(206,2,2,52,'3/19/2005',5,0),
	(206,2,2,39,'3/20/2005',7,0),
	(112,2,2,85,'3/28/2005',8,3329),
	(363,2,3,123,'3/28/2005',7,2520),
	(205,2,1,167,'3/29/2005',3.75,1816),
	(352,2,2,166,'3/28/2005',5.4,2083),
	(314,2,2,83,'3/25/2005',3.5,1356),
	(113,2,2,89,'3/28/2005',8,3279),
	(102,2,1,23,'3/28/2005',6,2520),
	(102,2,2,27,'3/26/2005',7,2820),
	(309,2,1,107,'3/28/2005',6,2340),
	(175,2,2,124,'3/29/2005',1,415),
	(309,2,2,67,'3/26/2005',7,2880),
	(175,2,2,51,'3/29/2005',0.5,0),
	(309,2,2,118,'3/27/2005',3,0),
	(179,2,2,76,'3/29/2005',9,0),
	(174,2,2,50,'3/29/2005',7,2992),
	(174,2,2,50,'3/29/2005',1.5,0),
	(313,2,2,97,'3/29/2005',5,2903)
	GO
