-- Animals
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (1, 'Flash', '2018-05-31', '2018-03-31', 1, 1, 1, 'the fastest turtle ever', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (3, 'Mickey', '2013-04-03', '2015-04-03', 1, 2, 3, 'he is so fine', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (5, 'NowhereBoy', '2018-04-04', '2018-04-04', 2, 3, 1, 'the slowest turtle', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (7, 'Slomo', '2018-05-31', '2018-05-31', 1, 1, 1, 'Kinda slow', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (6, 'Chien', '1999-04-11', '2000-04-11', 1, 1, 3, 'Old Dog', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (8, 'Chien', '2012-04-11', '2018-04-11', 2, 3, 3, 'Young Dog', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (2, 'Bobby', '2018-04-04', '2018-04-04', 1, 2, 2, 'a cat', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (9, 'MonChat', '2018-04-11', '2018-04-11', 1, 5, 2, 'My favorite cat', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (10, 'MonChien', '2018-04-11', '2018-04-11', 1, 5, 3, 'Mon chien favori', true);
INSERT INTO public.animal (animalno, name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive) VALUES (11, 'MyCat', '2018-04-11', '2018-04-11', 2, 6, 2, 'This is my cat', true);

-- Animal types
INSERT INTO public.animal_type (typeno, typename) VALUES (1, 'Tortoise');
INSERT INTO public.animal_type (typeno, typename) VALUES (2, 'Cat');
INSERT INTO public.animal_type (typeno, typename) VALUES (3, 'Dog');
INSERT INTO public.animal_type (typeno, typename) VALUES (4, 'Iguanna');

-- Personnel
INSERT INTO public.personnel (personnelno, firstname, lastname, bdate, sex, sin, personnelposition, salary, street, city, state, postalcode, clinicno) VALUES (1, 'Sarah', 'Kerrigan', '1990-04-03 16:15:57.465000', 'f', 1234567, 'manager', 10, 'XelNaga', 'Tower', 'Starcraft', 'j2h5l2', 1);
INSERT INTO public.personnel (personnelno, firstname, lastname, bdate, sex, sin, personnelposition, salary, street, city, state, postalcode, clinicno) VALUES (3, 'Dr', 'Mario', '1980-04-04 14:44:13.387000', 'm', 1234567, 'veterinaire', 20000, 'Mushroom', 'Kingdom', 'Nintendo', 'luig1', 1);
INSERT INTO public.personnel (personnelno, firstname, lastname, bdate, sex, sin, personnelposition, salary, street, city, state, postalcode, clinicno) VALUES (2, 'Angela', 'Ziegle', '1981-04-03 16:32:10.410000', 'f', 111111, 'veterinaire', 290000, 'Ow', 'Zurich', 'Switzerland', 'K0EOVW', 1);
INSERT INTO public.personnel (personnelno, firstname, lastname, bdate, sex, sin, personnelposition, salary, street, city, state, postalcode, clinicno) VALUES (4, 'Monsieur', 'Manager', '2000-04-11 17:28:21.293000', 'm', 111444, 'manager', 50000, 'street', 'city', 'etat', 'P0ST4K', 2);
INSERT INTO public.personnel (personnelno, firstname, lastname, bdate, sex, sin, personnelposition, salary, street, city, state, postalcode, clinicno) VALUES (5, 'Old', 'Dawg', '1960-04-11 17:36:28.522000', 'm', 123456, 'gestionnaire', 40000, 'astreet', 'acity', 'astate', 'C0DE4G', 2);
INSERT INTO public.personnel (personnelno, firstname, lastname, bdate, sex, sin, personnelposition, salary, street, city, state, postalcode, clinicno) VALUES (6, 'Older', 'Gurl', '1955-04-11 17:37:59.150000', 'f', 123455, 'gestionnaire', 60000, 'anotherstreet', 'acity', 'astate', 'C0DE5G', 2);

-- Prescripted Treatments
INSERT INTO public.prescriptedtreatment (ptno, prescriptionno, treatmentno, qtity) VALUES (3, 4, 4, 8000);
INSERT INTO public.prescriptedtreatment (ptno, prescriptionno, treatmentno, qtity) VALUES (2, 2, 3, 1);
INSERT INTO public.prescriptedtreatment (ptno, prescriptionno, treatmentno, qtity) VALUES (1, 2, 2, 5);
INSERT INTO public.prescriptedtreatment (ptno, prescriptionno, treatmentno, qtity) VALUES (4, 5, 5, 1);

-- Prescriptions
INSERT INTO public.prescription (pno, startdate, enddate, examno, animalno) VALUES (1, '2015-04-03 16:44:41.152000', '2016-04-03 16:44:45.587000', 1, 1);
INSERT INTO public.prescription (pno, startdate, enddate, examno, animalno) VALUES (2, '2018-04-04 13:49:16.233000', '2018-04-04 13:49:17.983000', 2, 3);
INSERT INTO public.prescription (pno, startdate, enddate, examno, animalno) VALUES (3, '2018-04-04 14:34:52.770000', '2018-04-04 14:34:55.293000', 3, 3);
INSERT INTO public.prescription (pno, startdate, enddate, examno, animalno) VALUES (4, '2018-04-04 14:43:32.234000', '2018-04-04 14:43:34.165000', 4, 2);
INSERT INTO public.prescription (pno, startdate, enddate, examno, animalno) VALUES (5, '2018-04-11 17:48:14.085000', '2018-04-11 17:48:16.287000', 5, 10);

-- Treatments
INSERT INTO public.treatment (tno, description, cost) VALUES (2, 'Traitement a la Peniciline', 50);
INSERT INTO public.treatment (tno, description, cost) VALUES (3, 'Vaccination contre la grippe', 70);
INSERT INTO public.treatment (tno, description, cost) VALUES (1, 'Examination', 20);
INSERT INTO public.treatment (tno, description, cost) VALUES (4, 'Diete extreme', 15);
INSERT INTO public.treatment (tno, description, cost) VALUES (5, 'Vaccin contre la grippe', 70);

-- Owners
INSERT INTO public.owner (ownerno, firstname, lastname, street, city, state, postalcode, telephone) VALUES (1, 'John', 'Smith', 'Diagon alley', 'Hogwarts', 'QC', 'WIZWIZ', 16666666);
INSERT INTO public.owner (ownerno, firstname, lastname, street, city, state, postalcode, telephone) VALUES (2, 'Joe', 'Richard', 'Wellington', 'Ottawa', 'QC', 'H2J9K3', 5555555);
INSERT INTO public.owner (ownerno, firstname, lastname, street, city, state, postalcode, telephone) VALUES (3, 'Jill', 'Gillian', 'Yo', 'Whassup', 'ON', 'J0W2K4', 1234567);
INSERT INTO public.owner (ownerno, firstname, lastname, street, city, state, postalcode, telephone) VALUES (4, 'Paul', 'Tremblay', 'street', 'cxity', 'state', 'J0Y6H3', 5555555);
INSERT INTO public.owner (ownerno, firstname, lastname, street, city, state, postalcode, telephone) VALUES (5, 'Michele', 'Soblayson', 'street', 'othercity', 'astate', 'KO7H2F', 7777777);
INSERT INTO public.owner (ownerno, firstname, lastname, street, city, state, postalcode, telephone) VALUES (6, 'John', 'Tribbianni', 'london', 'ottawa', 'ON', 'H0Y6H3', 5556664);

-- Examinations
INSERT INTO public.examination (eno, examdate, hour, vetno, treatmentno, description) VALUES (1, '2015-04-03 16:29:58.051000', 3, 2, 1, 'Un bel animal en santé!');
INSERT INTO public.examination (eno, examdate, hour, vetno, treatmentno, description) VALUES (2, '2014-04-04 12:57:29.903000', 4, 2, 1, 'PNC Tx; pen50, vcn10 ');
INSERT INTO public.examination (eno, examdate, hour, vetno, treatmentno, description) VALUES (3, '2018-04-04 14:33:58.067000', 1, 2, 1, 'Ca va beaucoup mieux');
INSERT INTO public.examination (eno, examdate, hour, vetno, treatmentno, description) VALUES (4, '2018-04-04 14:43:50.136000', 8, 3, 1, 'OH MAMMAMIA');
INSERT INTO public.examination (eno, examdate, hour, vetno, treatmentno, description) VALUES (5, '2018-04-11 17:48:35.775000', 5, 3, 1, 'Snif snif, ce chien a un rhume');

-- Clinics
INSERT INTO public.clinic (clinicno, telephone, street, city, state, postalcode, fax, clinicname, manager) VALUES (1, 11111111, 'medic', 'city', 'state', 'MMMMMM', 123123, 'INEEDHEALING', 1);
INSERT INTO public.clinic (clinicno, telephone, street, city, state, postalcode, fax, clinicname, manager) VALUES (2, 5555555, 'nintendo', 'land', 'imagination', 'MARIO', 321321, 'NINTENDO', 1);
