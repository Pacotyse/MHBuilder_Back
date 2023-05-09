const { skill } = require('../models/index.datamapper');

const skillController = {
  async getAll(req, res) {
    try {
      const data = await skill.findAll();
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
      const data = await skill.findByPk(id);
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
};

module.exports = skillController;
