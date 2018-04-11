CREATE DOMAIN CodePostal as VARCHAR CHECK (VALUE like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]');

create table if not exists animal
(
	animalno serial not null
		constraint animal_animalno_pk
			primary key,
	name varchar not null,
	bdate DATE not null,
	inscriptiondate DATE not null,
	clinicno integer not null
		constraint fk__clinic
			references clinic,
	ownerno integer
		constraint owner___fk
			references owner,
	animaltype integer
		constraint animal_animal_type_typeno_fk
			references animal_type,
	description varchar,
	isalive boolean not null
)
;

create table if not exists animal_type
(
	typeno serial not null
		constraint animal_type_pkey
			primary key,
	typename varchar
)
;

create table clinic
(
	clinicno serial not null
		constraint clinic_pkey
			primary key,
	telephone bigint not null,
	street varchar not null,
	city varchar not null,
	state varchar not null,
	postalcode varchar(6) not null,
	fax bigint,
	clinicname varchar not null,
	manager integer
		constraint clinic_personnel_personnelno_fk
			references personnel
)
;

create table examination
(
	eno serial not null
		constraint examination_pkey
			primary key,
	examdate timestamp not null,
	hour integer not null,
	vetno integer
		constraint examination_personnel_personnelno_fk
			references personnel,
	treatmentno integer
		constraint examination_treatment_tno_fk
			references treatment,
	description varchar not null
)
;

create unique index examination_eno_uindex
	on examination (eno)
;

create table owner
(
	ownerno serial not null
		constraint owner_ownerno_pk
			primary key,
	firstname varchar not null,
	lastname varchar not null,
	street varchar not null,
	city varchar not null,
	state varchar,
	postalcode varchar(6) not null,
	telephone bigint not null
)
;

create table personnel
(
	personnelno serial not null
		constraint personnel_pkey
			primary key,
	firstname varchar not null,
	lastname varchar not null,
	bdate timestamp not null,
	sex char not null,
	sin integer not null
		CONSTRAINT checksin CHECK (sin > 99999999 AND sin < 1000000000),
	personnelposition varchar not null,
	salary double precision not null,
	street varchar not null,
	city varchar not null,
	state varchar not null,
	postalcode varchar(6) not null,
	clinicno integer
		constraint personnel_clinic_clinicno_fk
			references clinic
)
;

create table prescriptedtreatment
(
	ptno serial not null
		constraint prescriptedtreatment_pkey
			primary key,
	prescriptionno integer
		constraint prescriptedtreatment_prescription_pno_fk
			references prescription,
	treatmentno integer
		constraint prescriptedtreatment_treatment_tno_fk
			references treatment,
	qtity integer
)
;

create unique index prescriptedtreatment_ptno_uindex
	on prescriptedtreatment (ptno)
;

create table prescription
(
	pno serial not null
		constraint prescription_pkey
			primary key,
	startdate timestamp not null,
	enddate timestamp not null,
	examno integer
		constraint prescription_examination_eno_fk
			references examination,
	animalno integer
		constraint prescription_animal_animalno_fk
			references animal
)
;

create unique index prescription_pno_uindex
	on prescription (pno)
;

create table if not exists treatment
(
	tno serial not null
		constraint treatment_pkey
			primary key,
	description varchar,
	cost integer not null
)
;

create unique index if not exists treatment_tno_uindex
	on treatment (tno)
;

