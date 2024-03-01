// const {User, Movie} = require('../models/mongModels');
const {User, Movie} = require('../models');

module.exports.createOne = async (req, res, next) => {
    try {
        const {body} = req;
        const movie = await Movie.create(body);
        res.status(201).send({data: movie})
    } catch(error) {
        next(error)
    }
}

module.exports.getAll = async (req, res, next) => {
    try {
        const movies = await Movie.findAll();
        res.status(200).send({data: movies})
    } catch(error) {
        next(error)
    }
}

module.exports.getOne = async (req, res, next) => {
    try {
        const {params: {movieId}} = req;
        const movies = await Movie.findByPk(movieId);
        res.status(200).send({data: movies})
    } catch(error) {
        next(error)
    }
}

module.exports.updateOne = async (req, res, next) => {
    try {
        const {params: {movieId}, body} = req;
        const updated = await Movie.update(body, {
            where: {
                id: movieId
            }
        });
        res.status(200).send({data: updated})
    } catch(error) {
        next(error)
    }
}

module.exports.deleteOne = async (req, res, next) => {
    try {
        const {params: {movieId}} = req;
        const deleted = await Movie.destroy({
            where: {
                id: movieId
            }
        })
        res.status(200).send({data: deleted})
    } catch(error) {
        next(error)
    }
}
