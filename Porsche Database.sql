drop database porsche_data;
create database porsche_data;
use porsche_data;

create table Porsche (founder varchar(20), headquarter varchar(24), ceo_ssn varchar(3), primary key(headquarter));
create table Vehicle (serialno int, warrenty varchar(10), availability varchar(3), price varchar(16), horsepower int, torque int, vehicletype varchar(20), fuelenginerbm int, electricenginerbm int, distanceonbattary varchar(21), 918spydermodels varchar(12), battarysize varchar(10), chargingtime varchar(10), distanceoncharge varchar(21), taycanmodels varchar(10), fueltype varchar(14), fuelconsumption varchar(18), sizeoftrunk varchar(12), numberofseats int, coupe_flag int, 718models varchar(10), 911models varchar(10), sedanflag int, panameramodels varchar(10), suvflag int, macanmodels varchar(10), cayennemodels varchar(10), primary key(serialno));
create table Vcolor (serialno int, vcolor varchar(20), primary key(serialno,vcolor), foreign key(serialno) references Vehicle(serialno));
create table Employees (efn varchar(18), emn char, eln varchar(18), edob int, essn varchar(3), egender char, salary int, status varchar(10), headquarter varchar(24), super_ssn varchar(3), primary key(essn), foreign key(super_ssn) references Employees(essn), foreign key(headquarter) references porsche(headquarter));
alter table Porsche add foreign key(ceo_ssn) references Employees(essn);
create table Factories (fid int, name varchar(14), headquarter varchar(24), primary key(fid), foreign key(headquarter) references Porsche(headquarter));
create table Flocation (fid int, flocation varchar(14), primary key(fid,flocation), foreign key(fid) references Factories(fid));
create table Make (fid int, serialno int, primary key(serialno,fid), foreign key(serialno) references Vehicle(serialno), foreign key(fid) references Factories(fid));
create table Ephone (essn varchar(3), ephone int, primary key(essn,ephone),foreign key(essn) references Employees(essn));
create table Eaddress (essn varchar(3), eaddress varchar(28), primary key(essn,eaddress),foreign key(essn) references Employees(essn));
create table Manges (essn varchar(3), fid int, primary key(essn,fid),foreign key(essn) references Employees(essn),foreign key(fid) references Factories(fid));
create table Works_in (fid int, essn varchar(3), primary key(fid,essn),foreign key(essn) references Employees(essn),foreign key(fid) references Factories(fid));
create table Customer (cfn varchar(10), cmn char, cln varchar(10), cdob int, cssn varchar(16), egender char, primary key(cssn));
create table Cphone (cssn varchar(16), cphone int, primary key(cssn,cphone),foreign key(cssn) references Customer(cssn));
create table Caddress (cssn varchar(16), caddress varchar(20), primary key(cssn,caddress),foreign key(cssn) references Customer(cssn));
create table Dealership (headquarter varchar(24), name varchar(25), did int, primary key(did), foreign key(headquarter) references Porsche(headquarter));
create table Dphone (did int, dphone int, primary key(did,dphone),foreign key(did) references Dealership(did));
create table Dlocation (did int, dlocation varchar(14), primary key(did,dlocation), foreign key(did) references Dealership(did));
create table Sale (serialno int, did int, cssn varchar(16), primary key(serialno, did,cssn), foreign key(serialno) references Vehicle(serialno), foreign key(cssn) references Customer(cssn), foreign key(did) references Dealership(did));
create table Racing (essn varchar(3), drivers varchar(30), leaders varchar(30), craces varchar(10), engineeringteam varchar(30), Sponsers varchar(16), ccars varchar(21), foreign key(essn) references Employees(essn));
create table RnD (essn varchar(3), rndsalonname varchar(18), rndsalonlocation varchar(34), rndengineers varchar(30), rndsupervisor varchar(30), foreign key(essn) references Employees(essn));

insert into Porsche (founder, headquarter) values ("Ferdinand Porsche", "stuttgart headquarters");

