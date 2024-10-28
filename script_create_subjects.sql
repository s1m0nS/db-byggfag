------------------------------------------------------------------------------------------------------------------------------------------------------------
--CREATE TABLES FOR EACH SUBJECT TO FILL IN INFORMATION ABOUT EMPLOYEES and PRECENTAGE OF WORK
------------------------------------------------------------------------------------------------------------------------------------------------------------

--CREATE TABLES FOR EACH SUBJECT --> when done, run the script

drop table byg105;

create table byg105(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg105;

--insert data from arbeid, only the data we need
insert into byg105 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select a.id_emne, a.id_semester, a.id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, 'add comment here', current_date, 0
from arbeid a
where a.emnekode = 'BYG105';

--update uvv_total from table beregninger
update byg105
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG105';

--calculate uvv_ansatt
update byg105
set uvv_ansatt = round(pro_und*uvv_total, 2);

--calculate the total_per_ansatt = uvv_ansatt + fin_undervisning + fin_koordinering + fin_reisetid + fin_annet
update byg105
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg105;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG102

drop table byg102;

create table byg102(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);
	
select * from byg102;

--insert data from arbeid, only the data we need
insert into byg102 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select a.id_emne, a.id_semester, a.id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, 'add comment here', current_date, 0
from arbeid a
where a.emnekode = 'BYG102';

--update uvv_total from table beregninger
update byg102
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG102';

update byg102
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg102
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + feltkurs + annet, 2);

select * from byg102;

------------------------------------------------------------------------------------------------------------------------------------------------------------
--ANS800

drop table ans800;

create table ans800(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);
	
select * from ans800;

--insert data from arbeid, only the data we need
insert into ans800 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, 'add comment here', current_date, 0
from arbeid a
where a.emnekode = 'ANS800';

--update uvv_total from table beregninger
update ans800
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'ANS800';

update ans800
set uvv_ansatt = round(pro_und*uvv_total, 2);

update ans800
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from ans800;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG104

drop table byg104;

create table byg104(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);
	
select * from byg104;

--insert data from arbeid, only the data we need
insert into byg104 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG104';

--update uvv_total from table beregninger
update byg104
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG104';

update byg104
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg104
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg104;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG106

drop table byg106;

