'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate({Movie, Rent}) {
      // define association here
      User.belongsToMany(Movie, {
        through: Rent,
        foreignKey: 'userId'
      });
//      User.hasMany(Rent);
    }
  }
  User.init({
    firstName: {
      field: 'first_name',
      type: DataTypes.STRING
    },
    lastName: {
      field: 'last_name',
      type: DataTypes.STRING
    },
    email: {
      type: DataTypes.STRING
    },
    gender: {
      type: DataTypes.STRING
    },
    favouriteFilms: {
      field: 'favourite_films',
      type: DataTypes.TEXT
    }
  }, {
    sequelize,
    modelName: 'User',
    tableName: 'users',
    underscored: true
  });
  return User;
};