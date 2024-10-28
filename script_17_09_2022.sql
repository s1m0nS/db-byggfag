--MAKE COPY OF TABLE IND_UVV, add column comments

--alter table ind_uvv
--add column kommentar varchar;

--select * from ind_uvv;

--MAKE COPY OF TABLE IND_UVV FOR HØST
--create table ind_uvv_host as (select * from ind_uvv where id_semester = 100);

--MAKE COPY OF TABLE IND_UVV FOR VÅR
--create table ind_uvv_var as (select * from ind_uvv where id_semester = 200);

--CREATE TRIGGERS ON IND_UVV FOR HØST

----------------------------------------------------------------------------------------------

--HERE WE WILL CREATE A TABLE CALLED BEREGNINGER TO CALCULATE THE NECCESSARY INFORMATION

--Create a table called beregninger (calculations) for Loftur

drop table beregninger;

create table beregninger(
	idb serial primary key,
	id_semester int,
	id_emne int null,
	emnekode varchar(32),
	emnenavn varchar(128),
	ects numeric,
	faktor int,
	antall_studenter int,
	antall_assist int,
	undervisning numeric,
	veiledning numeric,
	vurdering numeric,
	uvv_total numeric,
	kommentar varchar(256),
	dato date
);

select * from beregninger;

----------------------------------------------------------------------------------------------
--CREATE TRIGGERS TO CALCULATE UNDERVISNING, VEILEDNING, VURDERING

----------------------------------------------------------------------------------------------

--(1) CREATE TRIGGER UNDERVISNING

--First we create or replace the trigger
create or replace function calculate_undervisning()
	returns trigger as
	$$
	begin
		new.undervisning := round(( (new.ects/2.5)*15*new.faktor) + ( ((new.ects/5)*15 ) * (new.faktor-1) ),2);
		return new;
	end;
	$$
language plpgsql;

--We can always drop it
drop trigger t_undervisning on beregninger;

create trigger t_undervisning
	before insert or update
	on beregninger
	for each row
	execute procedure calculate_undervisning();

----------------------------------------------------------------------------------------------

--(2) CREATE TRIGGER VEILEDNING

create or replace function calculate_veiledning()
	returns trigger as
	$$
	begin                         
		new.veiledning := round( ((new.ects*0.132)*new.antall_studenter) / (1+new.antall_assist)  + (new.ects*1.6)*new.antall_assist,2);
		return new;
	end;
	$$
language plpgsql;

--Here is the trigger fro VEILEDNING

drop trigger t_veiledning on beregninger;

create trigger t_veiledning
	before insert or update
	on beregninger
	for each row
	execute procedure calculate_veiledning();

----------------------------------------------------------------------------------------------
--(3) CREATE TRIGGER VURDERING

create or replace function calculate_vurdering()
	returns trigger as
	$$
	begin
		new.vurdering = case
		when new.ects = 5 then round(30 + 0.4*new.antall_studenter*1.15, 2) --5 ECTS
		when new.ects = 7.5 then round(35 + 0.5*new.antall_studenter*1.15, 2) --7.5 ECTS
		when new.ects = 10 then round(40 + 0.5*new.antall_studenter*1.15, 2) --10 ECTS
		when new.ects = 15 then round(45 + 0.6*new.antall_studenter*1.15, 2) --15 ECTS
		when new.ects = 20 then round(50 + 0.7*new.antall_studenter*1.15, 2) --20 ECTS
		else 0 --all other options
		end as vurdering;
		return new;
	end;
	$$
language plpgsql;

--Here is the trigger for vurdering

drop trigger t_vurdering on beregninger;

create trigger t_vurdering
	before insert or update
	on beregninger
	for each row
	execute procedure calculate_vurdering();

----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

--delete all the data from the table just in case before importing anything
truncate table beregninger;

--NOW WE NEED TO IMPORT THE DATA FROM ALL THE SUBJECTS INTO THE TABLE
--import from csv file stored at: C:\Arbeid\DATABASE_EXPORTS\beregninger.csv

--Right click on table, import data from csv
--column delimiter --> ;

--once we import the data from the .csv file the triggers (equations) will be executed and the table will be updated

--check results
select * from beregninger;

--because of UTF-8 encoding, Norwegian characters will be lost update the emnenavn
--based on id_emne

update beregninger
set emnenavn = emner.emnenavn
from emner
where beregninger.id_emne = emner.id_emne;

--check result
select * from beregninger;

----------------------------------------------------------------------------------------------

--calculate uvv_total for each emne/subject

update beregninger
set uvv_total = round(undervisning + veiledning + vurdering, 2);

----------------------------------------------------------------------------------------------

--from uvv_total we make seperate tables for each subject to calcualte the precentage of teaching
--while adding additional information for 

------------------------------------------------------------------------------------------------------------------------------------------------------------
--WE will use table ARBEID TO GET THE ESSENTIAL INFORMATION FOR OUR SUBJECTS

--(1) change all null values from table arbeid to 0

update arbeid
set pro_undervisning = 0
where pro_undervisning is null;

update arbeid
set fin_koordinering = 0
where fin_koordinering is null;

update arbeid
set fin_reisetid = 0
where fin_reisetid is null;

update arbeid
set fin_feltkurs = 0
where fin_feltkurs is null;

update arbeid
set sensor = 0
where sensor is null;

select * from arbeid;

------------------------------------------------------------------------------------------------------------------------------------------------------------






