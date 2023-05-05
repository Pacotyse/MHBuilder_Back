const { loadout } = require('../models/index.datamapper');

const loadoutController = {
  async getAll(req, res) {
    try {
      const data = await loadout.findAll();
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
      const data = await loadout.findByPk(id);
      res.json(data);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while getting the record.');
    }
  },
  async createOne(req, res) {
    const {
      name, description, weapon_id,
    } = req.body;
    try {
      const newLoadout = await loadout.create({
        name, description, weapon_id,
      });
      res.status(201).json(newLoadout);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while creating the record.');
    }
  },
  async updateOne(req, res) {
    const loadoutId = req.params.id;
    const {
      name, description, weapon_id,
    } = req.body;
    try {
      const data = await loadout.findByPk(loadoutId);
      const updatedLoadout = await loadout.update({
        id: data.id, name, description, weapon_id,
      });
      res.status(201).json(updatedLoadout);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while updating the record.');
    }
  },
  async deleteOne(req, res) {
    const loadoutId = req.params.id;
    try {
      const deletedData = await loadout.delete(loadoutId);
      res.status(201).json(deletedData);
    } catch (error) {
      console.error(error);
      res.status(500).send('An error occurred while deleting the record.');
    }
  },
};

module.exports = loadoutController;
