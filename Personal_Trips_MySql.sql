-- 1. Create the database (schema)
create schema Shaul_Trips charset hebrew;

-- 2. Use the DB
use Shaul_Trips;

-- 3. Create Table Companion_TBL_First_Name
Create table Companion_TBL_First_Name(
	Companion_First_Name_ID integer,
    Companion_First_Name varchar(25),
    primary key (Companion_First_Name_ID)
);

-- 4. Create table Companion_TBL_Surname 
Create table Companion_TBL_Surname(
	Companion_Surname_ID integer,
    Companion_Surname varchar(25),
    primary key (Companion_Surname_ID)
);

-- 5. Create table Companion_TBL_Status
Create table Companion_TBL_Status(
	Companion_Status_ID integer,
    Companion_Status varchar(25),
    primary key (Companion_Status_ID)
);

-- 6. Create table Companion_TBL_Country_Of_Residency 
Create table Companion_TBL_Country_Of_Residency(
	Companion_Country_Of_Residency_ID integer,
    Companion_Country_Of_Residency varchar(25),
    primary key (Companion_Country_Of_Residency_ID)
);

-- 7. Create table Companion_TBL_Spoken_Languages 
Create table Companion_TBL_Spoken_Languages(
	Companion_Spoken_Languages_ID integer,
    Companion_Spoken_Languages varchar(25),
    primary key (Companion_Spoken_Languages_ID)
);

-- 8. Create table Companion_TBL_Profession 
Create table Companion_TBL_Profession(
	Companion_Profession_ID integer,
    Companion_Profession varchar(25),
    primary key (Companion_Profession_ID)
);

-- 9. Create table Companion_TBL_ID 
Create table Companion_TBL_ID(
	Companion_ID integer,
    Companion_First_Name_ID integer,
    Companion_Surname_ID integer,
    primary key (Companion_ID),
    foreign key (Companion_First_Name_ID) references Companion_TBL_First_Name(Companion_First_Name_ID),
    foreign key (Companion_Surname_ID) references Companion_TBL_Surname(Companion_Surname_ID),
	Unique unq_companion_ID
(Companion_First_Name_ID,Companion_Surname_ID)
);

-- 10. Create Companion_History 
Create table Companion_History(
    Companion_Enumarator_Index integer auto_increment, 
    Companion_ID integer,
	Companion_First_Name_ID integer,
    Companion_Surname_ID integer,
    Companion_Gender varchar(1),
    Companion_Date_Met_Shaul date,
    Companion_Status_ID integer,
    Companion_Year_Of_Birth integer,
    Companion_Country_Of_Residency_ID integer,
    Companion_Spoken_Languages_ID integer,
    Companion_Profession_ID integer,
    primary key (Companion_Enumarator_Index),
    foreign key (Companion_ID) references Companion_TBL_ID(Companion_ID),
    foreign key (Companion_First_Name_ID) references Companion_TBL_First_Name(Companion_First_Name_ID),
    foreign key (Companion_Surname_ID) references Companion_TBL_Surname(Companion_Surname_ID),
    foreign key (Companion_Status_ID) references Companion_TBL_Status(Companion_Status_ID),
    foreign key (Companion_Country_Of_Residency_ID) references Companion_TBL_Country_Of_Residency(Companion_Country_Of_Residency_ID),
    foreign key (Companion_Spoken_Languages_ID) references Companion_TBL_Spoken_Languages(Companion_Spoken_Languages_ID),
	foreign key (Companion_Profession_ID) references Companion_TBL_Profession(Companion_Profession_ID),
	Unique unq_companion_history
(Companion_ID,Companion_First_Name_ID,Companion_Surname_ID,Companion_Status_ID,Companion_Country_Of_Residency_ID,Companion_Spoken_Languages_ID,Companion_Profession_ID)
);

