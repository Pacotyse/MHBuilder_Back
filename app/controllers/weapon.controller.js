const { weapon } = require('../models/index.datamapper');

const weaponController = {
  async getAll(req, res) {
    try {
      const data = await weapon.findAll();
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
  async getByType(req, res) {
    const { type } = req.params;
    try {
      const data = await weapon.findByType(type);
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },

  async getOne(req, res) {
    const { id } = req.params;
    if (id === []) {
      res.send("Cette page n'existe pas !");
    }
    try {
      const data = await weapon.findByPk(id);
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
};

module.exports = weaponController;
