const {Schema, model} = require('mongoose');
const {addDays} = require('date-fns')

const DEFAULT_RENT_DEADLINE = 10;

const rentSchema = new Schema({
    movie: {
        type: Schema.Types.ObjectId,
        ref: 'Movie'
    },
    user: {
        type: Schema.Types.ObjectId,
        ref: 'User'
    },
    rentDate: {
        type: Date,
        default: new Date()
    },
    deadline: {
        type: Date,
        default: addDays(new Date(), DEFAULT_RENT_DEADLINE)
    },
    status: {
        type: String,
        enum: ['taken', 'returned', 'failed'],
        default: 'taken'
    }
});

// index == key
// ідентифікація: унікальність і існування значення

rentSchema.index({movie: 1, user: 1}, {unique: true});

const Rent = model('Rent', rentSchema);

module.exports = Rent;