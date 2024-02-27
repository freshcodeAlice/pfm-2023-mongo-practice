const userRouter = require('express').Router();
const UserController = require('../controllers/User.controller');

userRouter.post('/', UserController.createOne);
userRouter.get('/', UserController.getAll);
userRouter.get('/:userId', UserController.getOne);
userRouter.put('/:userId', UserController.updateOne);
userRouter.delete('/:userId', UserController.deleteOne);


module.exports = userRouter;