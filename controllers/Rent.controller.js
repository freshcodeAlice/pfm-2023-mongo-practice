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
      const rent = await Rent.findById(rentId);
      res.status(200).send({data: rent})
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