insert into Vehicle values (111123111,  "3Years",  "No", "1M $",   875, 1000, "Hyprid",   		     9000, 3000, "50 kilometer",  "Roadster",  "6.8 kW",  null,       null,         null,     95 or "ethanol", "30 kilo / litter", "50 liter", 2, 1, null,     null,  0, null,       0, null,  null),
                           (111123122,	"3Years",  "No", "1M $",   875, 1000, "Hyprid",   		     9000, 3000, "50 kilometer",  "Roadster",  "6.8 kW",  null,       null,         null,     95 or "ethanol", "30 kilo / litter", "50 liter", 2, 1, null,     null,  0, null,       0, null,  null),
                           (111123133,  "3Years",  "No", "1M $",   875, 1000, "Hyprid", 			 9000, 3000, "50 kilometer",  "Chapoliet", "6.8 kW",  null,	      null,	        null,	  95 or "ethanol", "30 kilo / litter", "50 liter", 2, 1, null,	  null,	 0, null,       0, null,  null),
                           (122123111,  "4Years", "Yes", "125k $", 670, 900, "Electric",			 null, null, "450 kilometer",    null,     "85 kW",	"90 min", "450 kilometer",	"GTS",	      null,	       		 null,		 "100 liter", 4, 0,	null,	  null,	 1, null,       0, null,  null),
                           (122123122,  "4Years", "Yes", "125k $", 600, 900, "Electric",  		     null, null, "450 kilometer",    null,	   "87 kW",	"90 min", "450 kilometer",	"4S",		  null,				 null,		 "100 liter", 4, 0,	null,	  null,	 1, null,       0, null,  null),
                           (122123133,  "4Years", "Yes", "125k $", 750, 900, "Electric",	 		 null, null, "450 kilometer",    null,	   "90 kW",	"90 min", "450 kilometer",	"Turbo S",    null,				 null,		 "100 liter", 4, 0,	null,	  null,	 1, null,       0, null,  null),
                           (133123111,  "2Years", "Yes", "100k $", 350, 400, "Enternal-consumbtion", 7600, null,      null,		     null, 	     null,	  null, 	  null,     	null,	     92 or 95,	 "25 kilo / litter", "150 liter", 2, 1,	"Boxter", null,  0, null,       0, null,  null),
                           (133123122,  "2Years", "Yes", "100k $", 300, 420, "Enternal-consumbtion", 7600, null,      null,		     null, 	     null,	  null,	      null,	        null,		 92 or 95,	 "25 kilo / litter", "150 liter", 2, 1,	"GTS",    null,	 0, null,       0, null,  null),
                           (133123133,  "2Years", "Yes", "100k $", 400, 450, "Enternal-consumbtion", 7600, null,      null,		     null, 	     null,	  null,	      null,     	null,		 92 or 95,   "25 kilo / litter", "150 liter", 2, 1,	"GT4 rs", null,  0, null,       0, null,  null),
					       (144123111,	"2Years", "Yes", "180k $", 400, 650, "Enternal-consumbtion", 8200, null,	  null,          null,       null,	  null,	      null,			null,	        95, 	 "20 kilo / litter", "200 liter", 2, 1,	null,  "Dakar",  0,	null,       0, null,  null),
						   (144123122,	"2Years", "Yes", "180k $", 550, 700, "Enternal-consumbtion", 8200, null,	  null,	         null,       null,    null,       null,			null,	        95,		 "20 kilo / litter", "200 liter", 2, 1,	null, "GT3 rs",  0,	null,       0, null,  null),
						   (144123133,	"2Years", "Yes", "180k $", 600, 800, "Enternal-consumbtion", 8200, null,   	  null,	         null,	     null,	  null,	      null,			null,	        95,		 "20 kilo / litter", "200 liter", 2, 1,	null, "Turbo S", 0,	null,       0, null,  null),
						   (155123111,	"2Years", "Yes", "200k $", 550, 650, "Enternal-consumbtion", 8000, null,	  null,	         null,	     null,	  null,       null,			null,	        95,		 "21 kilo / litter", "300 liter", 5, 0,	null,     null,	 1,	"4",	    0, null,  null),
						   (155123122,	"2Years", "Yes", "200k $", 600, 750, "Enternal-consumbtion", 8000, null,      null, 	     null,	     null,	  null,	      null,			null,	        95,		 "21 kilo / litter", "300 liter", 5, 0, null,	  null,  1, "Turbo",    0, null,  null),
						   (155123133,	"2Years", "Yes", "200k $", 750, 800, "Enternal-consumbtion", 8000, null,	  null,          null,	     null,	  null,	      null,			null,	        95,		 "21 kilo / litter", "300 liter", 5, 0,	null,	  null,	 1,	"E-Hyprid", 0, null,  null),
						   (166123111,	"2Years", "Yes", "150k $", 500, 650, "Enternal-consumbtion", 7800, null,	  null,	         null,	     null,	  null,	      null,			null,	        95,		 "22 kilo / litter", "450 liter", 5, 0,	null,	  null,	 0,	null,       1, null,   "S"),
						   (166123122,	"2Years", "Yes", "150k $", 600, 750, "Enternal-consumbtion", 7800, null,	  null,	         null,	     null,	  null,       null,			null,	        95,		 "22 kilo / litter", "450 liter", 5, 0,	null,	  null,	 0,	null,       1, null,  "GT"),
						   (166123133,	"2Years", "Yes", "150k $", 750, 800, "Enternal-consumbtion", 7800, null,	  null,	         null,	     null,	  null,       null,			null,	        95,		 "22 kilo / litter", "450 liter", 5, 0,	null,	  null,	 0,	null,       1, null, "E-Hyprid"),
						   (177123111,	"2Years", "Yes", "90k $",  350, 400, "Enternal-consumbtion", 7600, null,	  null,	         null,	     null,	  null,	      null, 		null,        92 or 95,	 "28 kilo / litter", "375 liter", 5, 0,	null,  	  null,	 0,	null,       1, "T",	  null),
						   (177123122,	"2Years", "Yes", "90k $",  380, 420, "Enternal-consumbtion", 7600, null,	  null,	         null,       null,	  null,	      null,			null,	     92 or 95,	 "28 kilo / litter", "375 liter", 5, 0,	null,	  null,	 0,	null,       1, "S",	  null),
						   (177123133,	"2Years", "Yes", "90k $",  400, 450, "Enternal-consumbtion", 7600, null,	  null,          null,	     null,	  null,	      null,		    null,	     92 or 95,	 "28 kilo / litter", "375 liter", 5, 0,	null,	  null,	 0,	null,       1, "GTS", null);

