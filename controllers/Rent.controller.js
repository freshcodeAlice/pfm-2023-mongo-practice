// const {Rent, User, Movie} = require('../models/mongModels');
const {Rent, User, Movie} = require('../models');

module.exports.createRent = async (req, res, next) => {
    try {
        const {body: {userId, movieId, deadline, status}} = req;
        // const rent = await Rent.create(body);
        const user = await User.findByPk(userId);
        const movie = await Movie.findByPk(movieId);
        const result = await user.addMovie(movie, {
            through: {
                deadline, status
            }});
        res.status(201).send({data: result});
    } catch(error) {
         next(error)
    }
}

module.exports.getOne = async (req, res, next) => {
    try {
      const {params: {rentId}} = req;
    //   const rent = await Rent.findById(rentId).populate('movie').populate('user');
    const rent = await Rent.findAll({
        where: {
            id: rentId
        },
        include: [User, Movie]
    });
    // тут потрібно окремо витягти інфу про юзера і його ренту і інфу про фільм
      res.status(200).send({data: rent})
    } catch(error) {
         next(error)
    }
}

module.exports.getAllUserRents = async (req, res, next) => {
    try {
        const {params: {userId}} = req;
        // повернути всі ренди цього користувача
        // const allRents = await Rent.find({
        //     user: userId
        // }).populate('user').populate('movie');
        // res.status(200).send({data: allRents})
    } catch(error) {
        next(error)
    }
}

module.exports.update = async (req, res, next) => {
    try {
        const {params: {rentId}, body}= req;
        const updated = await Rent.update(body, {
            where: {
                id: rentId
            }
        });
        res.status(200).send({data: updated})
    } catch(error) {
         next(error)
    }
}