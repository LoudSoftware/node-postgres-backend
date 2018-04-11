-- 1
SELECT c.clinicno, c.clinicname, c.street, c.postalcode, c.street, c.state, c.manager, p.firstname, p.lastname 
FROM clinic c
INNER JOIN personnel p ON c.clinicno = p.clinicno
ORDER BY c.clinicno;

-- 2
SELECT DISTINCT a.name
FROM animal a;

-- 3
SELECT o.ownerno, o.firstname, o.lastname, a.*
FROM animal a 
INNER JOIN owner o ON a.ownerno = o.ownerno
WHERE a.clinicno = 1;

-- 4
SELECT e.*
FROM examination e
INNER JOIN prescription p ON e.eno = p.examno
WHERE p.animalno = 1;

-- 5
SELECT t.*, pt.qtity
FROM treatment t, prescription p, prescriptedtreatment pt
WHERE p.examno = 2 AND pt.prescriptionno = p.pno AND t.tno = pt.treatmentno;

-- 6
SELECT c.clinicno, c.clinicname, SUM(p.salary) as totalSalary
FROM clinic c, personnel p
WHERE p.clinicno = c.clinicno
GROUP BY c.clinicno
ORDER BY c.clinicno;

-- 7
SELECT c.clinicname, COUNT(a) as numberOfanimals
FROM clinic c, animal a, animal_type atype
WHERE a.clinicno = c.clinicno AND atype.typename = 'Dog' AND a.animaltype = atype.typeno
GROUP BY c.clinicname;

-- 8
SELECT MIN(t.cost), MAX(t.cost), AVG(t.cost)
FROM treatment t;

-- 9
SELECT p.firstname, p.lastname
FROM personnel p
WHERE p.bdate <= '1969-04-10'
ORDER BY p.lastname;

-- 10
SELECT o.*
FROM owner o
WHERE o.lastname LIKE '%blay%';

-- 11
DELETE FROM personnel p
WHERE p.firstname = 'Jean' AND p.lastname = 'Tremblay';

-- 12
SELECT o.*
FROM owner o
WHERE EXISTS (SELECT a.* FROM animal a, animal_type atype
								WHERE atype.typename = 'Cat' AND a.animaltype = atype.typeno AND o.ownerno = a.ownerno)
  AND EXISTS (SELECT a.* FROM animal a, animal_type atype
								WHERE atype.typename = 'Dog' AND a.animaltype = atype.typeno AND o.ownerno = a.ownerno);
								
 -- 13
SELECT o.*
FROM owner o
WHERE EXISTS (SELECT a.* FROM animal a, animal_type atype 
								WHERE atype.typename = 'Cat' AND a.animaltype = atype.typeno AND o.ownerno = a.ownerno)
  OR EXISTS (SELECT a.* FROM animal a, animal_type atype 
								WHERE atype.typename = 'Dog' AND a.animaltype = atype.typeno AND o.ownerno = a.ownerno);

-- 14								
SELECT o.*
FROM owner o
WHERE EXISTS (SELECT a.* FROM animal a, animal_type atype
								WHERE atype.typename = 'Cat' AND a.animaltype = atype.typeno AND o.ownerno = a.ownerno)
  AND NOT EXISTS (SELECT a.* FROM animal a, animal_type atype, prescription p, prescriptedtreatment pt
								WHERE atype.typename = 'Dog' AND a.animaltype = atype.typeno AND o.ownerno = a.ownerno
                      AND p.animalno = a.animalno AND pt.treatmentno = 5 AND pt.prescriptionno = p.pno);
					  
-- 15
SELECT a.*, table2.*
FROM animal a
LEFT JOIN (SELECT t.*, p.animalno
              FROM prescription p, treatment t, prescriptedtreatment pt
              WHERE p.pno = pt.prescriptionno AND pt.treatmentno = t.tno) as table2 ON a.animalno = table2.animalno
			  