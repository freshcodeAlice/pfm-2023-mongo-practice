'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('rents', {
      id: {
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
        type: Sequelize.INTEGER
      },
      movieId: {
        field: 'movie_id',
        type: Sequelize.INTEGER,
        references: {
          model: 'movies',
          key: 'id'
        }
      },
      userId: {
        field: 'user_id',
        type: Sequelize.INTEGER,
        references: {
          model: 'users',
          key: 'id'
        }
      },
      deadline: {
        type: Sequelize.DATE
      },
      status: {
        type: Sequelize.ENUM,
        values: ['taken', 'returned', 'failed'],
        defaultValue: 'taken'
      },
      createdAt: {
        field: 'created_at',
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        field: 'updated_at',
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('rents');
  }
};