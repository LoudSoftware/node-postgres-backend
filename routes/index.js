var express = require('express');
var router = express.Router();

var db = require('../queries');

router.get('/api/dummytest', db.testDummy);

router.get('/api/animal', db.getAllAnimals);
// router.get('/api/animal/:id', db.getSingleAnimals);
// router.post('/api/animal', db.createAnimal);
// router.put('/api/animal/:id', db.updateAnimal);
// router.delete('/api/animal/:id', db.removeAnimal);


module.exports = router;