-- 11. Create table Shaul_TBL_Trip_Country 
Create table Shaul_TBL_Trip_Country(
	Shaul_Trip_Country_ID integer,
    Shaul_Trip_Country varchar(25),
    primary key (Shaul_Trip_Country_ID)
);

-- 12. Create table Shaul_TBL_Trip_City 
Create table Shaul_TBL_Trip_City(
	Shaul_Trip_City_ID integer,
    Shaul_Trip_City varchar(25),
    primary key (Shaul_Trip_City_ID)
);

-- 13. Create table Shaul_TBL_Trip_State_Province 
Create table Shaul_TBL_Trip_State_Province(
	Shaul_Trip_State_Province_ID integer,
    Shaul_Trip_State_Province varchar(25),
    primary key (Shaul_Trip_State_Province_ID)
);

-- 14. Create table Shaul_TBL_Trip_Status 
Create table Shaul_TBL_Trip_Status(
	Shaul_Trip_Status_ID integer,
    Shaul_Trip_Status varchar(25),
    primary key (Shaul_Trip_Status_ID)
);

-- 15. Create table Shaul_TBL_Trip_Main_Activity 
Create table Shaul_TBL_Trip_Main_Activity(
	Shaul_Trip_Main_Activity_ID integer,
    Shaul_Trip_Main_Activity varchar(25),
    primary key (Shaul_Trip_Main_Activity_ID)
);

-- 16. Create table Shaul_TBL_Trip_Currency
 
Create table Shaul_TBL_Trip_Currency(
	Shaul_Trip_Currency_ID integer,
    Shaul_Trip_Currency varchar(25),
    primary key (Shaul_Trip_Currency_ID)
);

-- 17. Create Shaul_Trip_History 
Create table Shaul_Trip_History(
    Trip_Enumerator_Index integer auto_increment, 
    Shaul_Trip_Country_ID integer,
	Shaul_Trip_City_ID integer,
    Shaul_Trip_State_Province_ID integer,
    Shaul_Trip_Start_Date date,
    Shaul_Trip_Status_ID integer,
    Shaul_Trip_Days_Duration integer,
    Shaul_Trip_Main_Activity_ID integer,
    Shaul_Trip_Currency_ID integer,
    Shaul_Trip_Qty_Travellers integer,
    Companion_ID integer,
    primary key (Trip_Enumerator_Index),
    foreign key (Shaul_Trip_Country_ID) references Shaul_TBL_Trip_Country(Shaul_Trip_Country_ID),
    foreign key (Shaul_Trip_City_ID) references Shaul_TBL_Trip_City(Shaul_Trip_City_ID),
    foreign key (Shaul_Trip_State_Province_ID) references Shaul_TBL_Trip_State_Province(Shaul_Trip_State_Province_ID),
    foreign key (Shaul_Trip_Status_ID) references Shaul_TBL_Trip_Status(Shaul_Trip_Status_ID),
    foreign key (Shaul_Trip_Main_Activity_ID) references Shaul_TBL_Trip_Main_Activity(Shaul_Trip_Main_Activity_ID),
    foreign key (Shaul_Trip_Currency_ID) references Shaul_TBL_Trip_Currency(Shaul_Trip_Currency_ID),
	foreign key (Companion_ID) references Companion_TBL_ID(Companion_ID),
	Unique unq_companion_history
(Shaul_Trip_Country_ID,Shaul_Trip_City_ID,Shaul_Trip_State_Province_ID,Shaul_Trip_Status_ID,Shaul_Trip_Main_Activity_ID,Shaul_Trip_Currency_ID,Companion_ID)
);

-- 0. Use Shaul_Trips
Use shaul_trips;


-- 1. Country of Residency

insert into companion_tbl_country_of_residency values (1,'United States');
insert into companion_tbl_country_of_residency values (2,'Israel');
insert into companion_tbl_country_of_residency values (3,'Brazil');


-- 2. First Name