create table byg106(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg106;

--insert data from arbeid, only the data we need
insert into byg106 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG106';

--update uvv_total from table beregninger
update byg106
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG106';

update byg106
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg106
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg106;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG107

drop table byg107;

create table byg107(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg107;

--insert data from arbeid, only the data we need
insert into byg107 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG107';

--update uvv_total from table beregninger
update byg107
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG107';

update byg107
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg107
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg107;

--------------------------------------------------------------------------------------------------------------------------------------------------------------

--ASK WHAT ABOUT THIS, since it is taught both semesters
--BYG109

drop table byg109;

create table byg109(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg109;

--insert data from arbeid, only the data we need
insert into byg109 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG109';

--update uvv_total from table beregninger
update byg109
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG109';

update byg109
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg109
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg109;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG110

drop table byg110;

create table byg110(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg110;

--insert data from arbeid, only the data we need
insert into byg110 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG107';

--update uvv_total from table beregninger
update byg110
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG107';

update byg110
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg110
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg110;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG111

drop table byg111;

create table byg111(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg111;

--insert data from arbeid, only the data we need
insert into byg111 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG111';

--update uvv_total from table beregninger
update byg111
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG111';

update byg111
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg111
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg111;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG112

drop table byg112;

create table byg112(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg112;

--insert data from arbeid, only the data we need
insert into byg112 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG112';

--update uvv_total from table beregninger
update byg112
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG112';

update byg112
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg112
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg112;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG113

drop table byg113;

create table byg113(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg113;

--insert data from arbeid, only the data we need
insert into byg113 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG113';

--update uvv_total from table beregninger
update byg113
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG113';

update byg113
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg113
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg113;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG114

drop table byg114;

create table byg114(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg114;

--insert data from arbeid, only the data we need
insert into byg114 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG114';

--update uvv_total from table beregninger
update byg114
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG114';

update byg114
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg114
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg114;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG115

drop table byg115;

create table byg115(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg115;

--insert data from arbeid, only the data we need
insert into byg115 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG115';

--update uvv_total from table beregninger
update byg115
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG115';

update byg115
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg115
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg115;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG116

drop table byg116;

create table byg116(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg116;

--insert data from arbeid, only the data we need
insert into byg116 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG116';

--update uvv_total from table beregninger
update byg116
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG116';

update byg116
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg116
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg116;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG117

drop table byg117;

create table byg117(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg117;

--insert data from arbeid, only the data we need
insert into byg117 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG117';

--update uvv_total from table beregninger
update byg117
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG117';

update byg117
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg117
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg117;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG119 --> missing in table beregninger; have to update information manually
--       --> add a row in the source Excel table

drop table byg119;

create table byg119(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg119;

--insert data from arbeid, only the data we need
insert into byg119 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG119';

--update uvv_total from table beregninger
update byg119
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG119';

update byg119
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg119
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg119;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG122

drop table byg122;

create table byg122(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg122;

--insert data from arbeid, only the data we need
insert into byg122 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG122';

--update uvv_total from table beregninger
update byg122
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG122';

update byg122
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg122
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg122;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG130

drop table byg130;

create table byg130(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg130;

--insert data from arbeid, only the data we need
insert into byg130 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG130';

--update uvv_total from table beregninger
update byg130
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG130';

update byg130
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg130
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg130;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG161

drop table byg161;

create table byg161(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg161;

--insert data from arbeid, only the data we need
insert into byg161 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG161';

--update uvv_total from table beregninger
update byg161
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG161';

update byg161
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg161
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg161;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG200

drop table byg200;

create table byg200(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg200;

--insert data from arbeid, only the data we need
insert into byg200 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG200';

--update uvv_total from table beregninger
update byg200
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG200';

update byg200
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg200
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg200;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG300

drop table byg300;

create table byg300(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg300;

--insert data from arbeid, only the data we need
insert into byg300 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG300';

--update uvv_total from table beregninger
update byg300
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG300';

update byg300
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg300
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg300;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--BYG350 --> missing in table beregninger, add the row manually in Excel

drop table byg350;

create table byg350(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from byg350;

--insert data from arbeid, only the data we need
insert into byg350 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'BYG350';

--update uvv_total from table beregninger
update byg350
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'BYG350';

update byg350
set uvv_ansatt = round(pro_und*uvv_total, 2);

update byg350
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from byg350;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--ING106

drop table ing106;

create table ing106(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from ing106;

--insert data from arbeid, only the data we need
insert into ing106 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'ING106';

--update uvv_total from table beregninger
update ing106
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'ING106';

update ing106
set uvv_ansatt = round(pro_und*uvv_total, 2);

update ing106
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from ing106;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI100

drop table lei100;

create table lei100(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei100;

--insert data from arbeid, only the data we need
insert into lei100 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI100';

--update uvv_total from table beregninger
update lei100
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI100';

update lei100
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei100
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei100;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI102

drop table lei102;

create table lei102(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei102;

--insert data from arbeid, only the data we need
insert into lei102 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI102';

--update uvv_total from table beregninger
update lei102
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI102';

update lei102
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei102
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei102;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI104 --> check procentage of teaching for Leiv Bjarte and Arve
--       --> update the table after

drop table lei104;

create table lei104(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei104;

--insert data from arbeid, only the data we need
insert into lei104 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI104';

--update uvv_total from table beregninger
update lei104
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI104';

update lei104
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei104
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei104;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI105

drop table lei105;

create table lei105(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei105;

--insert data from arbeid, only the data we need
insert into lei105 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI105';

--update uvv_total from table beregninger
update lei105
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI105';

update lei105
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei105
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei105;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI107

drop table lei107;

create table lei107(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei107;

--insert data from arbeid, only the data we need
insert into lei107 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI107';

--update uvv_total from table beregninger
update lei107
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI107';

update lei107
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei107
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei107;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI110

drop table lei110;

create table lei110(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei110;

--insert data from arbeid, only the data we need
insert into lei110 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI110';

--update uvv_total from table beregninger
update lei110
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI110';

update lei110
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei110
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei110;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI111

drop table lei111;

create table lei111(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei111;

--insert data from arbeid, only the data we need
insert into lei111 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI111';

--update uvv_total from table beregninger
update lei111
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI111';

update lei111
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei111
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei111;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI113

drop table lei113;

create table lei113(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei113;

--insert data from arbeid, only the data we need
insert into lei113 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI113';

--update uvv_total from table beregninger
update lei113
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI113';

update lei113
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei113
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei113;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI116

drop table lei116;

create table lei116(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei116;

--insert data from arbeid, only the data we need
insert into lei116 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI116';

--update uvv_total from table beregninger
update lei116
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI116';

update lei116
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei116
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei116;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI117

drop table lei117;

create table lei117(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei117;

--insert data from arbeid, only the data we need
insert into lei117 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI117';

--update uvv_total from table beregninger
update lei117
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI117';

update lei117
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei117
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei117;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI300

drop table lei300;

create table lei300(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei300;

--insert data from arbeid, only the data we need
insert into lei300 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI300';

--update uvv_total from table beregninger
update lei300
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI300';

update lei300
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei300
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei300;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI301

drop table lei301;

create table lei301(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei301;

--insert data from arbeid, only the data we need
insert into lei301 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI301';

--update uvv_total from table beregninger
update lei301
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI301';

update lei301
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei301
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei301;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI350: BACHELOROPPGAVE

drop table lei350;

create table lei350(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei350;

--insert data from arbeid, only the data we need
insert into lei350 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI350';

--update uvv_total from table beregninger
update lei350
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI350';

update lei350
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei350
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei350;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA250

drop table moa250;

create table moa250(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa250;

--insert data from arbeid, only the data we need
insert into moa250 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA250';

--update uvv_total from table beregninger
update moa250
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA250';

update moa250
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa250
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa250;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA251

drop table moa251;

create table moa251(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa251;

--insert data from arbeid, only the data we need
insert into moa251 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA251';

--update uvv_total from table beregninger
update moa251
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA251';

update moa251
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa251
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa251;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA250

drop table moa252;

create table moa252(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa252;

--insert data from arbeid, only the data we need
insert into moa252 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA252';

--update uvv_total from table beregninger
update moa252
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA252';

update moa252
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa252
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa252;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA253

drop table moa253;

create table moa253(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa253;

--insert data from arbeid, only the data we need
insert into moa253 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA253';

--update uvv_total from table beregninger
update moa253
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA253';

update moa253
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa253
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa253;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA250

drop table moa254;

create table moa254(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa254;

--insert data from arbeid, only the data we need
insert into moa254 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA254';

--update uvv_total from table beregninger
update moa254
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA254';

update moa254
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa254
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa254;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA255

drop table moa255;

create table moa255(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa255;

--insert data from arbeid, only the data we need
insert into moa255 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA255';

--update uvv_total from table beregninger
update moa255
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA255';

update moa255
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa255
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa255;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA260

drop table moa260;

create table moa260(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa260;

--insert data from arbeid, only the data we need
insert into moa260 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA260';

--update uvv_total from table beregninger
update moa260
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA260';

update moa260
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa260
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa260;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA261

drop table moa261;

create table moa261(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa261;

--insert data from arbeid, only the data we need
insert into moa261 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA261';

--update uvv_total from table beregninger
update moa261
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA261';

update moa261
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa261
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa261;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA270

drop table moa270;

create table moa270(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa270;

--insert data from arbeid, only the data we need
insert into moa270 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA270';

--update uvv_total from table beregninger
update moa270
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA270';

update moa270
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa270
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa270;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA271

drop table moa271;

create table moa271(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa271;

--insert data from arbeid, only the data we need
insert into moa271 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA271';

--update uvv_total from table beregninger
update moa271
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA271';

update moa271
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa271
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa271;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA272

drop table moa272;

create table moa272(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa272;

--insert data from arbeid, only the data we need
insert into moa272 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA272';

--update uvv_total from table beregninger
update moa272
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA272';

update moa272
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa272
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa272;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOA300

drop table moa300;

create table moa300(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from moa300;

--insert data from arbeid, only the data we need
insert into moa300 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOA300';

--update uvv_total from table beregninger
update moa300
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOA300';

update moa300
set uvv_ansatt = round(pro_und*uvv_total, 2);

update moa300
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from moa300;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--MOB250

drop table mob250;

create table mob250(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from mob250;

--insert data from arbeid, only the data we need
insert into mob250 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'MOB250';

--update uvv_total from table beregninger
update mob250
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'MOB250';

update mob250
set uvv_ansatt = round(pro_und*uvv_total, 2);

update mob250
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from mob250;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--TAK801

drop table tak801;

create table tak801(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from tak801;

--insert data from arbeid, only the data we need
insert into tak801 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'TAK801';

--update uvv_total from table beregninger
update tak801
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'TAK801';

update tak801
set uvv_ansatt = round(pro_und*uvv_total, 2);

update tak801
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from tak801;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--TAK802

drop table tak802;

create table tak802(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from tak802;

--insert data from arbeid, only the data we need
insert into tak802 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'TAK802';

--update uvv_total from table beregninger
update tak802
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'TAK802';

update tak802
set uvv_ansatt = round(pro_und*uvv_total, 2);

update tak802
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from tak802;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--LEI112

--need to add emne to emner!

drop table lei112;

create table lei112(
	id_emne int,	
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from lei112;

--insert data from arbeid, only the data we need
insert into lei112 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'LEI112';

--update uvv_total from table beregninger
update lei112
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'LEI112';

update lei112
set uvv_ansatt = round(pro_und*uvv_total, 2);

update lei112
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from lei112;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--KJE202

--add emne to emner

drop table kje202;

create table kje202(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from kje202;

--insert data from arbeid, only the data we need
insert into kje202 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'KJE202';

--update uvv_total from table beregninger
update kje202
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'KJE202';

update kje202
set uvv_ansatt = round(pro_und*uvv_total, 2);

update kje202
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from kje202;

--------------------------------------------------------------------------------------------------------------------------------------------------------------
--ING303

drop table ing303;

create table ing303(
	id_emne int,
	id_semester int,
	id_ansatt int,
	person varchar(128),
	pro_und numeric,
	uvv_total numeric,
	uvv_ansatt numeric,
	koordinering numeric,
	reisetid numeric,
	feltkurs numeric,
	annet numeric,
	kommentar varchar(128),
	dato date,
	total_per_ansatt numeric
);

select * from ing303;

--insert data from arbeid, only the data we need
insert into ing303 (id_emne, id_semester, id_ansatt, person, pro_und, uvv_total, uvv_ansatt, koordinering, reisetid, feltkurs, annet, kommentar, dato, total_per_ansatt)
select id_emne, id_semester, id_ansatt, a.person, a.pro_undervisning, 0, 0, a.fin_koordinering, a.fin_reisetid, a.fin_feltkurs, 0, '', current_date, 0
from arbeid a
where a.emnekode = 'ING303';

--update uvv_total from table beregninger
update ing303
set uvv_total = b.uvv_total
from beregninger b
where b.emnekode = 'ING303';

update ing303
set uvv_ansatt = round(pro_und*uvv_total, 2);

update ing303
set total_per_ansatt = round(uvv_ansatt + koordinering + reisetid + annet, 2);

select * from ing303;

--------------------------------------------------------------------------------------------------------------------------------------------------------------











