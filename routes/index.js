var express = require('express');
var router = express.Router();

var db = require('../queries');

router.get('/api/dummytest', db.testDummy);

router.get('/api/animal', db.getAllAnimals);
router.get('/api/animal/:id', db.getSingleAnimal);
router.post('/api/animal/', db.createAnimal);
router.put('/api/animal/:id', db.updateAnimal);
router.delete('/api/animal/:id', db.removeAnimal);

router.get('/api/owner', db.getAllOwners);
router.get('/api/owner/:id', db.getOwner);

router.get('/api/examination/:id', db.getExam);

router.get('/api/treatments/:id', db.getTreatments);

router.get('/api/allpersonnel', db.getAllPersonnel);

router.get('/api/allpersonnel/:id', db.getAllPersonnelFromPosition);

module.exports = router;
