const apiRouter = require('express').Router();
const userRouter = require('./userRouter');
const movieRouter = require('./movieRouter');

apiRouter.use('/users', userRouter);
apiRouter.use('/movies', movieRouter);

module.exports = apiRouter;