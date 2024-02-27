const {Schema, model} = require('mongoose');

/*
1. User
- firstName
- lastName
*- email,
- gender
- favouriteFilms: []
*/

const userSchema = new Schema({
    firstName: {
        type: String
    },
    lastName: {
        type: String
    },
    email: {
        type: String,
        required: true
    },
    gender: {
        type: String,
    },
    favouriteFilms: [String]
});

const User = model('User', userSchema);

module.exports = User;