insert into Vcolor  values (111123111, "Black"),
						   (111123122, "Grey"),
						   (111123133, "White"),
						   (122123111, "Rose Gold"),
						   (122123122, "Blue"),
                           (122123133, "Red"),
                           (133123111, "Special color"),
                           (133123122, "Blue"),
                           (133123133, "Black"),
                           (144123111, "White"),
                           (144123122, "Grey"),
                           (144123133, "Red"),
						   (155123111, "White"),
                           (155123122, "Black"),
					 	   (155123133, "Blue"),
                           (166123111, "Black"),
                           (166123122, "White"),
                           (166123133, "Red"),
                           (177123111, "Blue"),
                           (177123122, "White"),
                           (177123133, "Grey");
                           
insert into Employees values ("Hermann",  "C",	"Baer",         1983,	"7",	"M", 10000,	"Active",	"stuttgart headquarters", null),
                            ("Donald",	  "V",	"OConnell",	    1973,	"1",	"M", 2600,	"Active",	"stuttgart headquarters", "7"),
							("Douglas",	  "L",	"Grant",        1979,	"2",	"M", 2600,	"inActive",	"stuttgart headquarters", "7"),
							("Jennifer",  "F",	"Whalen",  	    1974,	"3",	"F", 4400,	"Active",	"stuttgart headquarters", "7"),
							("Michael",	  "L",	"Hartstein",    1975,	"4",	"M", 13000,	"Active",	"stuttgart headquarters", null),
							("Pat",	      "T",	"Fay",  	    1979,	"5",	"M", 6000,	"Resigned",	"stuttgart headquarters", "7"),
							("Susan",	  "E",	"Mavris",       1976,	"6",	"F", 6500,	"Active",	"stuttgart headquarters", "7"),
							("Shelley",	  "B",	"Higgins",	    1983,	"8",	"M", 12000,	"Active",	"stuttgart headquarters", null),
							("William",	  "C",	"Gietz",	    1989,	"9",	"M", 8300,	"Active",	"stuttgart headquarters", null),
							("Oliver",	  "P",	"Blume",   	    1988,	"10",	"M", 24000,	"Active",	"stuttgart headquarters", null),
							("Neena",	  "W",	"Kochhar",      1986,	"11",	"F", 17000,	"Active",	"stuttgart headquarters", null),
							("Lex",	      "T",	"De Haan",      1986,	"12",	"F", 17000,	"inActive",	"stuttgart headquarters", null),
							("Alexander", "R",	"Hunold",       1985,	"13",	"M", 9000,	"Active",	"stuttgart headquarters", null),
							("Bruce",	  "J",	"Ernst",        1984,	"14",	"M", 6000,	"Active",	"stuttgart headquarters", "7"),
							("David",	  "H",	"Austin",       1984,	"15",	"M", 4800,	"inActive",	"stuttgart headquarters", "7"),
							("Valli",	  "F",	"Pataballa",    1990,	"16",	"F", 4800,	"Active",	"stuttgart headquarters", "7"),
							("Diana",	  "W",	"Lorentz",      1991,	"17",	"F", 4200,	"inActive",	"stuttgart headquarters", "7"),
							("Nancy",	  "P",	"Greenberg",    1990,	"18",	"F", 12000,	"Active",	"stuttgart headquarters", "7"),
							("Daniel",	  "O",	"Faviet",       1982,	"19",	"M", 9000,	"Active",	"stuttgart headquarters", null),
							("John",      "M",	"Chen",         1981,	"20",	"M", 8200,	"Active",	"stuttgart headquarters", "8"),
							("Ismael",	  "G",	"Sciarra",      1980,	"21",	"M", 7700,	"inActive",	"stuttgart headquarters", "8"),
							("Jose",      "H",	"Manuel Urman", 1982,	"22",	"M", 7800,	"Active",	"stuttgart headquarters", "8"),
							("Luis",      "C",	"Popp",     	1983,	"23",	"F", 6900,	"Active",	"stuttgart headquarters", "8"),
							("Den",	      "D",	"Raphaely", 	1986,	"24",	"F", 11000,	"Active",	"stuttgart headquarters", null),
							("Alexander", "W",	"Khoo",	        1989,	"25",	"M", 3100,	"inActive",	"stuttgart headquarters", "8"),
							("Shelli",	  "Y",	"Baida", 	    1984,	"26",	"F", 2900,	"Active",	"stuttgart headquarters", "8"),
							("Sigal",	  "G",	"Tobias",	    1990,	"27",	"M", 2800,	"inActive",	"stuttgart headquarters", "8"),
							("Guy",	      "D",	"Himuro",	    1999,	"28",	"M", 2600,	"Resigned",	"stuttgart headquarters", "8"),
							("Karen",	  "A",	"Colmenares",	1995,	"29",	"F", 2500,	"Active",	"stuttgart headquarters", "8"),
							("Matthew",	  "V",	"Weiss",	    1994,	"30",	"M", 8000,	"Active",	"stuttgart headquarters", "8"),
							("Adam",	  "C",	"Fripp",        1973,	"31",	"M", 8200,	"Active",	"stuttgart headquarters", null),
							("Payam",	  "X",	"Kaufling",	    1978,	"32",	"M", 7900,	"Active",	"stuttgart headquarters", "8"),
							("Shanta",	  "A",	"Vollman",	    1982,	"33",	"F", 6500,	"Active",	"stuttgart headquarters", "8"),
							("Kevin",	  "Q",	"Mourgos",	    1984,	"34",	"M", 5800,	"Active",	"stuttgart headquarters", "8"),
							("Julia",	  "R",	"Nayer",    	1988,	"35",	"F", 3200,	"Resigned",	"stuttgart headquarters", "8"),
							("Irene",	  "T",	"Mikkilineni",	1997,	"36",	"F", 2700,	"Resigned",	"stuttgart headquarters", "13"),
							("James",	  "U",	"Landry",   	1998,	"37",	"M", 2400,	"Active",	"stuttgart headquarters", "13"),
							("Steven",	  "I",	"Markle",   	1971,	"38",	"M", 2200,	"Active",	"stuttgart headquarters", "13"),
							("Laura",	  "K",	"Bissot",   	1987,	"39",	"F", 3300,	"Active",	"stuttgart headquarters", "13"),
							("Mozhe",	  "J",	"Atkinson",  	1990,	"40",	"F", 2800,	"Active",	"stuttgart headquarters", "13"),
							("James",	  "G",	"Marlow",   	1992,	"41",	"M", 2500,	"inActive",	"stuttgart headquarters", "13"),
							("TJ",	      "U",	"Olson",    	1995,	"42",	"M", 2100,	"Resigned",	"stuttgart headquarters", "13"),
							("Jason",	  "J",	"Mallin",   	1979,	"43",	"M", 3300,	"Active",	"stuttgart headquarters", "13"),
							("Michael",	  "I",	"Rogers", 	    1985,	"44",	"M", 2900,	"Active",	"stuttgart headquarters", "13"),
							("Ki",	      "O",	"Gee",      	1988,	"45",	"F", 2400,	",Active",	"stuttgart headquarters", "13"),
							("Hazel",	  "M",	"Philtanker",  	1980,	"46",	"F", 2200,	"inActive",	"stuttgart headquarters", "13"),
							("Renske",	  "N",	"Ladwig",   	1984,	"47",	"M", 3600,	"Resigned",	"stuttgart headquarters", "13"),
							("Stephen",	  "B",	"Stiles",   	1983,	"48",	"M", 3200,	"Active",	"stuttgart headquarters", "13"),
							("John",	  "M",	"Seo",      	1994,	"49",	"M", 2700,	"Active",	"stuttgart headquarters", "13"),
							("Joshua",	  "M",	"Patel",     	1976,	"50",	"F", 2500,	"Active",	"stuttgart headquarters", "13");


