-- 0. Delete Tables if rework is needed.
DROP Table IF Exists Nasa_Budgets_over_time;
DROP Table IF Exists Space_walkers_with_country;
DROP Table IF Exists Other_Space_Agency_Budgets;
DROP Table IF Exists Iss_Space_Walkers;
DROP Table IF Exists Space_Walk_master;
DROP Table IF Exists Austronauts_master;

-- 1. Create Austronauts_master table.
CREATE TABLE Austronauts_master (
    name VARCHAR(50) NOT NULL,
    year_joined int,
    astronaut_group int,
    status VARCHAR(20) NOT NULL,
    birth_date VARCHAR(10) NOT NULL,
    birth_place VARCHAR(50) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    alma_mater VARCHAR(200),
    undergraduate_major VARCHAR(100),
    graduate_major VARCHAR(100),
    military_rank VARCHAR(50),
    military_branch VARCHAR(50),
    space_flights int,
    space_flights_hrs int,
    space_walks int,
    space_walks_hrs int,
    missions VARCHAR(200),
    death_date VARCHAR(10),
    death_mission VARCHAR(50),    
    PRIMARY KEY (name)
);

-- 2. Create Space_Walk_master table.
CREATE TABLE Space_Walk_master (
	mission_name VARCHAR(30) NOT NULL,
    start_year int NOT NULL,
    start_time VARCHAR(30) NOT NULL,
    end_time VARCHAR(30) NOT NULL,
    duration VARCHAR(30) NOT NULL,
    eva_reason VARCHAR(1500),
    PRIMARY KEY (mission_name)
);

-- 3. Create a Iss_Space_Walkers table.
CREATE TABLE Iss_Space_Walkers (
    mission_name VARCHAR(30) NOT NULL,
    space_walker_one VARCHAR(50) NOT NULL,
    space_walker_two VARCHAR(50) NOT NULL,
	PRIMARY KEY (mission_name),
	FOREIGN KEY (mission_name) REFERENCES Space_Walk_master (mission_name),
    FOREIGN KEY (space_walker_one) REFERENCES Austronauts_master (name),
    FOREIGN KEY (space_walker_two) REFERENCES Austronauts_master (name)
);

-- 4. Create a Other_Space_Agency_Budgets Table
CREATE TABLE Other_Space_Agency_Budgets (
	country_name VARCHAR(60) NOT NULL,
	space_agency_name VARCHAR(60) NOT NULL,
    agency_budget numeric NOT NULL,
    PRIMARY KEY (country_name)
);

-- 5. Create Space_walkers_with_country Table
CREATE TABLE Space_walkers_with_country (
    country_name VARCHAR(60) NOT NULL,
    name VARCHAR(50) NOT NULL,
	space_walks int NOT NUll,
    year int,
    mission_name VARCHAR(30) NOT NULL,
    FOREIGN KEY (country_name) REFERENCES Other_Space_Agency_Budgets(country_name),
    FOREIGN KEY (name) REFERENCES Austronauts_master (name),
	FOREIGN KEY (mission_name) REFERENCES Space_Walk_master (mission_name)
);

-- 6. Create Nasa_Budgets_over_time Table
CREATE TABLE Nasa_Budgets_over_time (
    year int NOT NULL,
	nasa_budget_mill numeric NOT NULL,
    nasa_budget_percent_of_fed numeric NOT NULL,
    nasa_budget_in_2014_dollars numeric NOT NULL
);
