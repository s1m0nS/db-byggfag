--Create a table called beregninger (calculations) for Loftur

drop table beregninger;

create table beregninger(
	idb serial primary key,
	id_semester int,
	id_emne int null,
	emnekode varchar(32),
	ects numeric,
	faktor int,
	antall_studenter int,
	antall_assist int,
	undervisning numeric,
	veiledning numeric,
	vurdering numeric,
	person varchar(128),
	pro_undervisning numeric,
	uvv_total numeric,
	fin_undervisning numeric,
	fin_koordinering int,
	fin_reisetid int,
	fin_feltkurs int,
	sensur int,
	kommentar varchar(256),
	dato date
);

select * from beregninger;

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
		new.veiledning := round( ( ( (new.ects*0.132)*new.antall_studenter) / ( ((1 + new.antall_assist) + (new.ects*1.6)*new.antall_assist) )), 2);
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

--------------------------------------------------------------------------
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

--------------------------------------------------------------------------

--YOU ONLY NEED TO RUN THESE TWO QUERIES TO UPDATE: 
--a) UVV_TOTAL AND b) FIN_UNDERVISNING


--(4) UPDATE UVV_TOTAL

update beregninger
set uvv_total = round(undervisning + veiledning + vurdering, 2);

--(5) UPDATE FIN_UNDERVISING
update beregninger
set fin_undervisning = round(pro_undervisning*uvv_total, 2);

--------------------------------------------------------------------------
--------------------------------------------------------------------------

select * from beregninger;