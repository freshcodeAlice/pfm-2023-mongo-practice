const {Schema, model} = require('mongoose');

/*
2. Movie
*- name
- director
- studio
- genre: []
- prodictionDate
- duration - Number, >0
- actors: []
- rating - Number, 0-10

*/

const movieSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    director: String,
    studio: String,
    genre: [String],
    prodictionDate: Date,
    duration: {
        type: Number,
        validate: {
            validator: (v) => v > 0
        }
    },
    actors: [String],
    rating: {
        type: Number,
        min: [0, 'Rating must ge great than 0'],
        max: 10
    }
});

const Movie = model('Movie', movieSchema);

module.exports = Movie