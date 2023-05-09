const { armor } = require('../models/index.datamapper');

const armorController = {
  async getAll(req, res) {
    try {
      const data = await armor.findAll();
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
      const data = await armor.findByPk(id);
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
  async getAllByLoadout(req, res) {
    const { idLoadout } = req.params;
    try {
      const data = await armor.findAllByLoadout(idLoadout);
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
  async createOne(req, res) {
    const { idLoadout } = req.params;
    const { idArmor } = req.body;
    try {
      const newLoadout = await loadout.create({
        idLoadout, idArmor,
      });
      res.status(201).json(newLoadout);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while creating the record.');
    }
  },
};

module.exports = armorController;