insert into companion_tbl_first_name values (1,'Bobbie');
insert into companion_tbl_first_name values (2,'Anthony');
insert into companion_tbl_first_name values (3,'Nathan');
insert into companion_tbl_first_name values (4,'Levi');
insert into companion_tbl_first_name values (5,'Rick');
insert into companion_tbl_first_name values (6,'Maya');
insert into companion_tbl_first_name values (7,'Gilberto');
insert into companion_tbl_first_name values (8,'Angela');
insert into companion_tbl_first_name values (9,'Hilla');
insert into companion_tbl_first_name values (10,'Gil');
insert into companion_tbl_first_name values (11,'Bartolomeu');
insert into companion_tbl_first_name values (-1,null);


-- 3. Companion Profession

insert into companion_tbl_profession values (1,'Farmer');
insert into companion_tbl_profession values (2,'High School Student');
insert into companion_tbl_profession values (3,'College Student');
insert into companion_tbl_profession values (4,'Chemical Engineer');
insert into companion_tbl_profession values (5,'Content Writer');
insert into companion_tbl_profession values (6,'Kindergarten Student');
insert into companion_tbl_profession values (7,'Salesman');


-- 4. Companion Spoken Languages

insert into companion_tbl_spoken_languages values (1,'English');
insert into companion_tbl_spoken_languages values (2,'Hebrew');
insert into companion_tbl_spoken_languages values (3,'Portuguese');
insert into companion_tbl_spoken_languages values (4,'Italian');
insert into companion_tbl_spoken_languages values (5,'Spanish');


-- 5. Companion Status

insert into companion_tbl_status values (1,'Friend');
insert into companion_tbl_status values (2,'Girlfriend');
insert into companion_tbl_status values (3,'Father');
insert into companion_tbl_status values (4,'Step Mother');
insert into companion_tbl_status values (5,'Wife');
insert into companion_tbl_status values (6,'Son');
insert into companion_tbl_status values (7,'Uncle');


-- 6. Companion Surname

insert into companion_tbl_surname values (1,'Clymer');
insert into companion_tbl_surname values (2,'Berliner');
insert into companion_tbl_surname values (3,'Tzur');
insert into companion_tbl_surname values (4,'Sousa');
insert into companion_tbl_surname values (-1,null);


-- 7. Shaul Trip City

insert into shaul_tbl_trip_city values (1,'Grand Lake');
insert into shaul_tbl_trip_city values (2,'Bogota');
insert into shaul_tbl_trip_city values (3,'Buenos Aires');
insert into shaul_tbl_trip_city values (4,'Rome');
insert into shaul_tbl_trip_city values (5,'Venice');
insert into shaul_tbl_trip_city values (6,'Florence');
insert into shaul_tbl_trip_city values (7,'Lisbon');
insert into shaul_tbl_trip_city values (8,'Coimbra');
insert into shaul_tbl_trip_city values (9,'Porto');
insert into shaul_tbl_trip_city values (10,'Valletta');


-- 8. Shaul Trip Country

insert into shaul_tbl_trip_country values (1,'United States');
insert into shaul_tbl_trip_country values (2,'Colombia');
insert into shaul_tbl_trip_country values (3,'Argentina');
insert into shaul_tbl_trip_country values (4,'Italy');
insert into shaul_tbl_trip_country values (5,'Portugal');
insert into shaul_tbl_trip_country values (6,'Malta');


-- 9. Shaul Trip Currency

insert into shaul_tbl_trip_currency values (1,'U.S. Dollar');
insert into shaul_tbl_trip_currency values (2,'Colombian Peso');
insert into shaul_tbl_trip_currency values (3,'Argentine Peso');
insert into shaul_tbl_trip_currency values (4,'Euro');


-- 10. Shaul Trip Main Activity

insert into shaul_tbl_trip_main_activity values (1,'Nature');
insert into shaul_tbl_trip_main_activity values (2,'Exhibition');
insert into shaul_tbl_trip_main_activity values (3,'Meetings');
insert into shaul_tbl_trip_main_activity values (4,'History');


