

var promise = require('bluebird');

var options = {
    // Initialization Options
    promiseLib: promise
};


require('dotenv').config();


var connectionstring = process.env.DB_CONNECTION_STRING;
console.log(connectionstring);

var pgp = require('pg-promise')(options);
var db = pgp(connectionstring);

function getAllAnimals(req,res,next) {
    db.any('select * from animal, clinic')
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

function getAllPuppies(req, res, next) {
    db.any('select * from pups')
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

function getSinglePuppy(req, res, next) {
    var pupID = parseInt(req.params.id);
    db.one('select * from pups where id = $1', pupID)
        .then((data) => {
            res.status(200)
                .json({
                    status: 'success',
                    data: data,
                    message: 'Retrieved one puppy'
                });
        })
        .catch((err) => {
            return next(err);
        });
}

function createPuppy(req, res, next) {
    req.body.age = parseInt(req.body.age);
    db.none('insert into pups(name, breed, age, sex)' +
            'values(${name}, ${breed}, ${age}, ${sex})',
            req.body)
        .then(() => {
            res.status(200)
                .json({
                    status: 'success',
                    message: 'Inserted one puppy'
                });
        })
        .catch((err) => {
            return next(err);
        });
}


function updatePuppy(req, res, next) {
    db.none('update pups set name=$1, breed=$2, age=$3, sex=$4 where id=$5', [req.body.name, req.body.breed, parseInt(req.body.age),
            req.body.sex, parseInt(req.params.id)
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


function removePuppy(req, res, next) {
    var pupID = parseInt(req.params.id);
    db.result('delete from pups where id = $1', pupID)
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
    getAllPuppies: getAllPuppies,
    getSinglePuppy: getSinglePuppy,
    createPuppy: createPuppy,
    updatePuppy: updatePuppy,
    removePuppy: removePuppy,
    testDummy:testDummy,
    getAllAnimals:getAllAnimals,
};