insert into Factories values (111, "Zuffenhausen", "stuttgart headquarters"),
							 (112, "Weissach",	   "stuttgart headquarters"),
							 (113, "Leipzig",	   "stuttgart headquarters"),
							 (121, "Bratislava",   "stuttgart headquarters"),
							 (122, "Shanghai",	   "stuttgart headquarters"),
							 (123, "Malaysia",	   "stuttgart headquarters");
                             
insert into Flocation values (111,	"Germany"),
							 (112,	"Germany"),
							 (113,	"Germany"),
							 (121,	"Slovakia"),
							 (122,	"China"),
							 (123,	"Malaysia");
                             
insert into Make values (111, 122123111),
						(111, 122123122),
						(111, 122123133),
						(112, 133123111),
						(112, 133123122),
						(112, 133123133),
						(113, 144123111),
						(113, 144123122),
						(113, 144123133),
						(121, 155123111),
						(121, 155123122),
						(121, 155123133),
						(122, 166123111),
						(122, 166123122),
						(122, 166123133),
						(123, 177123111),
						(123, 177123122),
						(123, 177123133);
                        
insert into Ephone values ("1",  2124567891),
						  ("2",  2124567892),
						  ("3",  2124567893),
						  ("4",  2124567894),
						  ("5",  2124567895),
						  ("6",  2124567896),
						  ("7",  2124567897),
						  ("8",  2124567898),
						  ("9",  2124567899),
						  ("10", 2124567900),
						  ("11", 2124567901),
						  ("12", 2124567902),
						  ("13", 2124567903),
						  ("14", 2124567904),
						  ("15", 2124567905),
						  ("16", 2124567906),
						  ("17", 2124567907),
						  ("18", 2124567908),
						  ("19", 2124567909),
						  ("20", 2124567910),
						  ("21", 2124567911),
						  ("22", 2124567912),
						  ("23", 2124567913),
						  ("24", 2124567914),
						  ("25", 2124567915),
						  ("26", 2124567916),
						  ("27", 2124567917),
						  ("28", 2124567918),
						  ("29", 2124567919),
						  ("30", 2124567920),
						  ("31", 2124567921),
						  ("32", 2124567922),
						  ("33", 2124567923),
						  ("34", 2124567924),
					      ("35", 2124567925),
						  ("36", 2124567926),
						  ("37", 2124567927),
						  ("38", 2124567928),
						  ("39", 2124567929),
						  ("40", 2124567930),
						  ("41", 2124567931),
						  ("42", 2124567932),
						  ("43", 2124567933),
						  ("44", 2124567934),
						  ("45", 2124567935),
						  ("46", 2124567936),
						  ("47", 2124567937),
						  ("48", 2124567938),
						  ("49", 2124567939),
						  ("50", 2124567940);
                          
