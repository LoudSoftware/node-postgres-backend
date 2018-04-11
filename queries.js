var promise = require('bluebird');

var options = {
    // Initialization Options
    promiseLib: promise
};


require('dotenv').config();


var connectionstring = process.env.DB_CONNECTION_STRING;
console.log('Connected to: ' + connectionstring);
// Just making sure to print only useful stuff to console

var pgp = require('pg-promise')(options);
var db = pgp(connectionstring);

function getAllAnimals(req, res, next) {
    db.any('select a.*, c.clinicname, o.firstname, o.lastname, at.typename from animal a, clinic c, animal_type at, owner o where a.clinicno = c.clinicno AND at.typeno = a.animaltype AND o.ownerno = a.ownerno')
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved ALL animals'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getAllPersonnel(req, res, next) {
    db.any('select p.*, c.clinicname as clinicname from personnel p, clinic c where p.clinicno = c.clinicno')
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved ALL personnel'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getAllPersonnelFromPosition(req, res, next) {
	var vet = req.params.id;
    db.any('select p.*, c.clinicname as clinicname from personnel p, clinic c where p.clinicno = c.clinicno AND p.personnelposition = $1', vet)
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved ALL peops of this position'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getExam(req, res, next) {
	var animalID = parseInt(req.params.id);
    db.any('select a.name, e.examdate, e.hour, e.description, v.firstname, v.lastname, t.cost from prescription p, examination e, personnel v, animal a, treatment t where t.tno = 1 AND p.animalno = $1 AND a.animalno = $1 AND p.examno = e.eno AND v.personnelno = e.vetno', animalID)
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved examination of an animal'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getAllTreatments(req, res, next) {
    db.any('select t.* from treatment t')
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved treatments of an animal'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getTreatments(req, res, next) {
	var animalID = parseInt(req.params.id);
    db.any('select a.name, t.description, t.cost, pt.qtity FROM treatment t, prescription p, prescriptedtreatment pt, animal a where p.animalno = $1 AND a.animalno = $1 AND pt.prescriptionno = p.pno AND t.tno = pt.treatmentno', animalID)
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved treatments of an animal'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getSingleAnimal(req, res, next) {
    var animalID = parseInt(req.params.id);
    db.one('select a.*, c.clinicname, o.firstname, o.lastname, at.typename from animal a, clinic c, animal_type at, owner o where a.clinicno = c.clinicno AND at.typeno = a.animaltype AND o.ownerno = a.ownerno AND animalno = $1', animalID)
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved one animal'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getAllOwners(req, res, next) {
    db.any('select o.* from owner o')
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved all owners'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getOwner(req, res, next) {
    var ownerId = parseInt(req.params.id);
    db.one('select o.* from owner o where o.ownerno = $1', ownerId)
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved one owner'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function getAllClinics(req, res, next) {
    db.any('select c.*, p.firstname, p.lastname from clinic c, personnel p where c.manager = p.personnelno')
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved one owner'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function createAnimal(req, res, next) {
    db.none('insert into animal(name, bdate, inscriptiondate, clinicno, ownerno, animaltype, description, isalive)' +
            'values(${name}, ${bdate}, ${inscriptiondate}, ${clinicno}, ${ownerno}, ${animaltype}, ${description}, ${isalive})', req.body)
        .then(() => {
            res.status(200)
                .json({
                    status: 'success',
                    message: 'Quick and dirty, no integer parsing has been done yet'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function updateAnimal(req, res, next) {
    db.none('update animal set name=$1, bdate=$2, inscriptiondate=$3, clinicno=$4, ownerno=$5, animaltype=$6, description=$7, isalive=$8 where animalno=$9', [
            req.body.name,
            req.body.bdate,
            req.body.inscriptiondate,
            req.body.clinicno,
            req.body.ownerno,
            req.body.animaltype,
            req.body.description,
			req.body.isalive,
            req.params.id,
        ])
        .then(function () {
            res.status(200)
                .json({
                    status: 'success',
                    message: 'Updated puppy'
                });
        })
        .catch(function (err) {
            return next(err);
        });
}

function removeAnimal(req, res, next){
    var animalno = parseInt(req.params.id);
    db.result('delete from animal where animalno = $1', animalno)
        .then((result) => {
            /* jshint ignore:start */
            res.status(200)
                .json({
                    status: 'success',
                    message: `Removed ${result.rowCount} puppy`
                });
            /* jshint ignore:end */
        })
        .catch((err) => {
            return next(err);
        });
}


// add query functions

module.exports = {
    getAllAnimals: getAllAnimals,
	getAllPersonnel:getAllPersonnel,
	getAllPersonnelFromPosition: getAllPersonnelFromPosition,
	
	getAllTreatments: getAllTreatments,
	getTreatments: getTreatments,
	getExam: getExam,
	
	getAllOwners: getAllOwners,
    getSingleAnimal: getSingleAnimal,
	getOwner: getOwner,
	
	getAllClinics: getAllClinics,
	
    createAnimal: createAnimal,
    updateAnimal: updateAnimal,
    removeAnimal: removeAnimal,
};