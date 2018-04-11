var express = require('express');
var router = express.Router();

var db = require('../queries');

router.get('/api/animal', db.getAllAnimals);
router.get('/api/animal/:id', db.getSingleAnimal);
router.post('/api/animal/', db.createAnimal);
router.put('/api/animal/:id', db.updateAnimal);
router.delete('/api/animal/:id', db.removeAnimal);

router.get('/api/owner', db.getAllOwners);
router.get('/api/owner/:id', db.getOwner);

router.get('/api/owneranimals/:id', db.getAnimalsFromOwner);

router.get('/api/examination/:id', db.getExam);

router.get('/api/treatment/:id', db.getTreatments);

router.get('/api/allpersonnel', db.getAllPersonnel);

router.get('/api/allpersonnel/:id', db.getAllPersonnelFromPosition);

router.get('/api/clinics', db.getAllClinics);

router.get('/api/treatments', db.getAllTreatments);

module.exports = router;