-- 11. Shaul Trip State Province

insert into shaul_tbl_trip_state_province values (1,'Colorado');
insert into shaul_tbl_trip_state_province values (2,'Capital District');
insert into shaul_tbl_trip_state_province values (3,'Buenos Aires');
insert into shaul_tbl_trip_state_province values (4,'Lazio');
insert into shaul_tbl_trip_state_province values (5,'Veneto');
insert into shaul_tbl_trip_state_province values (6,'Toscany');
insert into shaul_tbl_trip_state_province values (7,'Lisboa');
insert into shaul_tbl_trip_state_province values (8,'Coimbra');
insert into shaul_tbl_trip_state_province values (9,'Porto');
insert into shaul_tbl_trip_state_province values (10,'Southern Harbour District');


-- 12. Shaul Trip Status

insert into shaul_tbl_trip_status values (1,'Vacation');
insert into shaul_tbl_trip_status values (2,'Work');


-- 13. Companion ID

insert into companion_tbl_id values (1,1,1);
insert into companion_tbl_id values (2,2,1);
insert into companion_tbl_id values (3,3,1);
insert into companion_tbl_id values (4,4,1);
insert into companion_tbl_id values (5,5,1);
insert into companion_tbl_id values (6,6,2);
insert into companion_tbl_id values (7,7,3);
insert into companion_tbl_id values (8,8,4);
insert into companion_tbl_id values (9,9,3);
insert into companion_tbl_id values (10,10,3);
insert into companion_tbl_id values (11,11,3);
insert into companion_tbl_id values (-1,-1,-1);


-- 14. Companion History

insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID) values (1,1,1,'F','2000-01-10',1,1957,1,1,1);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (5,5,1,'M','2000-01-10',1,1955,1,1,1);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (2,2,1,'M','2000-01-10',1,1980,1,1,1);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (4,4,1,'M','2000-01-10',1,1983,1,1,2);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (3,3,1,'M','2000-01-10',1,1981,1,1,3);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (6,6,2,'F','2009-01-05',2,1990,2,1,3);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (6,6,2,'F','2009-01-05',2,1990,2,2,3);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (7,7,3,'M','1984-01-29',3,1955,3,3,4);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (7,7,3,'M','1984-01-29',3,1955,3,4,4);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (7,7,3,'M','1984-01-29',3,1955,3,1,4);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (8,8,4,'F','1990-02-24',4,1961,3,3,4);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (8,8,4,'F','1990-02-24',4,1961,3,4,4);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (8,8,4,'F','1990-02-24',4,1961,3,1,4);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (8,8,4,'F','1990-02-24',4,1961,3,5,4);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (9,9,3,'F','2015-11-08',5,1982,2,2,5);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (9,9,3,'F','2015-11-08',5,1982,2,1,5);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (10,10,3,'M','2017-01-22',6,2017,2,2,6);
insert into companion_history (Companion_ID,companion_first_name_ID,companion_surname_ID,companion_gender,companion_date_met_shaul,companion_status_ID,companion_year_of_birth,companion_country_of_residency_ID,companion_spoken_languages_ID,companion_profession_ID)values (11,11,3,'M','1984-01-29',7,1960,3,3,7);


-- 15. Shaul Trip History

insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (1,1,1,'2000-06-18',1,10,1,1,6,1);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (1,1,1,'2000-06-18',1,10,1,1,6,2);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (1,1,1,'2000-06-18',1,10,1,1,6,3);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (1,1,1,'2000-06-18',1,10,1,1,6,4);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (1,1,1,'2000-06-18',1,10,1,1,6,5);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (2,2,2,'2012-06-10',2,4,2,2,1,-1);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (3,3,3,'2012-07-15',2,12,3,3,1,-1);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (4,4,4,'2010-10-20',1,4,4,4,2,6);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (4,5,5,'2014-04-12',1,4,4,4,4,6);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (4,5,5,'2014-04-12',1,4,4,4,4,7);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (4,5,5,'2014-04-12',1,4,4,4,4,8);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (4,6,6,'2022-04-01',1,9,4,4,4,7);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (4,6,6,'2022-04-01',1,9,4,4,4,8);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (4,6,6,'2022-04-01',1,9,4,4,4,11);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (5,7,7,'2014-06-24',1,6,4,4,3,7);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (5,7,7,'2014-06-24',1,6,4,4,3,8);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (5,8,8,'2016-03-12',1,10,4,4,2,9);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (5,9,9,'2018-07-15',1,8,4,4,5,7);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (5,9,9,'2018-07-15',1,8,4,4,5,8);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (5,9,9,'2018-07-15',1,8,4,4,5,9);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (5,9,9,'2018-07-15',1,8,4,4,5,10);
insert into shaul_trip_history (shaul_trip_country_ID,shaul_trip_city_ID,shaul_trip_state_province_ID,shaul_trip_start_date,shaul_trip_status_ID,shaul_trip_days_duration,shaul_trip_main_activity_ID,shaul_trip_currency_ID,shaul_trip_qty_travellers,companion_ID)values (6,10,10,'2015-12-20',1,3,1,4,2,9);


-- Now let's see the entire dabase:
Use shaul_trips;

Select Shaul_Trip_Country, Shaul_Trip_State_Province, Shaul_Trip_City, Shaul_Trip_Start_Date, Shaul_Trip_Status, Shaul_Trip_Days_Duration, Shaul_Trip_Main_Activity, Shaul_Trip_Currency, Shaul_Trip_Qty_Travellers, Companion_First_Name, Companion_Surname, Companion_Gender, Companion_Date_Met_Shaul, Companion_Status, Companion_Year_Of_Birth, Companion_Country_Of_Residency, Companion_Spoken_Languages, Companion_Profession
From shaul_trip_history as his
Left Join shaul_tbl_trip_state_province as sta
On his.Shaul_Trip_State_Province_ID = sta.Shaul_Trip_State_Province_ID
Left Join shaul_tbl_trip_country as cou
On cou.Shaul_Trip_Country_ID = his.Shaul_Trip_Country_ID
Left Join shaul_tbl_trip_city as cit
On cit.Shaul_Trip_City_ID = his.Shaul_Trip_City_ID
Left Join shaul_tbl_trip_status as sstatus
On sstatus.Shaul_Trip_Status_ID = his.Shaul_Trip_Status_ID
Left Join shaul_tbl_trip_main_activity as act
On act.Shaul_Trip_Main_Activity_ID = his.Shaul_Trip_Main_Activity_ID
Left Join shaul_tbl_trip_currency as cash
On cash.Shaul_Trip_Currency_ID = his.Shaul_Trip_Currency_ID
Left Join companion_tbl_id as com
On com.Companion_ID = his.Companion_ID
Left Join companion_history as comphist
On comphist.Companion_ID = his.Companion_ID
Left Join companion_tbl_first_name as nam
On nam.Companion_First_Name_ID = comphist.Companion_First_Name_ID
Left Join companion_tbl_surname as sur
On sur.Companion_Surname_ID = comphist.Companion_Surname_ID
Left Join companion_tbl_status as compstat
On compstat.Companion_Status_ID = comphist.Companion_Status_ID
Left Join companion_tbl_country_of_residency as res
On res.Companion_Country_Of_Residency_ID = comphist.Companion_Country_Of_Residency_ID
Left Join companion_tbl_spoken_languages as lan
On lan.Companion_Spoken_Languages_ID = comphist.Companion_Spoken_Languages_ID
Left Join companion_tbl_profession as prof
On prof.Companion_Profession_ID = comphist.Companion_Profession_ID
Order by Shaul_Trip_Start_Date, his.Companion_ID;