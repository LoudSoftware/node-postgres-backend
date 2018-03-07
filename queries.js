var promise = require('bluebird');

var options = {
    // Initialization Options
    promiseLib: promise
};


require('dotenv').config();


var connectionstring = process.env.DB_CONNECTION_STRING;
console.log(connectionstring.slice(connectionstring.indexOf("@"), connectionstring.length));
// Just making sure to print only useful stuff to console

var pgp = require('pg-promise')(options);
var db = pgp(connectionstring);

function getAllAnimals(req, res, next) {
    db.any('select a.*, c.name as clinicname from animal a, clinic c')
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

function getSingleAnimal(req, res, next) {
    var animalID = parseInt(req.params.id);
    db.one('select * from animal where animalno = $1', animalID)
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

function createAnimal(req, res, next) {
    db.none('insert into animal(name, type, bdate, inscriptiondate, state, clinic, ownerno)' +
            'values(${name}, ${type}, ${bdate}, ${inscriptiondate}, ${state}, ${clinic}, ${ownerno})', req.body)
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
    db.none('update animal set name=$1, type=$2, bdate=$3, inscriptiondate=$4, state=$5, clinic=$6, ownerno=$7 where animalno=$8', [
            req.body.name,
            req.body.type,
            req.body.bdate,
            req.body.inscriptiondate,
            req.body.state,
            req.body.clinic,
            req.body.ownerno,
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
    db.result('delete from pups where animalno = $1', pupID)
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


function testDummy(req, res, next) {
    db.any('select * from dummytable')
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: "Retrieved all puppies"
                });
        })
        .catch((err) => {
            return next(err);
        });
}



// add query functions

module.exports = {
    testDummy: testDummy,
    getAllAnimals: getAllAnimals,
    getSingleAnimal: getSingleAnimal,
    createAnimal: createAnimal,
    updateAnimal: updateAnimal,
    removeAnimal: removeAnimal,
};