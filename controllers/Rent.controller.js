const {Rent, User, Movie} = require('../models');

module.exports.createRent = async (req, res, next) => {
    try {
        const {body} = req;
        const rent = await Rent.create(body);
        res.status(201).send({data: rent});
    } catch(error) {
         next(error)
    }
}

module.exports.getOne = async (req, res, next) => {
    try {
      const {params: {rentId}} = req;
      const rent = await Rent.findById(rentId).populate('movie').populate('user');
      res.status(200).send({data: rent})
    } catch(error) {
         next(error)
    }
}

module.exports.getAllUserRents = async (req, res, next) => {
    try {
        const {params: {userId}} = req;
        // повернути всі ренди цього користувача
        const allRents = await Rent.find({
            user: userId
        }).populate('user').populate('movie');
        res.status(200).send({data: allRents})
    } catch(error) {
        next(error)
    }
}

module.exports.update = async (req, res, next) => {
    try {
        const {params: {rentId}, body}= req;
        const updated = await Rent.findByIdAndUpdate(rentId, body, {returnDocument: 'after'});
        res.status(200).send({data: updated})
    } catch(error) {
         next(error)
    }
}
/*
Написати методи контроллера:
1. Переробити getOne з заселенням обох полів
2. Доробити метод getAllUserRents, який повертає всі rent конретного юзера
*/