insert into Eaddress values ("1", "Neuss Augustinusviertel"),
							("2", "Röhrnbach"),
							("3", "Liebenau"),
							("4", "Röhrnbach"),
							("5", "Neumünster"),
							("6", "Alkersum"),
							("7", "Neuss Augustinusviertel"),
							("8", "Alkersum"),
							("9", "Röhrnbach"),
							("10", "Neumünster"),
							("11", "Liebenau"),
							("12", "Kriftel"),
							("13", "Neuss Augustinusviertel"),
							("14", "Kriftel"),
							("15", "Roetgen"),
							("16", "Röhrnbach"),
							("17", "Alkersum"),
							("18", "Neumünster"),
							("19", "Liebenau"),
							("20", "Neuss Augustinusviertel"),
							("21", "Kriftel"),
							("22", "Röhrnbach"),
							("23", "Kriftel"),
							("24", "Alkersum"),
							("25", "Liebenau"),
							("26", "Neumünster"),
							("27", "Roetgen"),
							("28", "Röhrnbach"),
							("29", "Neuss Augustinusviertel"),
							("30", "Röhrnbach"),
							("31", "Liebenau"),
							("32", "Neumünster"),
							("33", "Kriftel"),
							("34", "Neuss Augustinusviertel"),
							("35", "Roetgen"),
							("36", "Neuss Augustinusviertel"),
							("37", "Röhrnbach"),
							("38", "Liebenau"),
							("39", "Neumünster"),
							("40", "Alkersum"),
							("41", "Liebenau"),
							("42", "Neuss Augustinusviertel"),
							("43", "Liebenau"),
							("44", "Kriftel"),
							("45", "Roetgen"),
							("46", "Liebenau"),
							("47", "Neumünster"),
							("48", "Liebenau"),
							("49", "Röhrnbach"),
							("50", "Neuss Augustinusviertel");
                            
