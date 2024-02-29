const rentRouter = require('express').Router();
const RentController = require('../controllers/Rent.controller');

rentRouter.post('/', RentController.createRent);
rentRouter.get('/:rentId', RentController.getOne);
rentRouter.put('/:rentId', RentController.update);
rentRouter.get('/user/:userId', RentController.getAllUserRents);


module.exports = rentRouter;