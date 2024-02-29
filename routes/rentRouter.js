const rentRouter = require('express').Router();
const RentController = require('../controllers/Rent.controller');

rentRouter.post('/', RentController.createRent);
rentRouter.get('/:rentId', RentController.getOne);
rentRouter.put('/:rentId', RentController.update);


module.exports = rentRouter;