insert into Manges values ("11", 111),
                          ("4" , 112),
						  ("9" , 113),
						  ("24", 121),
						  ("31", 122),
                          ("19", 123),
                          ("12", 111),
                          ("12", 112),
                          ("12", 113);
                          
insert into Works_in values (111, "2" ),
							(111, "5" ),
							(111, "7" ),
							(111, "8" ),
							(111, "9" ),
							(112, "13"),
							(112, "14"),
							(112, "15"),
							(112, "17"),
							(113, "20"),
							(113, "21"),
							(113, "22"),
							(113, "23"),
							(113, "25"),
							(113, "26"),
							(113, "27"),
							(113, "28"),
							(121, "30"),
							(121, "34"),
							(121, "35"),
							(121, "36"),
							(122, "40"),
							(122, "41"),
							(122, "42"),
							(122, "45"),
							(122, "46"),
							(122, "47");

UPDATE Porsche SET headquarter = "stuttgart headquarters" WHERE ceo_ssn = "10";

insert into Customer values ("Yousef",  "H", "ElSaket", 2003, "30309281400997", "M"),
							("Ahmed",   "A", "ElSayed",	2002, "30323281400997", "M"),
							("Ebrahim", "H", "Ebrahim",	2002, "30309284243247", "M"),
							("Hamsa",	"H", "Refaat",	2003, "30309282344997", "F"),
							("Hayam",	"R", "Khaled",	2001, "30309282340997", "M"),
							("Nader",	"K", "Mohamed",	2000, "30309283200997", "M"),
							("Foaad",	"D", "Sameer",	2002, "30304234400997", "M"),
							("Magdy",	"G", "Adel",	2000, "30309814324997", "M"),
							("Dalia",	"B", "Salah",	1999, "30309431400997", "F"),
							("may",     "K", "Mostafa",	2001, "30309281408000", "F");
                            
