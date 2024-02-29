const apiRouter = require('express').Router();
const userRouter = require('./userRouter');
const movieRouter = require('./movieRouter');
const rentRouter = require('./rentRouter');

apiRouter.use('/users', userRouter);
apiRouter.use('/movies', movieRouter);
apiRouter.use('/rent', rentRouter)

module.exports = apiRouter;