insert into Cphone values ("30309281400997",	2124564233),
						  ("30323281400997",	2124238673),
						  ("30309284243247",	2128767312),
						  ("30309282344997",	2124427432),
						  ("30309282340997",	2124565789),
						  ("30309283200997",	2124648321),
						  ("30304234400997",	2129967543),
						  ("30309814324997",	2128864225),
						  ("30309431400997",	2126569313),
						  ("30309281408000",	2128168893);
                          
insert into Caddress values ("30309281400997", "Cairo"),
	  						("30323281400997", "Cairo"),
							("30309284243247", "Alexandria"),
							("30309282344997", "Herghada"),
							("30309282340997", "Cairo"),
							("30309283200997", "Cairo"),
							("30304234400997", "Alexanderia"),
							("30309814324997", "Herghada"),
							("30309431400997", "Cairo"),
							("30309281408000", "Alexandria");
                            
insert into Dealership values ("stuttgart headquarters", "Porsche Showroom Zayed",	   201),
							  ("stuttgart headquarters", "Porsche Centre Abu-Rawash", 202),
							  ("stuttgart headquarters", "Porsche Centre Katameya",   203);
                              
insert into Dphone values (201, 2124567800),
						  (201, 2124567900),
						  (202, 2124568000),
						  (202, 2124568100),
						  (203, 2124568200),
						  (203, 2124568300);
                          
insert into Dlocation values (201, "Zeyad"),
							 (202, "Abu-Rawash"),
							 (203, "Katameya");
                             
insert into Sale values (122123111,	201, "30309283200997"),
						(122123122,	202, "30309282340997"),
						(122123133,	203, "30309281400997"),
						(133123111,	201, "30309284243247"),
						(133123122,	202, "30309281408000"),
						(133123133,	203, "30309281400997"),
						(144123111,	201, "30323281400997"),
						(144123122,	202, "30304234400997"),
						(144123133,	203, "30309282344997"),
						(155123111,	201, "30309282340997"),
						(155123122,	202, "30309431400997"),
						(155123133,	203, "30309281400997"),
						(166123111,	201, "30309281408000"),
						(166123122,	202, "30309284243247"),
						(166123133,	203, "30309814324997"),
						(177123111,	201, "30309281400997"),
						(177123122,	202, "30309282344997"),
						(177123133,	203, "30309431400997");
                        
insert into Racing values ("37", "Max Versteppen",	   "Yasso M Godaliz",   "F1",	 "Ralf Klose",	    "Redpull Racing", "F1 car"),
						  ("48", "luis Hamelton",	   "Yasso M Godaliz",   "F1",  	 "Aybak Borak",	    "Firelly",        "F1 car"),
						  ("32", "Stephane Ratel",	   "Josef Y Needy",	    "GT2",	 "Joachim Schaper", "Mobil 1",	      "911 GT2"),
						  ("39", "Mauro Casadei",      "Josef Y Needy",	    "GT2",	 "Guan Chew",	    "IBM",	          "911 GT2 rs"),
						  ("49", "Aurelijus Rusteika", "Christoph Ulrich",  "GT3",	 "Tim Munstermann", "Puma",	          "911 GT3"),
						  ("38", "Sehdi Sarmini",	   "Christoph Ulrich",  "GT3",	 "Malte Radmann",   "AT&T",	          "911 GT3 rs"),
						  ("50", "Einar Thorsen",	   "Klaus Angerhofer",  "Lmans", "Ferdinand Piëch", "Semiens",	      "918 GT"),
						  ("16", "Kris Rosenberger",	"Klaus Angerhofer", "Lmans", "Hans Mezger",	    "Power Shell",	  "918 Track");
                          
insert into RnD values ("38", "Zuffenhausen", "Weissach, Germany", "Burt Rutan",	     "Alexander Meissner"),
                       ("29", "Zuffenhausen", "Weissach, Germany", "Ada Lovelace",	     "Alexander Meissner"),
                       ("33", "Zuffenhausen", "Weissach, Germany", "Ellen Ochoa",	     "Philipp Forchheimer"),
                       ("43", "Zuffenhausen", "Weissach, Germany", "George Stephenson",  "Philipp Forchheimer"),
                       ("44", "Zuffenhausen", "Weissach, Germany", "Fazlur Rahman Khan", "Hard Hits"),
                       ("1",  "Zuffenhausen", "Weissach, Germany", "Gustav Lindenthal",  "Hard Hits"),
                       ("3",  "Zuffenhausen", "Weissach, Germany", "Carl Auer",	         "Nikolaus Otto"),
                       ("6",  "Zuffenhausen", "Weissach, Germany", "Citizen Kane",	     "Nikolaus Otto");
                       
-- to see a specific table
-- select * from  ;

-- Employees' names working in factories in Germany:
SELECT E.efn, E.emn, E.eln
FROM Employees E, Manges M, Factories F, Flocation FL
WHERE E.essn = M.essn AND M.fid = F.fid AND F.fid = FL.fid AND FL.flocation = 'Germany';

-- Colors of vehicles sold to customers:
SELECT vcolor
FROM Vcolor V, Sale S
WHERE V.serialno = S.serialno;

-- Locations of factories where employees work:
SELECT flocation
FROM Factories F, Flocation FL
WHERE F.fid = FL.fid;

-- List of employees who manage others:
SELECT efn, emn, eln
FROM Employees
WHERE essn IN (SELECT super_ssn FROM Employees);

-- Phone numbers and addresses of customers who made a purchase:
SELECT cphone, caddress
FROM Cphone CP, Caddress CA, Sale S
WHERE CP.cssn = S.cssn AND CA.cssn = S.cssn;

-- Serial no. and color of vehicles sold at a particular dealership:
SELECT S.serialno, V.vcolor
FROM Sale S, Vcolor V
WHERE S.serialno = V.serialno AND S.did = '201';

-- Locations of factories where employees with a specific phone number manage factories:
SELECT FL.flocation
FROM Flocation FL, Manges M, Ephone EP
WHERE FL.fid = M.fid AND M.essn = EP.essn AND EP.ephone = '2124567902';

-- Factory locations where employees are managed by a specific manager:
SELECT FL.flocation
FROM Flocation FL, Manges M
WHERE FL.fid = M.fid AND M.essn = '12';

-- Colors of vehicles sold to customers in a specific location:
SELECT V.vcolor
FROM Vcolor V, Sale S, Caddress CA
WHERE V.serialno = S.serialno AND S.cssn = CA.cssn AND CA.caddress = 'Cairo';

-- Phone numbers and addresses of customers who made a purchase at a specific dealership:
SELECT CP.cphone, CA.caddress
FROM Cphone CP, Caddress CA, Sale S
WHERE CP.cssn = S.cssn AND CA.cssn = S.cssn AND S.did = '201';

-- Names and addresses of employees who manage others:
SELECT E.efn, E.emn, E.eln, EA.eaddress
FROM Employees E, Eaddress EA, Manges M
WHERE E.essn = EA.essn AND E.essn = M.essn;

-- Locations of dealerships where vehicles of a specific color were sold:
SELECT DL.dlocation
FROM Dlocation DL, Dealership D, Sale S, Vcolor V
WHERE DL.did = D.did AND D.did = S.did AND S.serialno = V.serialno AND V.vcolor = 'special color';

-- Names and addresses of employees manage factories located in a specific city:
SELECT E.efn, E.emn, E.eln, EA.eaddress
FROM Employees E, Eaddress EA, Manges M, Factories F, Flocation FL
WHERE E.essn = EA.essn AND E.essn = M.essn AND M.fid = F.fid AND F.fid = FL.fid AND FL.flocation = 'Germany';


-- Phone numbers and addresses of customers who purchased vehicles of a specific color:
SELECT CP.cphone, CA.caddress
FROM Cphone CP, Caddress CA, Sale S, Vcolor V
WHERE CP.cssn = S.cssn AND CA.cssn = S.cssn AND S.serialno = V.serialno AND V.vcolor = 'Red';

-- The most popular vehicle color:
SELECT vcolor, COUNT(*) as count
FROM Vcolor
GROUP BY vcolor
ORDER BY count DESC;

-- The Serial number, Availability, Price, and Torque of vehicles with HorsePower greater than 400, fueled by gasoline, marked as a coupe
SELECT serialno, availability, Price, torque
FROM Vehicle V
WHERE V.horsepower > 400 AND fueltype = 95 AND V.coupe_flag = 1;